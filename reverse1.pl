[append].
reverse1([],[]).
reverse1([X|H],L):-reverse1(H,Z),append(Z,[X],L).
