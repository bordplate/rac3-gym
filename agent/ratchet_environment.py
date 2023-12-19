import time
import numpy as np

from game import Vector3
from game import Game


class RatchetEnvironment:
    levels = [
        31,
        32,
        33,
        34,
        35,
        30
    ]

    def __init__(self):
        self.game = Game()

        self.current_level_index = 0

        self.timer = 0

        self.max_x = 0.0
        self.max_z = 0.0
        self.distance = 0.0
        self.last_distance_check = 0
        self.last_time_check = 0
        self.last_time_moved = 0

        self.reward_counters = {}

    def start(self):
        process_opened = self.game.open_process()
        while not process_opened:
            print("Waiting for process to open...")
            time.sleep(1)
            process_opened = self.game.open_process()

    def cycle_level(self):
        self.current_level_index += 1
        if self.current_level_index >= len(self.levels):
            self.current_level_index = 0

        self.game.set_level(self.levels[self.current_level_index])
            
    def stop(self):
        self.game.close_process()

    def reset(self):
        self.timer = 0
        self.max_x = 0
        self.max_z = 0
        self.distance = 0
        self.last_distance_check = 0
        self.last_time_check = 0
        self.last_time_moved = 0

        self.reward_counters = {
            'rewards/timeout_penalty': 0,
            'rewards/death_penalty': 0,
            'rewards/crash_penalty': 0,
            'rewards/damage_penalty': 0,
            'rewards/distance_reward': 0,
        }

        # Check that we've landed on the right level yet
        while self.game.get_current_level() != self.levels[self.current_level_index]:
            print("Waiting for Vidcomic level change...", end="\r")
            self.game.set_level(self.levels[self.current_level_index])
            self.game.frame_advance(blocking=False)

            time.sleep(0.0016)

        self.game.frame_advance()
        self.game.frame_advance()
        self.game.frame_advance()

        # Restart vidcomic
        self.game.set_vidcomic_state(2)

        if self.game.get_game_state() != 0:
            self.game.set_game_state(0)
            self.game.frame_advance()

        # Clear game inputs so we don't keep moving from the last episode
        self.game.set_controller_input(0)

        position = self.game.get_hero_position()
        self.max_x = position.x
        self.max_z = position.z

        self.game.set_health(100)

        # Step once to get the first observation
        return self.step(0)

    def step(self, action):
        state, reward, terminal = None, 0.0, False

        self.timer += 1

        if self.timer > 30 * 60 * 5:  # 5 minutes
            terminal = True
            self.reward_counters['rewards/timeout_penalty'] += 1
            reward -= 1.0

        actions_mapping = [
            0x0,     # No action
            0x20,    # Shoot
            0x40,    # Jump
            0x80,    # Punch
            0x2000,  # Left
            0x1000,  # Up
            0x8000,  # Right

            0x2000 | 0x20,  # Left + Shoot
            0x1000 | 0x20,  # Up + Shoot
            0x8000 | 0x20,  # Right + Shoot
            0x2000 | 0x40,  # Left + Jump
            0x1000 | 0x40,  # Up + Jump
            0x8000 | 0x40,  # Right + Jump
            0x2000 | 0x80,  # Left + Punch
            0x1000 | 0x80,  # Up + Punch
            0x8000 | 0x80,  # Right + Punch
        ]

        # Communicate game inputs with game
        self.game.set_controller_input(actions_mapping[action])

        pre_health = self.game.get_health()

        # Frame advance the game
        if not self.game.frame_advance() or not self.game.frame_advance():
            # If we can't frame advance, the game has probably crashed
            reward -= 1.0
            self.reward_counters['rewards/crash_penalty'] += 1
            terminal = True

        post_position = self.game.get_hero_position()
        post_rotation = self.game.get_hero_rotation()
        post_hero_state = self.game.get_hero_state()
        post_health = self.game.get_health()
        post_game_frame_count = self.game.get_game_frame_count()
        post_ammo = self.game.get_ammo()

        # Distance
        if post_position.x > self.max_x:
            self.distance += post_position.x - self.max_x
            self.max_x = post_position.x
            reward += 0.05
            self.reward_counters['rewards/distance_reward'] += 0.05

            self.last_time_moved = post_game_frame_count

        if post_position.z > self.max_z:
            self.distance += post_position.z - self.max_z
            self.max_z = post_position.z
            reward += 0.05
            self.reward_counters['rewards/distance_reward'] += 0.05

            self.last_time_moved = post_game_frame_count

        if self.distance - 20 > self.last_distance_check:
            self.last_distance_check = self.distance

            # Scale reward to time it took to get here, faster = more reward
            reward += np.max([5 - (post_game_frame_count - self.last_time_check) / 150, 1])

            self.last_time_check = post_game_frame_count
            self.reward_counters['rewards/distance_reward'] += 5 - (post_game_frame_count - self.last_time_check) / 60

        # Shame agent for not progressing distance in a long time
        if self.last_time_moved + 60 * 10 < post_game_frame_count:
            reward -= 0.5
            self.reward_counters['rewards/distance_reward'] -= 0.5
            terminal = True

        # Collision
        collisions, collision_types = self.game.get_collision_info()

        # Health and damage
        if post_health <= 0 or post_hero_state in [160, 161]:
            reward -= 1.0
            self.reward_counters['rewards/death_penalty'] += 1
            terminal = True
        elif post_health < pre_health:
            reward -= 0.5
            self.reward_counters['rewards/damage_penalty'] += 0.5

        # Normalize all state values
        state = [
            np.interp(self.game.get_health(), [-100, 100], [-1.0, 1.0]),
            np.interp(post_hero_state, [0, 256], [-1.0, 1.0]),
            np.interp(post_position.x, [0, 1000], [-1.0, 1.0]),
            np.interp(post_position.z, [0, 1000], [-1.0, 1.0]),
            np.interp(self.max_x, [0, 1000], [-1.0, 1.0]),
            np.interp(self.max_z, [0, 1000], [-1.0, 1.0]),
            np.interp(self.distance, [0, 1000], [-1.0, 1.0]),
            np.interp(self.game.get_current_frame_count(), [0, 999999], [-1.0, 1.0]),
            np.interp(post_ammo, [0, 100], [-1.0, 1.0]),
            np.interp(post_rotation.z, [-8, 8], [-1.0, 1.0]),
            *collisions,
            *collision_types,
        ]

        return np.array(state, dtype=np.float32), reward, terminal


# Just used for various tests of the environment
if __name__ == '__main__':
    env = RatchetEnvironment()
    env.start()

    steps = 0

    try:
        env.reset()

        last_checkpoint = None
        reward = 0.0

        while True:
            _state, r, done = env.step(np.random.choice([0, 1, 2, 3, 4, 6, 8, 10]))

            reward += r

            # Print the state and end with \r
            print(" ".join(["{:.1f}".format(x) for x in _state]), end="\r")

            if done:
                print(f"Reward: %.3f" % reward)
                reward = 0.0
                env.reset()

            steps += 1

    except KeyboardInterrupt:
        env.stop()
