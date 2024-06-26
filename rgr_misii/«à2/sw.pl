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


generate([P1::C1::B1,P2::C2::B2,P3::C3::B3,P4::C4::B4,P5::C5::B5]):- 
    swap([P1,P2,P3,P4,P5],[white,black,blue,red,green]),
    swap([C1,C2,C3,C4,C5],[white,black,blue,red,green]),
    swap([B1,B2,B3,B4,B5],[white,black,blue,red,green]).  

check(Res):-
    % not(member(Color::Color::_,Res)), 
    % not(member(Color::_::Color,Res)), 
    not(member(red::blue::_,Res)),
    not(member(red::_::blue,Res)),
    member(white::red::green,Res),
    member(black::green::blue,Res),
    member(_::blue::white,Res),
    (member(blue::black::_,Res);member(blue::_::black,Res)).
    

