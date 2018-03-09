% This function approximates a 2D shape on the selected plane (yz, xz, xy) 
% using the given points of the 3D object.  
%
% Input: caseNum - case number that indicates which plane the 3D points
%        will be mapped to (1 = yz, 2 = xz, 3 = xy)
%        points - 3xn matrix consisting of the object or obstacle's points
%
% Output: shape - 3xn matrix shape that has been mapped to the selected
%         plane
%

function shape = shapeApproximation(caseNum, points)

shape = zeros(2,4);

i = 1;
while i <= 4
    convertedPoints = zeros(2,length(points));
    furthestPoint = [0;0;0];  
    
    switch caseNum
        case 1
            convertedPoints = [points(2,:); points(3,:)];
            furthestPoint = getFurthestPoint(i, convertedPoints);
            shape(1,i) = 0;
            shape(2,i) = furthestPoint(1);
            shape(3,i) = furthestPoint(2);
        case 2
            convertedPoints = [points(1,:); points(3,:)];
            furthestPoint = getFurthestPoint(i, convertedPoints);
            shape(1,i) = furthestPoint(1);
            shape(2,i) = 0;
            shape(3,i) = furthestPoint(2);
        case 3
            convertedPoints = [points(1,:); points(2,:)];
            furthestPoint = getFurthestPoint(i, convertedPoints);
            shape(1,i) = furthestPoint(1);
            shape(2,i) = furthestPoint(2);
            shape(3,i) = 0;
    end
    
    i = i+1;
end

end