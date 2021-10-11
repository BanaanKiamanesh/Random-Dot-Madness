clear
close all
clc

%% Start

% Pentagon Vertices
x = [0, -10, -6, 6, 10];
y = [-10, -3, 8, 8, -3];

% Random Starting Point
i = randi([1, 5], 1);
Dotx = x(i);
Doty = y(i);

% Create Animating Objects for Penta and Dots
ChaoDots = animatedline('Color', 'w', 'LineStyle', 'none', 'Marker', '.');
Pentagon = animatedline('Color', 'w', 'LineStyle', 'default', 'LineWidth', 3);
Pentagon.addpoints([x, x(1)], [y y(1)]);

% Plot Properties
axis equal;axis off;
set(gcf, 'Color', 'k')
set(gca, 'Color', 'k')

while 1

    % Pick a Random Vertex
    Vertex = randi([1 5], 1);

    % Dont Wanna Have the same Vortex...
    if Vertex ~= i
        ChaoDots.addpoints(Dotx, Doty);
        drawnow limitrate;

        Dotx = (Dotx+x(Vertex))/2;
        Doty = (Doty+y(Vertex))/2;
        i = Vertex;
    end

end