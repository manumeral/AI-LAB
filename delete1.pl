delete1(_,[],[]).
delete1(A,[A|L],M):-!,delete1(A,L,M).
delete1(A,[X|L],[X|M]):-delete1(A,L,M).
