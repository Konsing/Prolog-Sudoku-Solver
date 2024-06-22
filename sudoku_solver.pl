shuffle([], [], []).
shuffle([H1|T1], [H2|T2], [H1,H2|T3]) :-
    shuffle(T1, T2, T3).

double([], []).
double([H|T], [H,H|T2]) :-
    double(T, T2).

no_duplicates(L1, L2) :-
    reverse(L1, R),
    remove_dups(R, RevL2),
    reverse(RevL2, L2).

remove_dups([], []).
remove_dups([H|T], [H|T2]) :-
    delete(T, H, NewT),
    remove_dups(NewT, T2).

same_elements(L1, L2) :-
    msort(L1, Sorted),
    msort(L2, Sorted).
