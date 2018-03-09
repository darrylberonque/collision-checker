% This function updates the simplex and direction of support vertex search
% depending on which points of the simplex will enclose the origin,
% indicating a collision.
%
% Output: collision - boolean value that returns true if a collision has
%         occured against an obstacle
%

function collision = getSimplex()
global D
global simplex
global numPoints

collision = false;
% Case in which simplex consists of two points (forms a line)
if numPoints == 2
    b = [simplex(1,1); simplex(2,1); simplex(3,1)];
    a = [simplex(1,2); simplex(2,2); simplex(3,2)];
    AB = b-a;
    AO = [0;0;0] - a;
    if dot(AB,AO) > 0
        D = cross(cross(AB,AO), AB);
        numPoints = 3;
    else
        simplex(1,1) = simplex(1,2);
        simplex(2,1) = simplex(2,2);
        simplex(3,1) = simplex(3,2);
        D = AO;
        numPoints = 2;
    end
    
% Case in which simplex consists of three points (forms a triangle)
elseif numPoints == 3
    c = [simplex(1,1); simplex(2,1); simplex(3,1)];
    b = [simplex(1,2); simplex(2,2); simplex(3,2)];
    a = [simplex(1,3); simplex(2,3); simplex(3,3)];
    AB = b-a;
    AC = c-a;
    AO = [0;0;0] - a;
    ABC = cross(AB, AC);
    
    if dot(cross(ABC,AC), AO) > 0
        if dot(AC,AO) > 0
            simplex(1,2) = a(1);
            simplex(2,2) = a(2);
            simplex(3,2) = a(3);
            D = cross(cross(AC,AO),AC);
            numPoints = 3;
        else
            if dot(AB,AO) > 0
                simplex(1,1) = b(1);
                simplex(2,1) = b(2);
                simplex(3,1) = b(3);
                simplex(1,2) = a(1);
                simplex(2,2) = a(2);
                simplex(3,2) = a(3);
                D = cross(cross(AB,AO),AB);
                numPoints = 3;
            else
                simplex(1,1) = a(1);
                simplex(2,1) = a(2);
                simplex(3,1) = a(3);
                D = AO;
                numPoints = 2;
            end
        end
    else
        if dot(cross(AB,ABC),AO) > 0
            if dot(AB,AO) > 0
                simplex(1,1) = b(1);
                simplex(2,1) = b(2);
                simplex(3,1) = b(3);
                simplex(1,2) = a(1);
                simplex(2,2) = a(2);
                simplex(3,2) = a(3);
                D = cross(cross(AB,AO),AB);
                numPoints = 3;
            else
                simplex(1,1) = a(1);
                simplex(2,1) = a(2);
                simplex(3,1) = a(3);
                D = AO;
                numPoints = 2;
            end
        else
            collision = true;
        end
    end
end
end