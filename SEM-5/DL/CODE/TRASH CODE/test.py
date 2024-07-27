import numpy as np

def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def sigmoid_derivative(x):
    return x * (1 - x)

# Input datasets
inputs = np.array([[0, 0], [0, 1], [1, 0], [1, 1]])
expected_output = np.array([[0], [1], [1], [0]])

epochs = 10000
lr = 0.5
inputLayerNeurons = 2
hiddenLayerNeurons = [5]  # List containing number of neurons in each hidden layer
outputLayerNeurons = 1

# Initialize weights and biases
def initialize_weights(input_size, output_size):
    return np.random.uniform(size=(input_size, output_size))

def initialize_bias(output_size):
    return np.random.uniform(size=(1, output_size))

weights = []
biases = []

# Input layer to first hidden layer
weights.append(initialize_weights(inputLayerNeurons, hiddenLayerNeurons[0]))
biases.append(initialize_bias(hiddenLayerNeurons[0]))

# Between hidden layers
for i in range(len(hiddenLayerNeurons) - 1):
    weights.append(initialize_weights(hiddenLayerNeurons[i], hiddenLayerNeurons[i + 1]))
    biases.append(initialize_bias(hiddenLayerNeurons[i + 1]))

# Last hidden layer to output layer
weights.append(initialize_weights(hiddenLayerNeurons[-1], outputLayerNeurons))
biases.append(initialize_bias(outputLayerNeurons))

# Training algorithm
for _ in range(epochs):
    layer_activations = [inputs]
    layer_outputs = []

    # Forward Propagation
    for i in range(len(weights)):
        activation = np.dot(layer_activations[-1], weights[i]) + biases[i]
        output = sigmoid(activation)
        layer_activations.append(activation)
        layer_outputs.append(output)

    predicted_output = layer_outputs[-1]

    # Backpropagation
    error = expected_output - predicted_output
    d_predicted_output = error * sigmoid_derivative(predicted_output)
    deltas = [d_predicted_output]

    for i in range(len(weights) - 1, 0, -1):
        error = deltas[-1].dot(weights[i].T)
        delta = error * sigmoid_derivative(layer_outputs[i - 1])
        deltas.append(delta)

    deltas.reverse()

    # Updating Weights and Biases
    for i in range(len(weights)):
        weights[i] += layer_activations[i].T.dot(deltas[i]) * lr
        biases[i] += np.sum(deltas[i], axis=0, keepdims=True) * lr

print("Final weights and biases after training:")
for i in range(len(weights)):
    print(f"Layer {i + 1} weights:", weights[i])
    print(f"Layer {i + 1} biases:", biases[i])

print("\nOutput from neural network after", epochs, "epochs:", predicted_output)
