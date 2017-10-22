double_header([X|[X|Rest]]).

no_doubletone([]).
no_doubletone([X]).
no_doubletone([X|[Y|[Z|Rest]]]).

samelength([],[]).
samelength([X|Rest1],[Y|Rest2]):-samelength(Rest1,Rest2).

length1([],0).
length1([X|Rest],ss(N)):-length1(Rest,N).

samelength1(L1,L2):-length1(L1,X),length1(L2,X).

last_element([X],X).
last_element([X|Rest],Y):-last_element(Rest,Y).

next_to(X,Y,[X|[Y|Rest]]).
next_to(X,Y,[Z|Rest]):-next_to(X,Y,Rest).

member(X,[X|_]).
member(X,[_|Rest]):-member(X,Rest).

append([],L,L).
append([X|Rest],L,[X|Rest1]):-append(Rest,L,Rest1).

last1(L,X):-append(_,[X],L).

next_to1(X,Y,L):-append(_,[X|[Y|_]],L).

our_member(X,L):-append(_,[X|_],L).

reverse_list([],[]).
reverse_list([H|T],L):-reverse_list(T,Z),append(Z,[H],L).

palindrom(L):-reverse_list(L,L).

sumlist([],0).
sumlist([X|Rest],Sum):-sumlist(Rest,SumRest),Sum is X+SumRest.

% maximum of two numbers %
% version 1 %
max(X,Y,X):-X>Y.
max(X,Y,Y):-X=<Y.

% version 2 %
max1(X,Y,X):-X>Y,!.
max1(X,Y,Y).

% maximum from the list %
max_list([X],X).
max_list([X|Rest],Max):-max_list(Rest,MaxRest),max(X,MaxRest,Max).

% ordered list %
ordered([X]).
ordered([X|[Y|Rest]]):-X=<Y,ordered([Y|Rest]).

% gcd %
gcd(X,X,X).
gcd(X,Y,Z):-X>Y,X1 is X-Y,gcd(X1,Y,Z);
		X<Y,gcd(Y,X,Z).

% adding element in the list %
add(A,[],[A]).
add(A,L,L):-member(A,L),!.
add(A,L,[A|L]).

efface(_,[],[]).
efface(A,[A|L],L):-!.
efface(A,[X|L],[X|L1]):-efface(A,L,L1).

delete1(_,[],[]).
delete1(A,[A|L],L1):-!,delete1(A,L,L1).
delete1(A,[X|L],[X|L1]):-delete1(A,L,L1).

substitute(_,[],_,[]).
substitute(A,[A|L],B,[B|M]):-!,substitute(A,L,B,M).
substitute(A,[X|L],B,[X|M]):-substitute(A,L,B,M).

sublist([],_).
sublist([X|L],[X|M]):-prefix(L,M).
sublist(L,[Y|M]):-sublist(L,M).
prefix([],_).
prefix([X|L],[X|M]):-prefix(L,M).

intersection([],L,[]).
intersection([X|L1],L2,[X|L3]):-our_member(X,L2),!,intersection(L1,L2,L3).
intersection([X|L1],L2,L3):-intersection(L1,L2,L3).

union([],L,L).
union([X|L1],L,L2):-our_member(X,L),!,union(L1,L,L2).
union([X|L1],L,[X|L2]):-union(L1,L,L2).

difference([],L,[]).
difference([X|L1],L,L2):-our_member(X,L),!,difference(L1,L,L2).
difference([X|L1],L,[X|L2]):-difference(L1,L,L2).
