clear
close all
clc

%% Parameter Declaration

% Vertex Coords
x = zeros(1, 3);
y = zeros(1, 3);
Length = 10;                        % Gon Length
x(2) = Length+x(1);
x(3) = x(1)+Length*cos(pi/3);

y(3) = y(1)+Length*sin(pi/3);
y(2) = y(1);

% Random Starting Point Selection
i = randi([1 3], 1);
Dotx = x(i);
Doty = y(i);

% Create Animating Objects for Penta and Dots
ChaoDots = animatedline('Color', 'w', 'LineStyle', 'none', 'Marker', '.');
Triangle = animatedline('Color', 'w', 'LineStyle', 'default', 'LineWidth', 3);
Triangle.addpoints([x, x(1)], [y y(1)]);

% Plot Properties
axis equal;axis off
set(gcf, 'Color', 'k')
set(gca, 'Color', 'k')

while 1

    % Add Points
    ChaoDots.addpoints(Dotx, Doty);
    drawnow limitrate

    % Choose a Random Vortex and Create new Dots
    Vertex = randi([1 3], 1);
    Dotx = (Dotx+x(Vertex))/2;
    Doty = (Doty+y(Vertex))/2;

end