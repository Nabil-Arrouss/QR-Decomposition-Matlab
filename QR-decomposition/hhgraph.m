
function hhgraph()
    % Asking 2D points via graphical input
    fprintf('Click on two points in the plot.\n');
    points = ginput(2);

    % Displaying points
    figure;
    plot(points(:, 1), points(:, 2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    hold on;

    % Extract the coordinates of the first and second points
    P = points(1, :)';
    P_prime = points(2, :)';

     % Compute the Householder transformation matrix using these points
    H = householder(P, P_prime);

    % Displaying the line of reflection. Representing the line of reflection between P and P_prime
    plot([P(1), P_prime(1)], [P(2), P_prime(2)], 'b--', 'LineWidth', 2);

    % Apply Householder transformation to the new point
    new_point = ginput(1)';
    transformed_point = H * new_point;

    % Displaying the new point and its reflection
    plot(new_point(1), new_point(2), 'gx', 'MarkerSize', 10, 'LineWidth', 2);
    plot(transformed_point(1), transformed_point(2), 'bx', 'MarkerSize', 10, 'LineWidth', 2);

    hold off;
    axis equal;
    title('Householder Transformation');
    legend('Original Points', 'Reflection Line', 'New Point', 'Transformed Point');
end
