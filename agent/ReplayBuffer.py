import torch
import numpy as np

from collections import namedtuple

from threading import Lock


Transition = namedtuple('Transition', ('state', 'action', 'reward', 'next_state',
                                       'done', 'hidden_state', 'cell_state'))
FullTransition = namedtuple('Transition', ('state', 'action', 'reward', 'next_state',
                                       'done', 'hidden_state', 'cell_state', 'next_hidden_state', 'next_cell_state'))
TransitionMessage = namedtuple('TransitionMessage', ('transition', 'worker_name'))

class EpisodeReplayBuffer:
    def __init__(self, capacity):
        self.capacity = capacity
        self.buffer = []
        self.worker_buffer = {}
        self.episode_boundaries = []
        self.position = 0
        self.lock = Lock()

        self.new_samples = 0

        self.device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    def add(self, state, action, reward, next_state, done, worker_id="default"):
        state = torch.tensor(state, dtype=torch.float32).to(self.device)
        action = torch.tensor(action, dtype=torch.int64).to(self.device)
        reward = torch.tensor(reward, dtype=torch.float32).to(self.device)
        next_state = torch.tensor(next_state, dtype=torch.float32).to(self.device)
        done = torch.tensor(done, dtype=torch.bool).to(self.device)

        # Add to worker buffer
        if worker_id not in self.worker_buffer:
            self.worker_buffer[worker_id] = []

        self.worker_buffer[worker_id].append((state, action, reward, next_state, done))

        # If last transition in episode, add to global buffer
        if done:
            self.position = (self.position + len(self.worker_buffer[worker_id])) % self.capacity

            with self.lock:
                self.buffer.extend(self.worker_buffer[worker_id])
                self.buffer = self.buffer[-self.capacity:]

                self.episode_boundaries.append(self.position)

                self.new_samples += len(self.worker_buffer[worker_id])

            self.worker_buffer[worker_id] = []

    def sample(self, episodes: int):
        """
        Sample a batch of episodes at the episode boundaries.
        """
        if len(self.episode_boundaries) < episodes:
            return [], [], [], [], []

        indices = np.random.choice(self.episode_boundaries, episodes, replace=True)

        self.lock.acquire()

        # Get the samples starting from the episode boundary until the next episode boundary
        samples = []
        for i in indices:
            end_index = self.position

            # Find the end
            for j in range(i, len(self.episode_boundaries)):
                if self.episode_boundaries[j] == i:
                    end_index = self.episode_boundaries[j+1]
                    break

            samples.extend(self.buffer[i:end_index])

        self.lock.release()

        if len(samples) <= 0:
            return [], [], [], [], []

        batch = Transition(*zip(*samples))
        states, actions, rewards, next_states, dones = map(lambda x: torch.stack(x).to(self.device), batch)

        self.new_samples = 0

        return states, actions, rewards, next_states, dones


class PrioritizedReplayBuffer:
    def __init__(self, capacity, alpha=0.6):
        self.capacity = capacity
        self.alpha = alpha
        self.buffer = []
        self.priorities = []
        self.position = 0
        self.lock = Lock()
        self.new_samples = 0

        self.device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    def add(self, state, action, reward, next_state, done, next_hidden_state, next_cell_state):
        max_priority = max(self.priorities, default=1.0)

        state = torch.tensor(state, dtype=torch.float32).to(self.device)
        action = torch.tensor(action, dtype=torch.int64).to(self.device)
        reward = torch.tensor(reward, dtype=torch.float32).to(self.device)
        next_state = torch.tensor(next_state, dtype=torch.float32).to(self.device)
        done = torch.tensor(done, dtype=torch.bool).to(self.device)

        next_hidden_state = next_hidden_state.detach().clone().to(self.device)
        next_cell_state = next_cell_state.detach().clone().to(self.device)

        # Link "current" hidden state to previous transitions' next_hidden_state
        if len(self.buffer) > 0:
            hidden_state = self.buffer[self.position-1][7]
            cell_state = self.buffer[self.position-1][8]
        else:
            hidden_state = next_hidden_state.detach().clone().to(self.device)
            cell_state = next_cell_state.detach().clone().to(self.device)

        self.lock.acquire()

        if len(self.buffer) < self.capacity:
            self.buffer.append((state, action, reward, next_state, done, hidden_state, cell_state, next_hidden_state, next_cell_state))
            self.priorities.append(max_priority)
        else:
            self.buffer[self.position] = (state, action, reward, next_state, done, hidden_state, cell_state, next_hidden_state, next_cell_state)
            self.priorities[self.position] = max_priority

        self.position = (self.position + 1) % self.capacity
        self.new_samples += 1

        self.lock.release()

    def sample(self, batch_size, beta=0.4):
        if not self.buffer:
            return [], [], [], [], []

        self.lock.acquire()

        priorities = np.array(self.priorities) ** self.alpha
        probabilities = priorities / priorities.sum()
        indices = np.random.choice(len(self.buffer), batch_size, replace=True, p=probabilities)
        samples = [self.buffer[idx] for idx in indices]

        total = len(self.buffer)
        weights = (total * probabilities[indices]) ** (-beta)
        weights /= weights.max()
        weights = np.array(weights, dtype=np.float32)

        self.lock.release()

        batch = FullTransition(*zip(*samples))
        states, actions, rewards, next_states, dones = map(lambda x: torch.stack(x).to(self.device), batch[:-4])

        self.new_samples = 0

        return states, actions, rewards, next_states, dones, indices, weights, *map(lambda x: torch.stack(x).squeeze(2).permute(1, 0, 2).contiguous(), batch[-4:])

    def update_priorities(self, indices, new_priorities):
        for idx, priority in zip(indices, new_priorities):
            self.priorities[idx] = priority

