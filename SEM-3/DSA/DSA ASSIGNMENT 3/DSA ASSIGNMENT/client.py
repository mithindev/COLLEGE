import socket
import struct

def send_file(conn, filename):
    try:
        # Send the length of the filename as a 4-byte integer
        conn.send(struct.pack('!I', len(filename)))
        # Send the filename with forward slashes
        conn.send(filename.replace('\\', '/').encode())
        print(f"Sending file: {filename}")
        with open(filename, 'rb') as f:
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
    host = '192.168.102.232'
    port = 12345

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
        client_socket.connect((host, port))

        action = input("Do you want to send or receive a file? (send/receive): ").lower()
        client_socket.send(action.encode())

        if action == "send":
            filename = input("Enter the filename to send: ")
            send_file(client_socket, filename)
        elif action == "receive":
            receive_file(client_socket)
        else:
            print("Invalid action. Closing the connection.")

if __name__ == "__main__":
    main()