pred(X,Y,[X|T]):-member(Y,T).
pred(X,Y,[Y|T]):-member(X,T).
