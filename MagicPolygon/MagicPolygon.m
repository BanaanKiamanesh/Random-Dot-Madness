clear
close all
clc

%% Parameters...
Gons = 3;                             % Number of Gons
Length = 10;                          % Length of the Gons
Angles = linspace(2*pi, 0, Gons+1);   % Create Angles of the Polygon
x = cos(Angles)*Length;               % Create Vortex X Coord
y = sin(Angles)*Length;               % Create Vortex Y Coord

% Random Starting Point Selection
i = randi([1, Gons], 1);
Dotx = x(i);
Doty = y(i);

% Create Animating Objects for Penta and Dots
ChaoDots = animatedline('Color', 'w', 'LineStyle', 'none', ...
    'Marker', '.', 'LineWidth', .5);
Polygon = animatedline('Color', 'w', 'LineStyle', 'default', ...
    'LineWidth', 3);
Polygon.addpoints(x, y);

% Plot Properties
axis equal;axis off
set(gcf, 'Color', 'k')
set(gca, 'Color', 'k')

while 1

    % Pick a Random Vertex
    Vertex = randi([1 Gons], 1);

    if (Vertex ~=  i)
        ChaoDots.addpoints(Dotx, Doty);
        drawnow limitrate;

        % Dont Wanna Have the same Vortex...
        Dotx = (Dotx+x(Vertex))/2;
        Doty = (Doty+y(Vertex))/2;
        i  =  Vertex;
    end

end