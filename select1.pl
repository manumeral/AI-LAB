%select1(X,[],[]).
select1(X,[X|L],L).
select1(X,[Y|L],[Y|L2]):-select1(X,L,L2).
