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

def decrypt_file(input_file, output_file, key):
    with open(input_file, 'rb') as file:
        nonce, tag, ciphertext = [file.read(x) for x in (16, 16, -1)]

    cipher = AES.new(key, AES.MODE_EAX, nonce)
    decrypted = cipher.decrypt_and_verify(ciphertext, tag)

    with open(output_file, 'wb') as file:
        file.write(decrypted)

def verify_integrity(file_path, root_hash):
    hashes = generate_hashes(file_path)
    constructed_tree = construct_merkle_tree(hashes)
    return root_hash == constructed_tree

# Example usage:
# Calculate and store Merkle tree root hash for file integrity verification
root_hash = construct_merkle_tree(generate_hashes('data.txt'))

# Generate an AES key (16 bytes) for encryption/decryption
key = get_random_bytes(16)

# Encrypt file
encrypt_file('data.txt', 'encrypted_file.txt', key)

# Decrypt file
decrypt_file('encrypted_file.txt', 'decrypted_file.txt', key)

# Verify file integrity using the Merkle tree root hash
verification_result = verify_integrity('decrypted_file.txt', root_hash)
print("File integrity verified:", verification_result)