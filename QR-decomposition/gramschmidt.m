% QR-decomposition using Gram-Schmidt ortogonalisation
% Q is orthogonal matrix 
% R is upper triangular matrix

function [Q, R] = gramschmidt(A)
    % Get the dimension of matrix A
    [n, m] = size(A);

    % Check if A is a square matrix
    if n ~= m
        error('Input matrix must be square.');
    end

    % Check the linear independence of columns of A using rank function
    % The rank must be equal to the number of columns for QR decomposition 
    if rank(A) < n
        error('Columns of A are not linearly independent. QR decomposition does not exist.');
    end

    %  Initialize matrices Q and R with zeros
    Q = zeros(n);
    R = zeros(n);

    % Compute the first column of Q and the first element of the diagonal in R
    R(1, 1) = norm(A(:, 1)); % Compute the norm of the first column of A
    Q(:, 1) = A(:, 1) / R(1, 1);  % Normalize the first column of A to get the first column of Q

    % Iteratively computes the remaining columns of Q and fill in the upper triangular part of R
    for k = 2:n
        v = A(:, k);    % 'v' represents the current column of A
        for ly = 1:k-1
           
            R(ly, k) = Q(:, ly)' * A(:, k); % Compute the elements of R 
            v = v - R(ly, k) * Q(:, ly); % Orthogonalize 'v' against the columns of Q

        end
       
        R(k, k) = norm(v); % Compute the diagonal elements of R
        Q(:, k) = v / R(k, k);  % Normalize 'v' to get the columns of Q
    end
end

% TEST:
% Test with an Identity Matrix

%A = eye(3);
% [Q, R] = gramschmidt(A);
% disp('Q:');
% disp(Q);
% disp('R:');
% disp(R);

% Test with a Random Square Matrix:
% 
% A = rand(4, 4);
% [Q, R] = gramschmidt(A);
% disp('Q:');
% disp(Q);
% disp('R:');
% disp(R);

% Non-square matrix
% A = [1, 2, 3; 4, 5, 6];  
%    [Q, R] = gramschmidt(A);

% A square matrix with linearly dependent columns
% A = [1, 2; 2, 4];  
%    [Q, R] = gramschmidt(A);