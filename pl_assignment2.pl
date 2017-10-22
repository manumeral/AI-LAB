add_int(X,0,X).
add_int(X,Y,Z):-X1 is X+1,Y1 is Y-1,add_int(X1,Y1,Z).

sub_int(X,0,X).
sub_int(X,Y,Z):-X1 is X-1,Y1 is Y-1,sub_int(X1,Y1,Z).

mult_int(X,0,Z):-Z is 0.
mult_int(X,Y,Z):-Y1 is Y-1,mult_int(X,Y1,Z1),Z is Z1+X.

div_int(0,_,Z):-Z is 0.
div_int(X,Y,Z):-X1 is X-Y,div_int(X1,Y,Z1),Z is Z1+1.

split_list([X|Rest],A,B):-X>0,!,split_list(Rest,[X|A],B).
split_list([X|Rest],A,B):-X<0,split_list(Rest,A,[X|B]).

count([],Z):-Z is 0.
count([X|Rest],Z):-X>100,!,count(Rest,Z1),Z is Z1+1.
count([X|Rest],Z):-X=<100,count(Rest,Z).

rep_first_element(_,[],[]).
rep_first_element(Y,[_|Rest],[Y|Rest]).

replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).

delete_element([_|T], 0, T).
delete_element([H|T], I, [H|R]):- I > -1, NI is I-1, delete_element(T, NI, R), !.
delete_element(L, _, L).

cutlast([X],[]).
cutlast([X|Rest],[X|Rest1]):-cutlast(Rest,Rest1).

trim(1,[X|Rest],Rest).
trim(N,[X|Rest],L):-N1 is N-1,trim(N1,Rest,L).

trimlast(N,[X],L):-N>0,cutlast([X],L).
trimlast(N,[H|T],L):-N>0,N1 is N-1,cutlast([H|T],L1),trimlast(N1,L1,L),!.
trimlast(_,[H|T],[H|T]).

double([],[]).
double([X],[X|X]).
double([H|T],[X|[X|T1]]):-double(T,T1).

fact(0,Z):-Z is 1.
fact(1,Z):-Z is 1.
fact(N,Z):-N1 is N-1,fact(N1,Z1),Z is Z1*N.

flat_list([],[]).
flat_list([H|T],L):-!,flat_list(H,L1),flat_list(T,L2),append(L1,L2,L).
flat_list(H,[H]).

mean(L,X):-sumlist(L,Sum),length(L,Length),X is Sum/Length.

%---------------------------------------------------------------------------------------------------------------------%

cola(0):-write('No bottle of coke on the wall.'),!.
cola(1):-write('1 bottle of coke on the wall'),put(10),write('1 bottle of coke'),put(10),write('You take one down and pass it around'),put(10),cola(0),!.
cola(A):-write(A),write(' bottles of coke on the wall'),put(10),write(A),write(' bottles of coke'),put(10),write('You take one down and pass it around'),put(10),B is A-1,cola(B),!.
