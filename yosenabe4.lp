% Yosenabe Q4


{target(X,Y,XX,YY) : area(XX,YY,_)} = 1 :- number(X,Y,_).
% Produce every possible combination

:- target(X,Y,XX,YY), X != XX, Y != YY.
% Remove cases where target is not in a straight line from start

:- {target(_,_,XX,YY) : area(XX,YY,A)} == 0, area(_,_,A).
% Count amount of target in each area, remove cases that have zero for any area

occupied(X,Y,PX,PY) :- target(X,Y,XX,YY), PX = X..XX, PY = Y..YY, X <= XX, Y <= YY.
occupied(X,Y,PX,PY) :- target(X,Y,XX,YY), PX = XX..X, PY = YY..Y, XX <= X, YY <= Y.
% defines occupied(X,Y,PX,PY): number originating in X,Y is using square PX,PY

:- occupied(X1,Y1,PX1,PY1), occupied(X2,Y2,PX2,PY2), X1 != X2, PX1 == PX2, PY1 == PY2.
:- occupied(X1,Y1,PX1,PY1), occupied(X2,Y2,PX2,PY2), Y1 != Y2, PX1 == PX2, PY1 == PY2.
% Remove cases where paths use the same square

:- #sum{N,X,Y : number(X,Y,N), target(X,Y,XX,YY), area(XX,YY,A)} != G, goal(A,G).
% Remove every case where numbers do not add up to goal sum


#show target/4.
