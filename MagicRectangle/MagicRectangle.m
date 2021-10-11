clear
close all
clc

%% Parameter Declaration

Length = 10;                    % Gon Length
x = zeros(1, 4);
y = zeros(1, 4);

x(2) = Length;
x(3) = Length;
y(3) = Length;
y(4) = Length;

% Random Starting Point Selection
i = randi([1, 4], 1);
Dotx = x(i);
Doty = y(i);

% Create Animating Objects for Penta and Dots
ChaoDots = animatedline('Color', 'w', 'LineStyle', 'none', 'Marker', '.');
Rectangle = animatedline('Color', 'w', 'LineStyle', 'default', 'LineWidth' ...
    , 3, 'MaximumNumPoints', 10000000);
Rectangle.addpoints([x, x(1)], [y y(1)]);

% Plot Properties
axis equal;axis off
set(gcf, 'Color', 'k')
set(gca, 'Color', 'k')

while 1

    % Pick a Random Vertex
    Vertex = randi([1 4], 1);

    % Dont Wanna Have the same Vortex...
    if Vertex ~= i
        ChaoDots.addpoints(Dotx, Doty);
        drawnow limitrate

        Dotx = (Dotx+x(Vertex))/2;
        Doty = (Doty+y(Vertex))/2;
        i = Vertex;
    end

end