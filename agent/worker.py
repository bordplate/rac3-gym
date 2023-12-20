from Agent import Agent
from Watchdog import Watchdog
from RatchetEnvironment import RatchetEnvironment
from ReplayBuffer import Transition, TransitionMessage

import pickle
import numpy as np

from redis import Redis


features = 43
sequence_length = 8

configuration = {
    "model": None,
    "epsilon": 0.005,
    "min_epsilon": 0.005,
}


def update_configuration(redis: Redis):
    configuration["epsilon"] = float(redis.get("epsilon")) if redis.get("epsilon") is not None else 1.0
    configuration["min_epsilon"] = float(redis.get("min_epsilon")) if redis.get("min_epsilon") is not None else 0.005


def start_worker():
    # Get paths from arguments
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--rpcs3-path", type=str, required=True)
    parser.add_argument("--process-name", type=str, required=True)
    parser.add_argument("--render", action="store_true", default=True)
    parser.add_argument("--force-watchdog", action="store_false")
    args = parser.parse_args()

    rpcs3_path = args.rpcs3_path
    process_name = args.process_name
    render = args.render

    # Make new environment and watchdog
    env = RatchetEnvironment()
    watchdog = Watchdog(env.game, rpcs3_path=rpcs3_path, process_name=process_name, render=render)

    # Randomized worker ID
    worker_id = np.random.randint(0, 999999)
    worker_id = f"worker-{worker_id}"

    # Watchdog starts RPCS3 and the game for us if it's not already running
    watchdog.start()
    env.start()

    # Connect to Redis
    redis = Redis(host="localhost", port=6379, db=0)

    update_configuration(redis)

    # Agent that we will use only for inference
    agent = Agent(gamma=0.99, epsilon=configuration["epsilon"], batch_size=0, n_actions=16, eps_end=configuration["min_epsilon"],
                  input_dims=features, lr=0, sequence_length=8)

    last_model_fetch_time = 0

    total_steps = 0
    episodes = 0
    scores = []

    # Start stepping through the environment
    while True:
        if float(redis.get("model_timestamp")) > last_model_fetch_time:
            # Load the latest model from Redis
            configuration["model"] = redis.get("model")
            if configuration["model"] is not None:
                agent.Q_eval.load_state_dict(pickle.loads(configuration["model"]))

        update_configuration(redis)

        agent.epsilon = configuration["epsilon"]
        agent.eps_min = configuration["min_epsilon"]

        if episodes > 0 and episodes % 5 == 0:
            env.cycle_level()

        agent.start_new_episode()
        state, _, _ = env.reset()

        state_sequence = np.zeros((sequence_length, features), dtype=np.float32)
        state_sequence[-1] = state

        accumulated_reward = 0
        steps = 0
        while True:
            action = agent.choose_action(state_sequence)
            state, reward, done = env.step(action)

            new_state_sequence = np.concatenate((state_sequence[1:], [state]))

            transition = Transition(state_sequence, action, reward, new_state_sequence, done, agent.hidden_state, agent.cell_state)
            message = TransitionMessage(transition, worker_id)

            # Pickle the transition and publish it to the "replay_buffer" channel
            data = pickle.dumps(message)
            redis.publish("replay_buffer", data)

            state_sequence = new_state_sequence

            accumulated_reward += reward
            steps += 1
            total_steps += 1

            if done:
                break

        scores.append(accumulated_reward)
        avg_score = np.mean(scores[-100:])

        print('episode:', episodes, 'steps:', total_steps, 'score: %.2f' % accumulated_reward,
              'avg score: %.2f' % avg_score,
              'eps: %.2f' % agent.epsilon if agent.epsilon > agent.eps_min else '')

        # Append score to Redis key "scores"
        redis.rpush("avg_scores", avg_score)

        episodes += 1


if __name__ == "__main__":
    # Catch Ctrl+C and exit gracefully
    try:
        start_worker()
    except KeyboardInterrupt:
        print("Exiting...")
        exit(0)
