% The function realize QR-decomposition with Householder algorithm
function [Q, R] = hhalg(A)
    % Extract the first column of A
    a = A(:, 1);

    % Compute the 2-norm of the first column
    a2 = norm(a);

    % Determine the sign for stability in computations
    % This helps in choosing the reflection direction to maximize numerical stability
    if a(1) > 0
        b2 = [-a2; zeros(length(a)-1, 1)];
    else
        b2 = [a2; zeros(length(a)-1, 1)];
    end

    % Compute the Householder vector
    u = a - b2;

    % Compute the 2-norm of the Householder vector
    u2 = norm(u);

    % Normalize the Householder vector
    v = u / u2;

    % Compute the Householder transformation matrix
    Hv = eye(size(A, 1)) - 2 * (v * v');

    % Compute the upper triangular matrix R
    R = Hv * A;

    % Set Q as the Householder matrix Hv
    Q = Hv;
end

% TEST:
% Test with identity matrix
% A = eye(3);
% [Q, R] = hhalg(A);
% disp('Q:');
% disp(Q);
% disp('R:');
% disp(R);
% 
% Test sing random sqare matrix
% A = rand(4, 4);
% [Q, R] = hhalg(A);
% disp('Q:');
% disp(Q);
% disp('R:');
% disp(R);
