% This function finds the furthest points in both directions of the x 
% and y coordinates. 
%
% Input: caseNum - case number that indicates which direction to search the
%        furthest point (1 = -x, 2 = +y, 3 = +x, 4 = -y) 
%        points - 2xn matrix consisting of the shapes points
%
% Output: shape - 3xn matrix shape that has been mapped to the selected
%         plane
%


function furthest = getFurthestPoint(caseNum, points) 

max = -10000000000;
maxIndex = 1;

min = 10000000000;
minIndex = 1;

switch caseNum
    case 1
        for i = 1:length(points)
            if points(1,i) < min
                min = points(1,i);
                minIndex = i;
            end
        end
    case 2
        for i = 1:length(points)
            if points(2,i) > max
                max = points(2,i);
                maxIndex = i;
            end
        end
    case 3
        for i = 1:length(points)
            if points(1,i) > max
                max = points(1,i);
                maxIndex = i;
            end
        end
    case 4
        for i = 1:length(points)
            if points(2,i) < min
                min = points(2,i);
                minIndex = i;
            end
        end
end


if caseNum == 1 || caseNum == 4
    furthest(1) = points(1,minIndex);
    furthest(2) = points(2,minIndex);
else 
    furthest(1) = points(1,maxIndex);
    furthest(2) = points(2,maxIndex);
end

end