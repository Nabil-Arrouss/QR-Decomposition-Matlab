% Thefunction gives the matrix of a Householder transformation 
function H = householder(P,P_prime)
    % Check if input vectors have the same size
    if length(P) ~= length(P_prime)
        error('Vectors P and P_prime must have the same length');
    end

n = length(P); % Length of the vectors
p_norm = norm(P);  % Norm (magnitude) of vector P

% Create a target vector P2 (based on length of P) along the first axis with the same norm as P
P2 = zeros(n, 1);
if P(1) > 0 
    P2(1) = -p_norm;  % If first element of P is positive, make P2's first element negative
else
    P2(1) = p_norm;  % If first element of P is not positive, P2's first element is positive
end

  % Compute the reflection vector (difference between P and P2) and normalize it
u = P-P2;
u_norm = norm(u);   % Norm of the reflection vector
v = u / u_norm;     % Normalized reflection vector

% Construct the Householder matrix (formula: H= I−2vv^T) I is the identity 
% matrix of dimension n.  
H = eye(n) - 2 * (v * v');

end

% TEST:

% P = [3; 4; 0];
% P_prime = [5; 0; 0];
% H = householder(P, P_prime);
% disp('Householder matrix:');
% disp(H);
% disp('Transformed vector:');
% disp(H * P);

% test with random vectors
% P = rand(3, 1);
% P_prime = rand(3, 1);
% H = householder(P, P_prime);
% disp('Householder matrix:');
% disp(H);
% disp('Transformed vector:');
% disp(H * P);

% Test with different lenghth
% P = [1; 2; 3];  
% P_prime = [1; 2]; 
% H = householder(P, P_prime);
