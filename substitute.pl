substitute(_,[],_,[]).
substitute(A,[A|L],B,[B|M]):-!,substitute(A,L,B,M).
substitute(A,[X|L],B,[X|M]):-substitute(A,L,B,M).
