function [E] = SMED(p)
% This function gives the centroid of triangles
% close all
% Co-ordinates

[LBx, UBx] = deal(0,10);
[LBy, UBy] = deal(0,10);

[~,n] = size(p);

f = @(x)ex2(x);% Distribution function;

% f = evalin('base','Model');

comb = combnk(1:3,2)';% Different combination of points possible

P = reshape(p,n/2,2);

bound = [LBx LBy; UBx UBy; UBx LBy; LBx UBy];

bound1 = [0,5;5,0;10,5;5,10];

Q = [P;bound;bound1;evalin('base','V')];

x = Q(:,1);
y = Q(:,2);

D = delaunayTriangulation(x,y);

vert = D.Points;

conn = D.ConnectivityList;

[r,s] = size(D.ConnectivityList);

e = zeros(r,3);

for i = 1:r
    
    points = vert(conn(i,:),:);
    
    F = reshape(f(points(comb(:),:)),2,s); % function values
    
    Dist = pdist2(points,points);% Distance matrix
    
    U = triu(Dist);% Get the upper triangular matrix elements
    
    U = U(:)';
    
    U(U==0) = [];% Get non zero elements
    
    e(i,:) = (prod(-F+1))./(U.^2);%
    
end

e = unique(e);

E = sum((e-min(e))/(max(e)-min(e)));


end





