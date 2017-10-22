sublist([],_).
sublist([A|L1],[A|L2]):-prefix(L1,L2),!.
sublist(L1,[A|L]):-sublist(L1,L).
prefix([],_).
prefix([X|L],[X|M]):-prefix(L,M).
