:-ensure_loaded(our_member).
set_difference([],L,[]).
set_difference([X|L1],L2,L3):-our_member(X,L2),!,set_difference(L1,L2,L3).
set_difference([X|L1],L2,[X|L3]):-set_difference(L1,L2,L3).
