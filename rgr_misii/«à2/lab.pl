:- op(100,xfy,'::').

del(X,[X|T],T). % удаление из списка
del(X,[Н|T],[Н|T1] ):-del(X, T, T1).

insert(X,L1,L):-del(X,L,L1). % добавление в список

% Пример использования:
% Результат: L = [2, 3, 1]
swap([],[]).
swap([X|L],P):-swap(L,L1), insert(X, L1, P).

pred(X,Y,[X|T]):-member(Y,T).
pred(X,Y,[_|T]):- pred(X,Y,T).

ans(X):-
    check(X),generate(X).


generate([P1::C1,P2::C2,P3::C3,P4::C4]):- 
    swap([P1,P2,P3,P4],[cup,glass,jug,jar]),
    swap([C1,C2,C3,C4],[water,milk,lemonade,kvas]). 

check(Res):-
    not(member(cup::milk,Res)), 
    not(member(cup::water,Res)),
    pred(_::lemonade,_::kvas,Res),
    pred(jug::_,_::lemonade,Res),
    not(member(jar::lemonade,Res)), 
    not(member(jar::water,Res)),
    pred(jar::_,glass::_,Res),
    pred(glass::_,_::milk,Res).
    

