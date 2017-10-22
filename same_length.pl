same_length([],[]).
same_length([X|L1],[Y|L2]):-same_length(L1,L2).
