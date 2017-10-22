:-ensure_loaded(permutation).
:-ensure_loaded(ordered).
permutation_sort([],[]).
permutation_sort(A,B):-permutation(A,B),ordered(B),!.
