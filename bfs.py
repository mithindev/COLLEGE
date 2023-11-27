from collections import deque

def findBlank(puzzle):
    for i in range(3):
        for j in range(3):
            if puzzle[i][j] == 0:
                return i, j

def possibleSteps(puzzle):
    moves = []
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    blankRow, blankCol = findBlank(puzzle)
    
    for direction in directions:

        new_row, new_col = blankRow + direction[0], blankCol + direction[1]

        if 0 <= new_row < 3 and 0 <= new_col < 3:
            new_puzzle = [row[:] for row in puzzle]
            new_puzzle[blankRow][blankCol], new_puzzle[new_row][new_col] = new_puzzle[new_row][new_col], new_puzzle[blankRow][blankCol]
            moves.append(new_puzzle)
    
    return moves

def checkSolution(puzzle):
    return puzzle == [
    [1, 2, 3],
    [8, 0, 4],
    [7, 6, 5]
]

def bfs(initialState):
    queue = deque([(initialState, [])])
    visited = set()
    
    while queue:
        currentState, path = queue.popleft()
        visited.add(tuple(map(tuple, currentState)))
        
        if checkSolution(currentState):
            return path
        
        for neighbor in possibleSteps(currentState):
            if tuple(map(tuple, neighbor)) not in visited:
                queue.append((neighbor, path + [neighbor]))
                visited.add(tuple(map(tuple, neighbor)))

    print("No solution, found!")
    return None  

initialState = [
    [1, 2, 3],
    [0, 8, 4],
    [7, 6, 5]
]

solution = bfs(initialState)

if solution:
    print("Solution steps:")
    for step in solution:
        print(step)
else:
    print("No solution found.")
