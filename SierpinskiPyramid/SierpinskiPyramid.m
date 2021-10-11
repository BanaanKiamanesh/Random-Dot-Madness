clear
close all
clc

%% Start and Initialize

% Start Coordinations of the Triangle
x = [sqrt(8/9), -sqrt(2/9), -sqrt(2/9), 0];    % Create Vortex X Coord
y = [0, sqrt(2/3), -sqrt(2/3), 0];             % Create Vortex Y Coord
z = [(-1/3), (-1/3), (-1/3), 1];               % Create Vortex Z Coord
MaxPointNum = 10000000;                        % Max Points in the Pyramid

% Random Starting Point Selection
i = randi([1 4], 1);
Dotx = x(i);
Doty = y(i);
Dotz = z(i);

% Create Animating Objects for Penta and Dots
ChaoDots = animatedline('Color', 'w', 'LineStyle', 'none', 'Marker', '.', ...
    'MaximumNumPoints', MaxPointNum);
Pyramid = animatedline('Color', 'b', 'LineStyle', 'default', 'LineWidth', 3);
Pyramid.addpoints([x x(1) x(3) x(4) x(2)], [y y(1) y(3) y(4) y(2)], [z z(1) z(3) z(4) z(2)]);

% Plot Properties
axis equal;axis off
set(gcf, 'Color', 'k')
set(gca, 'Color', 'k')
title('Chaotic Sierpinski Pyramid!', 'FontSize', 30, 'Color', 'w')

% Pyramid Rotation Props
t = 0;
adder = 2;
drawnow
pause(2)

while 1

    % Add Points
    ChaoDots.addpoints(Dotx, Doty, Dotz);
    drawnow limitrate

    % Create Points
    Vertex = randi([1 4], 1);
    Dotx = (Dotx+x(Vertex))/2;
    Doty = (Doty+y(Vertex))/2;
    Dotz = (Dotz+z(Vertex))/2;

    % Change the View Point
    view(t/150, 20);
    t = t + adder;

    if (t == 359)
        adder = adder*(-1);
    end

end