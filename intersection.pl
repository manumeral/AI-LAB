:-ensure_loaded(our_member).
intersection([],_,[]).
intersection([A|L1],L2,[A|L3]):-our_member(A,L2),!,intersection(L1,L2,L3).
intersection([X|L1],L2,L3):-intersection(L1,L2,L3).
