% This function takes in two shapes (2D) in the form of points and finds
% the support vertex of their simplex. 
%
% Input: A - 3xn matrix consisting of the points of the first shape
%        B - 3xn matrix consisting of the points of the second shape
%        D - 3x1 direction vector to search for support
% Output: p - 3x1 vector of the output support vertex of the A and B's
%         simplex
%

function p = getSupport(A, B, D)
global pointsA
global pointsB
global iP


maxA = -1000000000000;
indexA = 0;
for i = 1:length(A)
    currA = [A(1,i), A(2,i), A(3,i)];
    dotA = dot(currA, D);
    if dotA > maxA
        maxA = dotA;
        indexA = i;
    end
end
maxPointA = [A(1,indexA); A(2,indexA);  A(3,indexA)];

maxB = -1000000000000;
indexB = 0;
for i = 1:length(B)
    currB = [B(1,i), B(2,i), B(3,i)];
    if usedPoint(maxPointA,currB)
        continue;
    end
    dotB = dot(currB, -D);
    if dotB > maxB
        maxB = dotB;
        indexB = i;
    end
end
maxPointB = [B(1,indexB); B(2,indexB); B(3,indexB)];

pointsA(1,iP) = maxPointA(1);
pointsA(2,iP) = maxPointA(2);
pointsA(3,iP) = maxPointA(3);
pointsB(1,iP) = maxPointB(1);
pointsB(2,iP) = maxPointB(2);
pointsB(3,iP) = maxPointB(3);
iP = iP + 1;


p = maxPointA - maxPointB;
end