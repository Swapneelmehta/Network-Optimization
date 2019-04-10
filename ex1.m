function [z] = ex1(vert)

% This function gives the gaussian distribution in 3d 

% vert - it is a (n X 2) matix where row is the number of agents and
% columns are 'x'
% and 'y' respectively 

% Convention
% dx -> standard deviation in x 
% dy -> standard deviation in y
% A  -> Amplitude

A1 = 0.5;
A2 = 0.25;
dx1 = 7;
dy1 = 7;
dx2 = 3;
dy2 = 3;
sigma  = 1;


% Co-ordinates
x = vert(:,1);
y = vert(:,2);

z1 = A1*exp(-0.5*((x-dx1).^2+ (y-dy1).^2)/sigma^2)./(pi*sigma^2);

z2 = A2*exp(-0.5*((x-dx2).^2+ (y-dy2).^2)/sigma^2)./(pi*sigma^2);

z = z1+z2;


end

