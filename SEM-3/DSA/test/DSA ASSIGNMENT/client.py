import socket
import struct

import hashlib
from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes
import os

BLOCK_SIZE = 16  # AES block size in bytes

def generate_hashes(file_path):
    hash_list = []
    with open(file_path, 'rb') as file:
        while True:
            chunk = file.read(BLOCK_SIZE)
            if not chunk:
                break
            hash_list.append(hashlib.sha256(chunk).hexdigest())
    return hash_list

def construct_merkle_tree(hash_list):
    if len(hash_list) == 0:
        return None
    if len(hash_list) == 1:
        return hash_list[0]

    next_level = []
    for i in range(0, len(hash_list), 2):
        if i + 1 < len(hash_list):
            combined_hash = hashlib.sha256((hash_list[i] + hash_list[i + 1]).encode()).hexdigest()
            next_level.append(combined_hash)
        else:
            next_level.append(hash_list[i])
    return construct_merkle_tree(next_level)

def encrypt_file(input_file, output_file, key):
    cipher = AES.new(key, AES.MODE_EAX)
    with open(input_file, 'rb') as file:
        plaintext = file.read()
        ciphertext, tag = cipher.encrypt_and_digest(plaintext)

    with open(output_file, 'wb') as file:
        [file.write(x) for x in (cipher.nonce, tag, ciphertext)]

def send_file(conn, filename):
    try:
        root_hash = construct_merkle_tree(generate_hashes(filename))
        key = get_random_bytes(16)
        encrypt_file(filename, 'encrypted_file.txt', key)

        send_file = 'encrypted_file.txt'
        
        # Send the length of the filename as a 4-byte integer
        conn.send(struct.pack('!I', len(send_file)))
        # Send the filename with forward slashes
        conn.send(send_file.replace('\\', '/').encode())
        print(f"Sending file: {send_file}")
        with open(send_file, 'rb') as f:
            data = f.read(1024)
            while data:
                conn.send(data)
                data = f.read(1024)
    except Exception as e:
        print(f"Error during file transfer: {e}")
    finally:
        print("File sent successfully")

def receive_file(conn):
    try:
        # Receive the length of the filename as a 4-byte integer
        filename_len = struct.unpack('!I', conn.recv(4))[0]
        # Receive the filename with forward slashes
        filename = conn.recv(filename_len).decode().replace('\\', '/')
        print(f"Receiving file: {filename}")
        with open(filename, 'wb') as f:
            while True:
                data = conn.recv(1024)
                if not data:
                    break
                f.write(data)
    except Exception as e:
        print(f"Error during file transfer: {e}")
    finally:
        print("File received successfully")

def main():
    host = '192.168.132.207'
    port = 12345

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
        try:
            print(f"Attempting to connect to {host}:{port}")
            client_socket.connect((host, port))
            print("Connection established successfully")

            action = input("Do you want to send or receive a file? (send/receive): ").lower()
            client_socket.send(action.encode())

            if action == "send":
                filename = input("Enter the filename to send: ")
                send_file(client_socket, filename)
            elif action == "receive":
                receive_file(client_socket)
            else:
                print("Invalid action. Closing the connection.")
        except Exception as e:
            print(f"Error during connection: {e}")
        finally:
            # Close the connection after the file transfer is complete or in case of an error
            client_socket.close()

if __name__ == "__main__":
    main()

