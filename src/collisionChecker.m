
% This function checks the xy, yz, and xz plane in the rotating coordinate
% frame of the objects.
%
% Input: obs - 3xn matrix consisting of the obstacle points
%        obj - 3xn matrix consisting of object points
%
% Output: collision - boolean value that returns true if a collision has
%         occured against an obstacle
%

% Possibly replace with
function collision = collisionChecker(obj, obs)
collisionYZ = false;
collisionXZ = false;
collisionXY = false;

% Check collisions on each coordinate plane

% yz
yzObj = shapeApproximation(1, obj);
yzObs = shapeApproximation(1, obs);
collisionYZ = gjk(yzObj, yzObs);

% xz
xzObj = shapeApproximation(2, obj);
xzObs = shapeApproximation(2, obs);
collisionXZ = gjk(xzObj, xzObs);

% xy
xyObj = shapeApproximation(3, obj);
xyObs = shapeApproximation(3, obs);
collisionXY = gjk(xyObj, xyObs);

% Plot objects, cubes in this instance.
axis([0 3 0 3 -1 3]);
grid on;
plotcube([1 1 1], transpose(obj(:,1)), 0.8, [1 0 0]);
plotcube([1 1 1], transpose(obs(:,1)), 0.8, [0 1 0]);

collision = collisionXY && collisionYZ && collisionXZ;
end