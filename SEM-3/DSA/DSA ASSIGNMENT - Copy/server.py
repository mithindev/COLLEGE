import socket
import struct
import threading

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

def handle_client(conn, addr):
    print(f"Connected by {addr}")
    action = conn.recv(1024).decode().lower()
    if action == "receive":
        filename = input("Enter the filename to send: ")
        send_file(conn, filename)
    elif action == "send":
        receive_file(conn)
    else:
        print("Invalid action. Closing the connection.")

def main():
    host = "0.0.0.0"
    port = 12345
    stop_server = False 

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        server_socket.bind((host, port))
        server_socket.listen(1)

        print("Server is waiting for a connection...")

        while not stop_server:
            conn, addr = server_socket.accept()
            client_thread = threading.Thread(target=handle_client, args=(conn, addr))
            client_thread.start()
            stop_server = True

    server_socket.close()

if __name__ == "__main__":
    main()