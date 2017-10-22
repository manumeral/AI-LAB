:-ensure_loaded(select1).
permutation([],[]).
permutation(A,[X|B]):-select1(X,A,R),permutation(R,B).
