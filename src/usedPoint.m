% This function checks if a chosen support vertex has been previously
% chosen for the simplex.
%
% Input: pointA - 3x1 matrix representing the vertex from the first object
%        pointB - 3x1 matrix representing the vertex from the first object
%
% Output: shape - 3xn matrix shape that has been mapped to the selected
%         plane
%

function contains = usedPoint(pointA, pointB)
global pointsA
global pointsB

containsA = false;
containsB = false;
iA = 0;
iB = 0;
for i = 1:length(pointsA) 
    if pointA(1) == pointsA(1,i) && pointA(2) == pointsA(2,i) && pointA(3) == pointsA(3,i)
        containsA = true;
        iA = i;
        break;
    end
end

for i = 1:length(pointsB) 
    if pointB(1) == pointsB(1,i) && pointB(2) == pointsB(2,i) && pointB(3) == pointsB(3,i)
        containsB = true;
        iB = i;
        break;
    end
end

contains = (containsA && containsB) && (iA == iB);
end