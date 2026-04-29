% Yosenabe Q1


{target(X,Y,XX,YY) : area(XX,YY,_)} = 1 :- number(X,Y,_).
% Produce every possible combination

:- target(X,Y,XX,YY), X != XX, Y != YY.
% Remove cases where target is not in a straight line from start













#show target/4.