function [x] = page_rank(A, d, iterations)

% Initialize PageRank vector
n = size(A, 1);
x = ones(n, 1) / n;

for i = 1:iterations
    % Calculate new PageRank
    x = (1 - d) / n + d * (A * x);
end

% Normalize the PageRank vector
x = x / sum(x);

end
