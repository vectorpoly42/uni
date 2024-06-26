:-dynamic(flat/8).

flat(1,petrov, petr, petrovich, 204, 100, 3, 1000).
flat(2,ivanov, ivan, ivanobitch, 104, 60, 2, 500).
flat(3,salvatore, damon, vampirevich, 124, 80, 3, 800).
flat(4,allen, bartolomew, junior, 80, 40, 1, 200).
flat(1,petrov, vasily, petrovich, 204, 100, 3, 1000).
flat(3,salvatore, stephan, vampirevich, 124, 80, 3, 800).
flat(7,lysenko, igor, dmitrievich, 101, 60, 2, 600).
flat(6,smirnov, ivan, vasilyevich, 80, 40, 1, 100).
flat(10,scott, travis, igorevich, 214, 120, 4, 1200).

% Проверка наличия квартиры с жилой площадью больше 60 и меньше 100 кв.м
has_medium_sized_apartment :-
    flat(_, _, _, _, _, Area, _, _),
    Area > 60,
    Area < 100.

% Проверка наличия квартиры с жилой площадью больше 100 или меньше 60 кв.м
has_large_or_small_apartment :-
    flat(_, _, _,_, _, Area, _, _),
    (Area > 100 ; Area < 60).

% Проверка наличия квартиры с совпадающим номером и количеством комнат
has_matching_room_number :-
    flat(Number, Owner,_, _, _, _, Rooms, _),
    Number = Rooms,
    write('Lastname of the owner is '), write(Owner), nl,
    fail,
    !;
    write('No owners').
has_matching_room_number.

% Вывод фамилий владельцев квартир с заданной жилой площадью
get_owners_by_living_area(Area) :-
    flat(_, Owner,_, _, _, Area, _, _),
    write('Lastname of the owner is '), write(Owner), nl,
    fail,
    !;
    write('No owners').
get_owners_by_living_area(_).

% Проверка наличия двух квартир с совпадающим количеством комнат и общей площадью
has_duplicate_rooms_and_total_area :-
    flat(Number1, _,_, _, TotalArea, _, Rooms, _),
    flat(Number2, _,_, _, TotalArea, _, Rooms, _),
    Number1 \= Number2,
    write('Numbers of flats are '), write(Number1), write(' and '), write(Number2), nl,
    !.
    