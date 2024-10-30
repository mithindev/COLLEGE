import numpy as np
import matplotlib.pyplot as plt

# Step 1: Generate a 1D sine wave
x = np.linspace(0, 2 * np.pi, 500)  # 500 points between 0 and 2*pi
y = np.sin(x)  # sine wave

# Step 2: Reshape the sine wave into a 2D matrix for SVD
sine_matrix = y.reshape(-1, 1)  # reshaping sine wave into column vector

# Step 3: Perform SVD on the sine wave
U, S, VT = np.linalg.svd(sine_matrix, full_matrices=False)

# Step 4: Reconstruct the sine wave using different ranks
def reconstruct_sine_wave(rank):
    # Reconstruct sine wave using specified rank
    S_approx = np.zeros_like(S)
    S_approx[:rank] = S[:rank]
    reconstructed_matrix = (U[:, :rank] @ np.diag(S_approx[:rank]) @ VT[:rank, :])
    return reconstructed_matrix.flatten()

# Step 5: Visualize the original sine wave and reconstructed versions for different ranks
ranks = [1, 5, 10, 20, 50, 100]

plt.figure(figsize=(12, 8))

# Plot reconstructions at different ranks with the original sine wave overlapping
for i, rank in enumerate(ranks):
    plt.subplot(3, 3, i + 1)
    reconstructed_sine_wave = reconstruct_sine_wave(rank)
    
    # Plot the original sine wave
    plt.plot(x, y, label='Original', color='b', linestyle='--')
    
    # Plot the reconstructed sine wave
    plt.plot(x, reconstructed_sine_wave, label=f'Reconstructed (Rank {rank})', color='r')
    
    plt.title(f'Reconstruction (Rank {rank})')
    plt.grid(True)
    plt.legend(loc='upper right')

plt.tight_layout()
plt.show()
