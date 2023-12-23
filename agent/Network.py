import torch
import numpy as np

from torch import nn
import torch.nn.functional as F
import torch.optim as optim


class DeepQNetwork(nn.Module):
    def __init__(self, lr, feature_count, hidden_dims, n_actions, num_layers=3, lstm_units=256):
        super(DeepQNetwork, self).__init__()

        self.hidden_dims = hidden_dims
        self.n_actions = n_actions
        self.num_layers = num_layers
        self.hidden_dims_halved = int(hidden_dims/2)
        self.lstm_units = lstm_units

        # self.fc0 = nn.Linear(feature_count, self.hidden_dims)
        self.fc0 = nn.Linear(11, self.hidden_dims_halved)
        #self.bn0 = nn.BatchNorm1d(self.hidden_dims_halved)

        self.raycast_cnn = nn.Sequential(
            # First convolution layer
            nn.Conv1d(in_channels=2, out_channels=32, kernel_size=3, stride=1, padding=1),
            nn.LeakyReLU(),
            nn.MaxPool1d(kernel_size=2, stride=2),  # Reduces the size to 16

            # Second convolution layer
            nn.Conv1d(in_channels=32, out_channels=64, kernel_size=3, stride=1, padding=1),
            nn.LeakyReLU(),
            nn.MaxPool1d(kernel_size=2, stride=2),  # Reduces the size to 8

            # Flatten the output for the linear layer
            nn.Flatten(),

            # Linear layer to get the desired output size
            nn.Linear(64 * 4, self.hidden_dims_halved)  # 64 channels * 8 features
        )

        self.lstm = nn.LSTM(self.hidden_dims, lstm_units, num_layers, batch_first=True)

        self.fc1 = nn.Linear(self.hidden_dims, self.hidden_dims)
        self.bn1 = nn.BatchNorm1d(self.hidden_dims)
        self.fc2 = nn.Linear(self.hidden_dims, self.hidden_dims)
        self.bn2 = nn.BatchNorm1d(self.hidden_dims)

        self.fc3 = nn.Linear(self.hidden_dims, self.hidden_dims)
        self.bn3 = nn.BatchNorm1d(self.hidden_dims)

        # Output layer
        self.value_stream = nn.Linear(self.hidden_dims, 1)
        self.advantage_stream = nn.Linear(self.hidden_dims, self.n_actions)

        self.optimizer = optim.AdamW(self.parameters(), lr=lr, weight_decay=1e-4)

        self.scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
            self.optimizer,
            'max',
            factor=0.95,
            patience=50,
            threshold=0.5,
            min_lr=1.5e-6,
            threshold_mode='abs'
        )

        self.loss = nn.HuberLoss()
        self.device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
        self.to(self.device)

    def forward(self, state, hidden_state=None, cell_state=None):
        if hidden_state is None or cell_state is None:
            hidden_state = torch.zeros(self.num_layers, state.size(0), self.lstm_units).to(self.device)
            cell_state = torch.zeros(self.num_layers, state.size(0), self.lstm_units).to(self.device)

        x = F.leaky_relu(self.fc0(state[:, :, :11]), 0.01)
        # x = F.leaky_relu(self.fc0(state), 0.01)
        #x = self.bn0(x)

        # Parts of the state gets pre-processed by a CNN

        # Raycast states are the last 10 features of each observation
        batch_size, num_observations, feature_size = state.shape

        # Separate the raycasting data
        raycasting_data = state[:, :, -32:]  # Last 32 features are raycasting data

        # Reshape for batch processing:
        # New shape: [batch_size * num_observations, 2, 16]
        raycasting_data = raycasting_data.reshape(-1, 2, 16)

        # Process all raycasting data through the CNN in one go
        cnn_out = F.leaky_relu(self.raycast_cnn(raycasting_data), 0.01)

        # Reshape the CNN output back to [batch_size, num_observations, new_feature_size]
        cnn_out = cnn_out.reshape(batch_size, num_observations, -1)

        # Concatenate the CNN output with the non-raycasting part of state
        x = torch.cat((x, cnn_out), dim=2)

        # LSTM
        out, (hidden_state, cell_state) = self.lstm(x, (hidden_state, cell_state))

        x = F.leaky_relu(self.fc1(out[:, -1, :]), 0.01)
        x = self.bn1(x)

        x = F.leaky_relu(self.fc2(x), 0.01)
        x = self.bn2(x)

        x = F.leaky_relu(self.fc3(x), 0.01)
        x = self.bn3(x)

        value = self.value_stream(x)
        advantages = self.advantage_stream(x)

        actions = value + (advantages - advantages.mean(dim=1, keepdim=True))

        return actions, (hidden_state, cell_state)

    def freeze(self):
        for param in self.parameters():
            param.requires_grad = False
