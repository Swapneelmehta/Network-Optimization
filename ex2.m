function [z] = ex2(vert)

% This is an implementation of a complex surface

% vert - it is a (n X 2) matix where row is the number of agents and
% columns are 'x'
% and 'y' respectively 

% Co-ordinates
x = vert(:,1);
y = vert(:,2);

z = 0.1*exp(-sin(0.1*x.*y)) + 0.25*exp(-0.2*((x - 2).^2 + 0.1*(y - 2).^2))...
    + 0.3*exp(-0.5*((x - 5).^2 + 0.2*(y - 3).^2));

end

