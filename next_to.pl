next_to(X,Y,[X|[Y|Rest]]).
next_to(X,Y,[H|L]):-next_to(X,Y,L).
