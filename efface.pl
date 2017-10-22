efface(_,[],[]).
efface(A,[A|L],L):-!.
efface(A,[X|L],[X|L1]):-efface(A,L,L1).
