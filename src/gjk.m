
% This function iteratively checks if the simplex created by the 2D
% shapes A and B indicates a collision between the two.
%
% Input: A - 3xn matrix consisting of the points of the first shape
%        B - 3xn matrix consisting of the points of the second shape
%
% Output: collision - boolean value that returns true if a collision has
%         occured
%

function collision = gjk(A, B)
global prevPointA
global prevPointB
global D
global simplex
global numPoints
global pointsA
global pointsB
global iP

prevPointA = zeros(3,1);
prevPointB = zeros(3,1);
iP = 1;
pointsA = zeros(3,length(A));
pointsB = zeros(3,length(B));

% Setup firts direction of vector in search for support vertex
D = [pi/2; pi/2;0];
simplex = zeros(3,4);

% Find first point of the simplex
collision = false;
point = getSupport(A,B,D);
simplex(1,1) = point(1,1);
simplex(2,1) = point(2,1);
simplex(3,1) = point(3,1);
D = -point;
numPoints = 2;

% Iterate through support vertices to find an enclosing simplex that
% indicates a collision
while numPoints < 4
    a = getSupport(A,B,D);
    
    if dot(a,D) < 0
        collision = false;
        break;
    else
        simplex(1,numPoints) = a(1,1);
        simplex(2,numPoints) = a(2,1);
        simplex(3,numPoints) = a(3,1);
        if getSimplex() 
            collision = true;
            break;
        end
    end
end

end