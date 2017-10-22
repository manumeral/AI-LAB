:-ensure_loaded(our_member).
our_add(A,[],[A]).
our_add(A,L,L):-our_member(A,L),!.
our_add(A,L,[A|L]).
