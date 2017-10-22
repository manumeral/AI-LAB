:-ensure_loaded(our_member).
union([],L,L).
union([A|B],L1,L2):-our_member(A,L1),!,union(B,L1,L2).
union([A|B],L2,[A|L3]):-union(B,L2,L3).
