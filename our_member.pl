our_member(X,[X|_]).
our_member(X,[Y|Rest]):-our_member(X,Rest).
