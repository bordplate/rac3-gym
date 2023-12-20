import ctypes
import ctypes.wintypes as wintypes
import psutil
import struct

import numpy as np


# Windows API functions
OpenProcess = ctypes.windll.kernel32.OpenProcess
ReadProcessMemory = ctypes.windll.kernel32.ReadProcessMemory
WriteProcessMemory = ctypes.windll.kernel32.WriteProcessMemory
CloseHandle = ctypes.windll.kernel32.CloseHandle

# Constants
PROCESS_ALL_ACCESS = 0x1F0FFF


# Vector3
class Vector3(ctypes.Structure):
    _fields_ = [("x", ctypes.c_float),
                ("y", ctypes.c_float),
                ("z", ctypes.c_float)]

    def distance_to_2d(self, other):
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2) ** 0.5


class Process:
    def __init__(self, process_name, base_offset=0):
        self.process_name = process_name
        self.process = None
        self.process_handle = None
        self.base_offset = base_offset

    def open_process(self):
        self.process = None

        # Find the process in the process list
        while self.process is None:
            for process in psutil.process_iter(['pid', 'name']):
                if process.info['name'] == self.process_name:
                    self.process = process
                    break

            if self.process is None:
                print("RPCS3 process not found...")
                return False
            else:
                self.process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, self.process.info['pid'])
                print(f"RPCS3 process found. Handle: {self.process_handle}")

                return True

    def close_process(self):
        CloseHandle(self.process_handle)

    def read_memory(self, address, size):
        buffer = ctypes.create_string_buffer(size)
        bytes_read = ctypes.c_size_t()
        address = ctypes.c_void_p(self.base_offset + address)

        if ReadProcessMemory(self.process_handle, address, buffer, size, ctypes.byref(bytes_read)):
            return buffer.raw
        else:
            return None

    def write_memory(self, address, data):
        size = len(data)
        c_data = ctypes.create_string_buffer(data)
        bytes_written = ctypes.c_size_t()
        address = ctypes.c_void_p(self.base_offset + address)

        result = WriteProcessMemory(self.process_handle, address, c_data, size, ctypes.byref(bytes_written))

        return result

    def write_int(self, address, value):
        value_bytes = value.to_bytes(4, byteorder='big')
        if not self.write_memory(address, value_bytes):
            print("Failed to write memory.")

    def write_byte(self, address, value):
        value_bytes = value.to_bytes(1, byteorder='big')
        if not self.write_memory(address, value_bytes):
            print("Failed to write memory.")

    def write_float(self, address, value):
        # Float doesn't have a to_bytes function, so we use struct.pack for this one
        value = struct.pack('>f', value)
        if not self.write_memory(address, value):
            print("Failed to write memory.")

    def read_int(self, address):
        buffer = self.read_memory(address, 4)

        value = 0
        if buffer:
            value = int.from_bytes(buffer, byteorder='big', signed=False)

        return value

    def read_float(self, address):
        buffer = self.read_memory(address, 4)

        if buffer is None:
            return 0.0

        buffer = buffer[::-1]
        value = 0
        if buffer:
            # There's no float.from_bytes function
            value = ctypes.c_float.from_buffer_copy(buffer).value
        return value


class Game:
    offset = 0x300000000

    frame_count_address = 0x1B00000
    frame_progress_address = 0x1B00004
    input_address = 0x1B00008

    collision_info_address = 0x1B00010

    game_state_address = 0xee9334
    game_frame_count_address = 0xD6B8D4
    current_planet_address = 0xC1E438

    hero_position_address = 0xDA2870
    hero_rotation_address = 0xDA2880
    hero_state_address = 0xda4db4
    health_address = 0xda5040
    ammo_address = 0xDA42F8

    load_level_address = 0xEE9310
    destination_level_address = 0xEE9314

    vidcomic_state_address = 0xda5122

    def __init__(self):
        self.process = Process("rpcs3.exe", base_offset=self.offset)
        self.last_frame_count = 0
        self.must_restart = False

    def open_process(self):
        return self.process.open_process()

    def close_process(self):
        self.process.close_process()
        self.process = None

    def get_hero_position(self) -> Vector3:
        """Player position is stored in big endian, so we need to convert it to little endian."""
        hero_position_buffer = self.process.read_memory(self.hero_position_address, 12)

        if hero_position_buffer is None:
            return Vector3()

        # Flip each 4 bytes to convert from big endian to little endian
        hero_position_buffer = (hero_position_buffer[3::-1] +
                                hero_position_buffer[7:3:-1] +
                                hero_position_buffer[11:7:-1])

        hero_position = Vector3()
        ctypes.memmove(ctypes.byref(hero_position), hero_position_buffer, ctypes.sizeof(hero_position))

        return hero_position

    def get_hero_rotation(self) -> Vector3:
        """Player rotation is stored in big endian, so we need to convert it to little endian."""
        hero_rotation_buffer = self.process.read_memory(self.hero_rotation_address, 12)

        if hero_rotation_buffer is None:
            return Vector3()

        # Flip each 4 bytes to convert from big endian to little endian
        hero_rotation_buffer = (hero_rotation_buffer[3::-1] +
                                hero_rotation_buffer[7:3:-1] +
                                hero_rotation_buffer[11:7:-1])

        hero_rotation = Vector3()
        ctypes.memmove(ctypes.byref(hero_rotation), hero_rotation_buffer, ctypes.sizeof(hero_rotation))

        return hero_rotation

    def get_hero_state(self):
        return self.process.read_int(self.hero_state_address)

    def set_controller_input(self, controller_input):
        self.process.write_int(self.input_address, controller_input)

    def get_current_frame_count(self):
        frames_buffer = self.process.read_memory(self.frame_count_address, 4)
        frame_count = 0
        if frames_buffer:
            frame_count = int.from_bytes(frames_buffer, byteorder='big', signed=False)

        return frame_count

    def get_game_state(self):
        return self.process.read_int(self.game_state_address)

    def set_game_state(self, state):
        self.process.write_int(self.game_state_address, state)

    def get_game_frame_count(self):
        return self.process.read_int(self.game_frame_count_address)

    def get_current_level(self):
        return self.process.read_int(self.current_planet_address)

    def set_level(self, level):
        self.process.write_int(self.destination_level_address, level)
        self.process.write_int(self.load_level_address, 1)

    def set_vidcomic_state(self, state):
        self.process.write_byte(self.vidcomic_state_address, state)

    # Collision info is an array of 8 floats
    def get_collision_info(self):
        collisions = []
        types = []

        for i in range(16):
            collision = self.process.read_float(self.collision_info_address + i * 4 * 2)
            type = self.process.read_int(self.collision_info_address + i * 4 * 2 + 4)

            # Normalize
            collision = np.interp(collision, [-10, 60], [-1.0, 1.0])
            type = np.interp(type, [0, 1024*16], [-1.0, 1.0])

            collisions.append(collision)
            types.append(type)

        return collisions, types

    def get_health(self):
        return self.process.read_int(self.health_address)

    def set_health(self, health):
        self.process.write_int(self.health_address, health)

    def get_ammo(self):
        return self.process.read_int(self.ammo_address)

    def frame_advance(self, blocking=True):
        if self.must_restart:
            self.process.open_process()
            self.must_restart = False

        frame_count = self.get_current_frame_count()

        if blocking:
            while frame_count == self.last_frame_count:
                if self.must_restart:
                    self.process.open_process()
                    self.must_restart = False

                    return False

                frame_count = self.get_current_frame_count()

            self.last_frame_count = frame_count

        self.process.write_int(self.frame_progress_address, frame_count)

        return True

