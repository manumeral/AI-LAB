split_list([], [], []).
split_list([H|Rest], [H|L1], L2) :- H >= 0 ,split_list(Rest, L1, L2) , ! .
split_list([H|Rest], L1, [H|L2]) :- H < 0 ,split_list(Rest, L1, L2).


count([], 0).
count(L,X):-count_elems(L,0, X).

count_elems([],Acc,Acc).

count_elems([H|T], Acc, Count) :-
    H > 100,                            
    Acc1 is Acc+1,                  
    count_elems(T, Acc1, Count), !.   
count_elems([H|T], Acc, Count) :-
    H =< 100, count_elems(T,Acc, Count).
%=================================================================================================%

delete_nth(N, L, L1):- dnth(N, 1, L, L1).
dnth(_,Acc,[],[]).
dnth(N, Acc, [H|L], [H|L1]):- Acc \= N, Acc1 is Acc+1, dnth(N,Acc1,L,L1),!.
dnth(N, Acc,[H|L],L):- Acc = N.

replace_first([],_,_,[]).
replace_first([H|L],H,Y,[Y|L]).
replace_first([A|L],H,Y,[A|L1]):-replace_first(L,H,Y,L1).

%=================================================================================================%
delete_nth(1,[H|T],T).
delete_nth(N,[H|L],[H|L1]):-N > 1 , N1 is N-1, delete_nth(N1,L,L1),!.
delete_nth(_,L,L).
%=================================================================================================%
replace_nth(N,X, L, L1):- rnth(N, X,1, L, L1).

rnth(_,X,Acc,[],[]).
rnth(N, X,Acc, [H|L], [H|L1]):- Acc \= N, Acc1 is Acc+1, rnth(N,X,Acc1,L,L1),!.
rnth(N,X, Acc,[H|L],[X|L]):- Acc = N.
%=================================================================================================%
cut_last([X],[]).
cut_last([H|T],[H|T1]):-cut_last(T,T1).
%=================================================================================================%
trim(_,[],[]).
trim(N,[_|L],L1):-N >=1, N1 is N-1,trim(N1, L,L1),!.
trim(N,L,L):- N = 0
%=================================================================================================%
trim_last(_,[],[]).
trim_last(0,L,L).
trim_last(N,L,L1):-N >= 1, N1 is N-1, cut_last(L,L2),trim_last(N1,L2,L1).
%=================================================================================================%
double([X],[X,X]).
double([H|L], [H,H|L1]):- double(L,L1).
%=================================================================================================%
factorial(0,1).
factorial(1,1).
factorial(N, X):- N >= 0,N2 is N,N1 is N-1, factorial(N1, X1), X is X1*N2.
factorial(N,X):- N < 0,print("Nooh").
%=================================================================================================%
factoriala(N,X):-factorial_acc(N, 1, X).
factorial_acc(N,N,1).
factorial_acc(1,_,1).
factorial_acc(0,_,1).
factorial_acc(N, Acc, X):-Acc < N, Acc1 is Acc + 1,factorial_acc(N,Acc1,X1),X is X1*Acc1 .
factorial_acc(N,_,X):- N < 0, print("Nooh").
%=================================================================================================%
append([],L,L).
append([X|Rest],L,[X|Rest1]):-append(Rest,L,Rest1).
reverse1([],[]).
reverse1([H|T],L):-reverse1(T,Z),append(Z,[H],L).
%=================================================================================================%
reverse_acc(L,L1):-reversea(L,[],L1).
reversea([],Acc,Acc).
reversea([H|L],Acc,L1):-reversea(L,[H|Acc],L1).
%=================================================================================================%
our_member(X,[X|_]).
our_member(X,[_|Rest]):-our_member(X,Rest).
remove_dup([],[]).
remove_dup([H|L],L1):- our_member(H,L), remove_dup(L,L1),!.
remove_dup([H|L],[H|L1]):- remove_dup(L,L1).
%=================================================================================================%
remove_acc(L,L1):-removea(L,[],L1).
removea([],Acc,Acc).
removea([H|L],Acc,L1):- our_member(H,L),removea(L,Acc,L1),!.
removea([H|L],Acc,L1):-removea(L,[H|Acc],L1).
%=================================================================================================%
flatten([],[]):-!.
flatten([H|L],X):-flatten(H,L1),flatten(L,L2),append(L1,L2,X),!.
flatten(X,[X]).
%=================================================================================================%
sum([],0).
sum([H|L],X):- sum(L,X1), X is X1 + H.
count([],0).
count([H|T],X):- count(T,X1), X is X1+1.
mean([],0).
mean(L,X):- count(L,Z), sum(L,Y), X is Y/Z.
%=================================================================================================%
meanw([X],X).
meanw([],0).
meanw(L,X):-mean_acc(L,1,0,X).
mean_acc([],Acc,Sum,Mean):- Acc1 is Acc -1 ,Mean is Sum/Acc1.
mean_acc([H|T],Acc,Sum,Mean):-Sum1 is Sum + H, Acc1 is Acc +1, mean_acc(T,Acc1,Sum1,Mean).
%=================================================================================================%
interleave([],[],[]).
interleave([],L,L).
interleave(L,[],L).
interleave([H1|L1],[H2|L2],[H1|[H2|L]]):-interleave(L1,L2,L).
%=================================================================================================%
transpose([],[],[]).
transpose([H1|L1],[H2|L2],[(H1,H2)|L]):-transpose(L1,L2,L).
%=================================================================================================%
inner_product([],[],[]).
inner_product([H1|L1],[H2|L2],[Z|L]):- Z is H1*H2, inner_product(L1,L2,L).
%=================================================================================================%
append([],L,L).
append([X|Rest],L,[X|Rest1]):-append(Rest,L,Rest1).
postorder(node(X, L, R), Xs):-
  postorder(L, Ls),
  postorder(R, Rs),
  append(Ls, Rs, Xs1),
  append(Xs1, [X], Xs).
postorder(nil,[]).
%=================================================================================================%
preorder(node(X, L, R), Xs):-
 
  preorder(L, Ls),
  preorder(R, Rs),
  append([X], Ls, Xs1),
  append(Xs1,Rs,Xs).
  
preorder(nil,[]).
%=================================================================================================%

sort_quick(L,M):-quicksort(L,[],M).
quicksort([],Acc,Acc).
quicksort([H|T],R,M):-partition1(T,Lt,H,Gt),quicksort(Gt,R,Gt_sorted),quicksort(Lt,[H|Gt_sorted],M).
partition([],[],_,[]).
partition1([H|T],[H|T1],X,Gt):-H=<X,!,partition1(T,T1,X,Gt).
partition1([H|T],Lt,X,[H|T1]):-H>X,partition1(T,Lt,X,T1).
%=================================================================================================%
append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]):-append(Xs, Ys, Zs).
partition([X|Xs],Y,[X|Ls],Rs) :-X =< Y, partition(Xs,Y,Ls,Rs).
partition([X|Xs],Y,Ls,[X|Rs]) :-
  X > Y, partition(Xs,Y,Ls,Rs).
partition([],Y,[],[]).
quick_sort([X|Xs],Ys) :-
  partition(Xs,X,Left,Right),
  quick_sort(Left,Ls),
  quick_sort(Right,Rs),
  append(Ls,[X|Rs],Ys).
quick_sort([],[]).
%=================================================================================================%
bubble_sort(Xs, Ys):-
  append(Ws, [A,B|Zs], Xs),
  B < A,
  append(Ws, [B,A|Zs], Vs),
  bubble_sort(Vs, Ys), !.

swap1([X|[Y|Rest]],[Y|[X|Rest]]):-X>Y,!.
swap1([X|Rest],[X|Rest1]):-swap1(Rest,Rest1).
bubble_sort(Xs, Xs).
bubble_sort2([],[]).
bubble_sort2(A,B):-swap1(A,C),!,bubble_sort2(C,B).
bubble_sort2(A,A).
%=================================================================================================%
insertion_sort(Xs, Ys):-insertion_sort_1(Xs, [], Ys).

insertion_sort_1([], Ys, Ys).
insertion_sort_1([X|Xs], Ys0, Ys):-
  insert(Ys0, X, Ys1),
  insertion_sort_1(Xs, Ys1, Ys).

insert([Y|Ys], X, [Y|Zs]):-Y < X, !, insert(Ys, X, Zs).
insert(Ys, X, [X|Ys]).
%=================================================================================================%
seln_sort([X|Xs], [Y|Ys]):-
  minimum(Xs, X, Y),
  efface([X|Xs], Y, Zs),
  seln_sort(Zs, Ys).
seln_sort([], []).

                                                         
minimum([Y|Ys], X, Z):-
  Y =< X, !,
  minimum(Ys, Y, Z).
minimum([_|Ys], X, Z):-
  minimum(Ys, X, Z).
minimum([], X, X).

efface([Y|Xs], Y, Xs):-!.
efface([X|Xs], Y, [X|Zs]):-efface(Xs, Y, Zs).
%=================================================================================================%
append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]):-append(Xs, Ys, Zs).
inorder(node(X, L, R), Xs):-
 
  inorder(L, Ls),
  append([X], Ls, Xs1),
  inorder(R, Rs),
  append(Xs1,Rs,Xs).
  
inorder(nil,[]).
%=================================================================================================%
find([H|T],L,H):-our_member(H,L),!.
find([H|T],L,N):-find(T,L,N).

getpostorder(Pre,In,Post):-getpostorder1(Pre,In,[],Post).
getpostorder1(Pre,[],A,A).
getpostorder1(Pre,In,A,A1):-find(Pre,In,N),!,append(Left,[N|Right],In),getpostorder1(Pre,Right,A,R),getpostorder1(Pre,Left,A,L),append(L,R,L1),append(L1,[N],A1).

getpreorder(Post,In,Pre):-reverse_list(Post,Po),getpreorder1(Po,In,[],Pre).
getpreorder1(Po,[],A,A).
getpreorder1(Po,In,A,A1):-find(Po,In,N),!,append(Left,[N|Right],In),getpreorder1(Po,Left,A,L),getpreorder1(Po,Right,A,R),append([N|L],R,A1).

pattern(0):-write('No bottle of coke on the wall.'),!.
pattern(1):-!,write('1 bottle of coke on the wall'), nl, write('1 bottle of coke'), nl, write('You take one down and pass it around'), nl, pattern(0).
pattern(N):-write(N), write(' bottles of coke on the wall'), nl, write(N), write(' bottles of coke'), nl, write('You take one down and pass it around'), nl, N1 is N-1, pattern(N1).



dbA(['anun ','barun ','karun ']).
dbB(['kura ','tama ','misa ']).
dbC(['su ','kuru ','xanadu ']).
dbD(['unuri ','biuri ','siuri ']).
dbE(['bimo ','co ','lo ']).
dbF(['sonen ','ariten ','smitten ']).
dbG(['sicom ','ricom ','jicom ']).
dbH(['kana ','nafa ','rala ']).
dbI(['te ','shime ','gunime ']).
verse(0).
verse(A):-dbA(L1),pick(L1,E1),write(E1), dbB(L2),pick(L2,E2),write(E2), pick(L2,E3),write(E3), dbC(L3),pick(L3,E4),write(E4),nl,
  dbD(L4),pick(L4,E5),write(E5), dbE(L5),pick(L5,E6),write(E6), pick(L5,E7),write(E7), pick(L3,E8),write(E8),nl,
  dbF(L6),pick(L6,E9),write(E9), pick(L6,E10),write(E10), pick(L3,E11),write(E11),nl,
  dbH(L8),pick(L8,E12),write(E12), dbI(L9),pick(L9,E13),write(E13), pick(L9,E14),write(E14), pick(L3,E15),write(E15),nl,nl,A1 is A-1,verse(A1).
pick([], []).
pick(List, Elt) :-
        length2(List, Length),
        random(0, Length, Index),
        nth0(Index, List, Elt).

% ==================================================================== %

move(1,X,Y,_):-write('move top disc from '),write(X),write(' to '),write(Y),nl.
move(N,X,Y,Z):-N>1,M is N-1,move(M,X,Z,Y),move(1,X,Y,_),move(M,Z,Y,X).

% ==================================================================== %

plus(0,X,X).
plus(s(X),Y,s(Z)):- plus(X,Y,Z).

minus(0,X,X).
minus(X,0,X).
minus(s(X), s(Y), Z):- minus(X,Y,Z).

multsucc(0,Y,0).
multsucc(s(0),Y,Y).
multsucc(s(X),Y,Z1):- multsucc(X,Y,Z), plus(Y,Z,Z1).

less_than(0,s(X)).
less_than(s(X),s(Y)):-less_than(X,Y).

% ==================================================================== %

ackerman(0,N,N1):-!,N1 is N+1.
ackerman(M,0,X):-M1 is M-1,!, ackerman(M1,1,X).
ackerman(M,N,X):-N1 is N-1, ackerman(M,N1,Y), M1 is M-1, ackerman(M1,Y,X).

% ==================================================================== %

nexthigherpermutation(L, L1):- higherpermutation(L,L1), not(farhigherpermutation(L1,L)).
higherpermutation(L,L1):-permutation(L,L1), higher(L1, L).
higher([H1|T1],[H|T]):-H1>H,!.
higher([H|T1],[H|T]):-higher(T1,T).
farhigherpermutation(L1, L):- higherpermutation(L,L2), higher(L1,L2).

nexthigherpermute(L,L1):- reverse(L,L2), get2array(L2, R, M), append(R, M, X), reverse(X, L1).
get2array(L, R, M):- findpartition(L, L1, [H|L2]), justbigger(L1, H, X), substitute(X, L1, H, R1), reverse(R1, R), substitute(H, [H|L2], X, M).
findpartition([X|[Y|R]],[X|L1], L2):- X<Y, !,findpartition([Y|R], L1, L2).
findpartition([X|[Y|R]], [X], [Y|R]).
justbigger([R|L], H, R):- R>H,!.
justbigger([R|L], H, R):- justbigger(L, H, R).

% ==================================================================== %

preorder(nil,[]).
preorder(bt(Left,Root,Right),L):-preorder(Left,L1),preorder(Right,L2),append([Root|L1],L2,L).

inorder(nil,[]).
inorder(bt(Left,Root,Right),L):-inorder(Left,L1),inorder(Right,L2),append(L1,[Root|L2],L).

postorder(nil,[]).
postorder(bt(Left,Root,Right),L):-postorder(Left,L1),postorder(Right,L2),append(L1,L2,L3),append(L3,[Root],L).

% ==================================================================== %

find([H|T],L,H):-our_member(H,L),!.
find([H|T],L,N):-find(T,L,N).

getpostorder(Pre,In,Post):-getpostorder1(Pre,In,[],Post).
getpostorder1(Pre,[],A,A).
getpostorder1(Pre,In,A,A1):-find(Pre,In,N),!,append(Left,[N|Right],In),getpostorder1(Pre,Right,A,R),getpostorder1(Pre,Left,A,L),append(L,R,L1),append(L1,[N],A1).

% ==================================================================== %

getpreorder(Post,In,Pre):-reverse_list(Post,Po),getpreorder1(Po,In,[],Pre).
getpreorder1(Po,[],A,A).
getpreorder1(Po,In,A,A1):-find(Po,In,N),!,append(Left,[N|Right],In),getpreorder1(Po,Left,A,L),getpreorder1(Po,Right,A,R),append([N|L],R,A1).

% ==================================================================== %

insertbst(nil,X,bst(nil,X,nil)).
insertbst(bst(Left,Root,Right),X,bst(Left1,Root,Right)):-X=<Root,!,insertbst(Left,X,Left1).
insertbst(bst(Left,Root,Right),X,bst(Left,Root,Right1)):-X>Root,insertbst(Right,X,Right1).

min_in_tree(bst(nil,Root,_),Root).
min_in_tree(bst(Left,Root,_),N):-min_in_tree(Left,N).

delete_leaf(T,X,NT):-insertbst(NT,X,T).

linearize(nil,[]).
linearize(bst(Left,Root,Right),L):-linearize(Left,L1),linearize(Right,L2),append(L1,[Root|L2],L).

tree_sort(Xs, Ys):-make_tree(Xs, nil, T), linearize(T, Ys).
make_tree([], T, T).
make_tree([X|Xs], T, U):-insertbst(T,X, V),make_tree(Xs, V, U).

heapsort(L,L1):-inserttotree(L,nil,T), sortt(T, [], L1).
sortt(nil, L, L):-!.
sortt(T, L, L1):- findminbst(T, H), deletemin(T, T1), append(L,[H],L2), sortt(T1, L2, L1).
deletemin(bst(nil, Root, R), R):-!.
deletemin(bst(L, Root, R), bst(L1, Root, R)):-deletemin(L,L1).

% ==================================================================== %

path(L,L1):-select(H, L, R), pathfind(R, H, [H], L1).
pathfind([],H,L, L):-!.
pathfind(R, H, L, L1):- findnext(R,H,X), append(L, [X], L2), select(X, R, M), pathfind(M, X, L2, L1).
findnext([arc(X,Y)|R], arc(Z,X), arc(X,Y)).
findnext([arc(W,Y)|R], arc(Z,X), L):- findnext(R, arc(Z,X), L).

pathcycle(L,L1):-select(H, L, R), pathfind(R, H, [H], L1), cycle(H,L1).
cycle(arc(X,Y), [arc(Z,X)]):-!.
cycle(arc(X,Y), [arc(Z,W)|R]):-cycle(arc(X,Y), R).

% ==================================================================== %
