function rankedMatrix = rankMatrix(matrix)
% Get the number of rows and columns in the matrix
[m, n] = size(matrix);
% Initialize a matrix to store the ranks
rankedMatrix = zeros(m, n);
% Loop through each column of the matrix
for j = 1:n
    % Get the current column of the matrix
    column = matrix(:, j);
    % Sort the current column in ascending order
    [sortedColumn, index] = sort(column);
    % Loop through the sorted column and assign ranks
    for i = 1:m
        rankedMatrix(index(i), j) = m-i+1;
    end
end
end