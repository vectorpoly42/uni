% Оценки братьев
grade(aleksey, [4, 5]).
grade(leonid, [3, 2]).
grade(aleksandr, [2, 4]).

kuv().

% Правило для получения последних двух элементов списка
last_two_elements(List, Result) :-
    append(_, [X, Y], List),
    Result = [X, Y].

del(X,[X|T],T). % удаление из списка
del(X,[Н|T],[Н|T1] ):-del(X, T, T1).

insert(X,L1,L):-del(X,L,L1). % добавление в список

% Пример использования:
% Результат: L = [2, 3, 1]
swap([],[]).
swap([X|L],P):-swap(L,L1), insert(X, L1, P).

max(X, Y, Max) :- % поиск максимального из двух чисел
    (X >= Y -> Max = X ; Max = Y).

 find_next(G):- % поиск решения
    check(X,G),generate(X).

generate(X):- % генерация решения
    swap([2,3,4,5], X).

check(X,G):- % проверка решения
    [F|_] = X, 
    last_two_elements(G,Result),
    [A,B] = Result,
    ((A=5,B=5, F=2);
    (A=4,B=4,F=3);
    (A=3,B=3,F=3);
    (A\=B, max(A,B,Max), F=Max)),
    append(G, [F], Gn),
    length(Gn,Len),
    ((Len =< 30, find_next(Gn));
    (Len = 30,
    average(Gn, Avg),
    round_integer(Avg, FinalGrade),
    write("Final grade"),write(' '), writeln(FinalGrade),
    write("Grades list"), write(' '), writeln(Gn))).
    
% Предикат для вычисления среднего арифметического
average(List, Avg) :-
    sum_list(List, Sum),
    length(List, Len),
    Avg is Sum / Len.

% Предикат для округления до ближайшего целого числа
round_integer(X, Y) :-
    Y is round(X).

% Предикат для вычисления итоговой оценки
final_grade(Name) :-
    grade(Name, Grades),
    find_next(Grades).

main:-
    writeln("Aleksey"),final_grade(aleksey),nl,
    writeln("Leonid"),final_grade(leonid),nl,
    writeln("Aleksandr"),final_grade(aleksandr).

% цикл повторения выполнения Цели заданное число раз (N)
repeat(Goal,1):-Goal.
repeat(Goal,N):-
    not(not(Goal)), %стирание предыдущих подстановок
    M is N-1,repeat(Goal,M).
