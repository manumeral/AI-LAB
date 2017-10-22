%base%
same_length([],[]).
%inductive%
same_length([X|Z],[Y|U]):-same_length(Z,U).
%-------------------------------------------------------------%
double_header([X|[X|Rest]]).
%-------------------------------------------------------------%
no_doubletone([]).
no_doubletone([X]).
no_doubletone([X|[Y|[Z|Rest]]]).
%-------------------------------------------------------------%
length1([],0).
length1([X|Rest],inc(N)):-length1(Rest,N).
%-------------------------------------------------------------%
same_length1(L1,L2):-length1(L1,X),length1(L2,X).
%-------------------------------------------------------------%
last1([X],X).
last1([X|Rest],Y):-last1(Rest,Y).
%-------------------------------------------------------------%
next_to(X,Y,[X|[Y|Rest]]).
next_to(X,Y,[Z|Rest]):-next_to(X,Y,Rest).
%-------------------------------------------------------------%
our_member(X,[X|_]).
our_member(X,[_|Rest]):-our_member(X,Rest).
%-------------------------------------------------------------%
append([],L,L).
append([X|Rest],L,[X|Rest1]):-append(Rest,L,Rest1).
%-------------------------------------------------------------%
last2(L,X):-append(_,[X],L).
%-------------------------------------------------------------%
next_to1(X,Y,L):-append(_,[X|[Y|_]],L).
%-------------------------------------------------------------%
our_member1(X,L):-append(_,[X|_],L).
%-------------------------------------------------------------%
reverse1([],[]).
reverse1([H|T],L):-reverse1(T,Z),append(Z,[H],L).
%-------------------------------------------------------------%
palindrome(L):-reverse1(L,L).
%-------------------------------------------------------------%
sumlist([],0).
sumlist([X|Rest],Sum):-sumlist(Rest,SumRest), Sum is X+SumRest.
%-------------------------------------------------------------%
max(X,Y,X):-X>Y.
max(X,Y,Y):-X=<Y.
%-------------------------------------------------------------%
max_list([X],X).
max_list([X|Rest],Max):-max_list(Rest,MaxRest),max(X,MaxRest,Max).
%-------------------------------------------------------------%
ordered([]).
ordered([X]).
ordered([X|[Y|Rest]]):-X=<Y, ordered([Y|Rest]).
%-------------------------------------------------------------%
gcd(0,A,A).
gcd(A,0,A).
gcd(A,B,C):-max(A,B,A),gcd(A mod B,B,C);max(A,B,B),gcd(A,B mod A, C).
%-------------------------------------------------------------%
max1(X,Y,X):-X>Y,!.
max1(X,Y,Y).
%-------------------------------------------------------------%
our_add(A,[],[A]).
our_add(A,L,L):-our_member(A,L),!.
our_add(A,L,[A|L]).
%-------------------------------------------------------------%
efface(_,[],[]).
efface(A,[A|L],L):-!.
efface(A,[X|L],[X|M]):-efface(A,L,M).
%-------------------------------------------------------------%
delete1(_,[],[]).
delete1(A,[A|L],M):-!,delete1(A,L,M).
delete1(A,[X|L],[X|M]):-delete1(A,L,M).
%-------------------------------------------------------------%
substitute(_,[],_,[]).
substitute(A,[A|L],B,[B|M]):-!,substitute(A,L,B,M).
substitute(A,[X|L],B,[X|M]):-substitute(A,L,B,M).
%-------------------------------------------------------------%
sublist([],_).
sublist([X|L],[X|M]):-prefix(L,M),!.
sublist(L,[Y|M]):-sublist(L,M).
%-------------------------------------------------------------%
intersection([],L,[]).
intersection([X|L1],L2,[X|L3]):-our_member(X,L2),!,intersection(L1,L2,L3).
intersection([X|L1],L2,L3):-intersection(L1,L2,L3).
%-------------------------------------------------------------%
union([],L,L).
union([X|L1],L2,L3):-our_member(X,L2),!,union(L1,L2,L3).
union([X|L1],L2,[X|L3]):-union(L1,L2,L3).
%-------------------------------------------------------------%
length3([],0).
length3([H|T],N):-length3(T,N1), N is N1+1.
%-------------------------------------------------------------%
length4(L,N):-lengthace(L,0,N).
lengthace([],A,A).
lengthace([H|T],A,N):-A1 is A+1,lengthace(T,A1,N).
%-------------------------------------------------------------%
removeduplicate(L,M):-removeacc(L,[],M).
removeacc([],A,A).
removeacc([H|T],A,M):-our_member(H,A),!,removeacc(T,A,M).
removeacc([H|T],A,M):-removeacc(T,[H|A],M).
%-------------------------------------------------------------%
sort_quick(L,M):-quick_sort(L,[],M).
quick_sort([],A,A).
quick_sort([H|T],R,M):-partition(T,Lt,H,Gt),quick_sort(Gt,R,GtSorted),quick_sort(Lt,[H|GtSorted],M).
partition([],[],_,[]).
partition([H|T],[H|TLt],X,Gt):-H=<X,!,partition(T,TLt,X,Gt).
partition([H|T],Lt,X,[H|TGt]):-H>X,partition(T,Lt,X,TGt).
%-------------------------------------------------------------%
merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(UnsortedList,SortedList):-divide(UnsortedList,UnsortedList1,UnsortedList2),merge_sort(UnsortedList1,SortedList1),merge_sort(UnsortedList2,SortedList2),merge(SortedList1,SortedList2,SortedList).
divide([],[],[]).
divide([X],[X],[]).
divide([X|[Y|L]],[X|L1],[Y|L2]):-divide(L,L1,L2).
merge([X],[],[X]).
merge([],[X],[X]).
merge([X|L1],[Y|L2],[X|L3]):-X<Y,merge(L1,[Y|L2],L3).
merge([X|L1],[Y|L2],[Y|L3]):-X>Y,merge([X|L1],L2,L3).
merge([X|L1],[Y|L2],[X|[Y|L3]]):-X=Y,merge(L1,L2,L3).
%-------------------------------------------------------------%
recurseadd(A,0,A).
recurseadd(A,B,C):-A1 is A+1, B1 is B-1, recurseadd(A1,B1,C).
%-------------------------------------------------------------%
recursesub(A,0,A).
recursesub(A,B,C):-A1 is A-1, B1 is B-1, recursesub(A1,B1,C).
%-------------------------------------------------------------%
recursemul(A,1,A).
recursemul(A,B,C):-mult(A,0,B,C).
mult(A,A1,0,A1).
mult(A,A1,B,C):-recurseadd(A1,A,A2), B1 is B-1, mult(A,A2,B1,C).
%-------------------------------------------------------------%
recursediv(A,1,A).
recursediv(A,B,C):-div(A,0,B,C).
div(0,A1,B,A1).
div(A,A1,B,C):-A>=B,recursesub(A,B,A2), A3 is A1+1, div(A2,A3,B,C).
div(A,A1,B,A1):-A<B,!.
%-------------------------------------------------------------%
splitarr([],[],[]).
splitarr([X|Rest],[X|R],S):- X>=0, !, splitarr(Rest,R,S).
splitarr([X|Rest],R,[X|S]):-splitarr(Rest,R,S).
%-------------------------------------------------------------%
countabove([],0).
countabove([H|T],A):-H>100, !, countabove(T,A1), A is A1+1.
countabove([H|T],A):-countabove(T,A).
%-------------------------------------------------------------%
replacefirst([],_,_,[]).
replacefirst([H|T],H,L,[L|T]):-!.
replacefirst([X|T],H,L,[X|M]):-replacefirst(T,H,L,M).
%-------------------------------------------------------------%
replacenth(A,B,C):-replacen(A,B,1,C).
replacen([],B,X,[]).
replacen([H|T],B,B,T).
replacen([H|T],B,X,[H|M]):-X1 is X+1, replacen(T,B,X1,M).
%-------------------------------------------------------------%
replacenthb(A,B,C,D):-replacenb(A,B,1,C,D).
replacenb([],B,X,C,[]).
replacenb([H|T],B,B,C,[C|T]).
replacenb([H|T],B,X,C,[H|M]):-X1 is X+1, replacenb(T,B,X1,C,M).
%-------------------------------------------------------------%
cutlast([],[]).
cutlast([X],[]).
cutlast([H|T],[H|M]):-cutlast(T,M).
%-------------------------------------------------------------%
trim(N,L,L1):-trimm(N,L,0,L1).
trimm(N,[],X,[]).
trimm(N,L,N,L).
trimm(N,[H|T],X,M):-X1 is X+1, trimm(N,T,X1,M).
%-------------------------------------------------------------%
trimlast(N,L,L1):-reverse(L,X),trim(N,X,T),reverse(T,L1).
%-------------------------------------------------------------%
double([],[]).
double([H|T],[H|[H|M]]):-double(T,M).
%-------------------------------------------------------------%
factorial(0,1).
factorial(N,L):- N1 is N-1, factorial(N1,L1), L is L1*N.
%-------------------------------------------------------------%
factorial1(N,L):-factorialacc(N,1,L).
factorialacc(0,L,L).
factorialacc(N,X,L):- X1 is X*N, N1 is N-1, factorialacc(N1,X1,L).
%-------------------------------------------------------------%
reverse2(L,L1):- reverseacc(L,[],L1).
reverseacc([],L1,L1).
reverseacc([H|T],M,L1):-append([H],M,X), reverseacc(T,X,L1).
%-------------------------------------------------------------%
mean(L,X):-length3(L,N), sumlist(L,S), X is S/N.
%-------------------------------------------------------------%
mean1(L,X):-meanacc(L,0,0,X).
meanacc([],N,S,X):- X is S/N.
meanacc([H|T],N,S,X):- N1 is N+1, S1 is S+H, meanacc(T,N1,S1,X).
%-------------------------------------------------------------%
interleave(L1,L2,L):-inter1(L1,L2,L).
inter1([],L2,L):-append(M,L2,L).
inter1([H|T],L2,[H|L]):-inter2(T,L2,L).
inter2(L1,[],L):-append(M,L1,L).
inter2(L1,[H|T],[H|L]):-inter1(L1,T,L).
%-------------------------------------------------------------%
transpose([],[],[]).
transpose([H|L1],[T|L2],[[H,T]|L]):-transpose(L1,L2,L).
%-------------------------------------------------------------%
innerproduct([],[],0).
innerproduct([H|L1],[T|L2],M):-innerproduct(L1,L2,N), M is N + (H*T).
%-------------------------------------------------------------%
pattern(0):-write('No bottle of coke on the wall.'),!.
pattern(1):-!,write('1 bottle of coke on the wall'), nl, write('1 bottle of coke'), nl, write('You take one down and pass it around'), nl, pattern(0).
pattern(N):-write(N), write(' bottles of coke on the wall'), nl, write(N), write(' bottles of coke'), nl, write('You take one down and pass it around'), nl, N1 is N-1, pattern(N1).
%-------------------------------------------------------------%
flatten(List, Flattened):- flatten2(List,[], Flattened).
flatten2([], Flattened, Flattened).
flatten2([Item|Tail], L, Flattened):- flatten2(Item, L1, Flattened), flatten2(Tail, L, L1).
flatten2(Item, Flattened, [Item|Flattened]):- \+ is_list(Item).
%-------------------------------------------------------------%
plus(0,X,X).
plus(s(X),Y,s(Z)):- plus(X,Y,Z).
%-------------------------------------------------------------%
minus(0,X,X).
minus(X,0,X).
minus(s(X), s(Y), Z):- minus(X,Y,Z).
%-------------------------------------------------------------%
multsucc(0,Y,0).
multsucc(s(0),Y,Y).
multsucc(s(X),Y,Z1):- multsucc(X,Y,Z), plus(Y,Z,Z1).
%-------------------------------------------------------------%
less_than(0,s(X)).
less_than(s(X),s(Y)):-less_than(X,Y).
%-------------------------------------------------------------%
ackerman(0,N,N1):-!,N1 is N+1.
ackerman(M,0,X):-M1 is M-1,!, ackerman(M1,1,X).
ackerman(M,N,X):-N1 is N-1, ackerman(M,N1,Y), M1 is M-1, ackerman(M1,Y,X).
%-------------------------------------------------------------%
del(X,[X|L1],L1).
del(X,[Y|L1],[Y|L2]):-del(X,L1,L2).
permutation([],[]).
permutation(L,[X|P]):-del(X,L,L1), permutation(L1,P).
%-------------------------------------------------------------%
permutation1([],[]).
permutation1([X],[X]):-!.
permutation1([T|H],X):-permutation1(H,H1), append(L1,L2,H1), append(L1,[T],X1), append(X1,L2,X).
%-------------------------------------------------------------%
insertion_sort([],[]).
insertion_sort([H|T],L):-insertion_sort(T,L1), insert(H,L1,L).
insert(X,[],[X]).
insert(X,[H|T],[X|[H|T]]):-X=<H.
insert(X,[H|T],[H|T1]):-X>H,insert(X,T,T1).
%-------------------------------------------------------------%
select(X,[X|R],R).
select(X,[H|R],[H|R1]):-select(X,R,R1).
%-------------------------------------------------------------%
permutation2([],[]).
permutation2(L,[H|T]):-select(H,L,R),permutation2(R,T).
%-------------------------------------------------------------%
permutation_sort([],[]).
permutation_sort(L,L1):-permutation2(L,L1),ordered(L1),!.
%-------------------------------------------------------------%
selection_sort([],[]).
selection_sort(L,[H|T]):-least(H,L,R),selection_sort(R,T).
least(_,[],[]).
least(X,L,R):-select(X,L,R),smaller(X,R).
smaller(_,[]).
smaller(X,[H|T]):-X=<H,smaller(X,T).
%-------------------------------------------------------------%
mullist([],A,A).
mullist([H|T],A,X):-A1 is A*10+H, mullist(T,A1,X).
nextperm(L,L1):-mullist(L,0,X), perm(L,99999999999,X,L1).
perm(L,A,X,L1):- permutation(L,L2), mullist(L2, 0, Y), Y<A, Y>X, L1 is L2, A is Y, perm(L,Y,X,L2).
%-------------------------------------------------------------%
preorder(nil,[]).
preorder(bt(Left,Root,Right), M):- preorder(Left, L), preorder(Right, R), append([Root|L],R,M).
%-------------------------------------------------------------%
inorder(nil,[]).
inorder(bt(Left,Root,Right), M):- inorder(Left, L), inorder(Right, R), append(L,[Root|R],M).
%-------------------------------------------------------------%
postorder(nil,[]).
postorder(bt(Left,Root,Right), M):- postorder(Left, L), postorder(Right, R), append(L,R,X), append(X,[Root],M).
%-------------------------------------------------------------%
%--getpostorder(Pre, In, Post):- inorder(T,In), preorder(T, Pre), postorder(T, Post).-- %
%-------------------------------------------------------------%
getpostorder(Pre, In, Post):- getpostorder1(Pre, In, [], Post).
getpostorder1(Pre,[],A,A).
getpostorder1(Pre, In, A, Post):- findroot(Pre,In,H), append(L,[H|R],In), append([H],A,A1), getpostorder1(Pre, R, A1, Post1), getpostorder1(Pre, L, Post1, Post),!.
findroot([H|Pre], In, H):- our_member(H,In),!.
findroot([X|Pre], In, H):- findroot(Pre, In, H).
%-------------------------------------------------------------%
getpreorder(Post, In, Pre):- reverse(Post, Rpost), getpreorder1(Rpost, In, [], Pre).
getpreorder1(Post,[],A,A).
getpreorder1(Post, In, A, Pre):- findroot(Post,In,H), append(L,[H|R],In), append(A,[H],A1), getpreorder1(Post, L, A1, Pre1), getpreorder1(Post, R, Pre1, Pre),!.
%--findroot([H|Post], In, H):- our_member(H,In),!.--%
%--findroot([X|Post], In, H):- findroot(Post, In, H).--%
%-------------------------------------------------------------%
insertbst(H,nil,bst(nil,H,nil)):-!.
insertbst(H, bst(L,Root, R), bst(L1, Root, R)):- Root>=H, !, insertbst(H, L, L1).
insertbst(H, bst(L,Root, R), bst(L, Root, R1)):- insertbst(H, L, L1).
%-------------------------------------------------------------%
findminbst(bst(nil,H,R), H):-!.
findminbst(bst(L,X,R),H):-findminbst(L,H).
%-------------------------------------------------------------%
deletebst(T,H, NT):-insertbst(H, NT, T).
%-------------------------------------------------------------%
linearize(nil,[]).
linearize(bst(Left,Root,Right), M):- linearize(Left, L), linearize(Right, R), append(L,[Root|R],M).
%-------------------------------------------------------------%
treesort(L,L1):-inserttotree(L,nil,T), linearize(T,L1).
inserttotree([],A,A):-!.
inserttotree([H|T],Tree,Tree1):- insertbst(H, Tree, Tree2), inserttotree(T,Tree2,Tree1).
%-------------------------------------------------------------%
heapsort(L,L1):-inserttotree(L,nil,T), sortt(T, [], L1).
sortt(nil, L, L):-!.
sortt(T, L, L1):- findminbst(T, H), deletemin(T, T1), append(L,[H],L2), sortt(T1, L2, L1).
deletemin(bst(nil, Root, R), R):-!.
deletemin(bst(L, Root, R), bst(L1, Root, R)):-deletemin(L,L1).
%-------------------------------------------------------------%
path(L,L1):-select(H, L, R), pathfind(R, H, [H], L1).
pathfind([],H,L, L):-!.
pathfind(R, H, L, L1):- findnext(R,H,X), append(L, [X], L2), select(X, R, M), pathfind(M, X, L2, L1).
findnext([arc(X,Y)|R], arc(Z,X), arc(X,Y)).
findnext([arc(W,Y)|R], arc(Z,X), L):- findnext(R, arc(Z,X), L).
%------------------------------------------------------------%
pathcycle(L,L1):-select(H, L, R), pathfind(R, H, [H], L1), cycle(H,L1).
cycle(arc(X,Y), [arc(Z,X)]):-!.
cycle(arc(X,Y), [arc(Z,W)|R]):-cycle(arc(X,Y), R).
%-----------------------------------------------------------%
nexthigherpermutation(L, L1):- higherpermutation(L,L1), not(farhigherpermutation(L1,L)).
higherpermutation(L,L1):-permutation(L,L1), higher(L1, L).
higher([H1|T1],[H|T]):-H1>H,!.
higher([H|T1],[H|T]):-higher(T1,T).
farhigherpermutation(L1, L):- higherpermutation(L,L2), higher(L1,L2).
%----------------------------------------------------------%
nexthigherpermute(L,L1):- reverse(L,L2), get2array(L2, R, M), append(R, M, X), reverse(X, L1).
get2array(L, R, M):- findpartition(L, L1, [H|L2]), justbigger(L1, H, X), substitute(X, L1, H, R1), reverse(R1, R), substitute(H, [H|L2], X, M).
findpartition([X|[Y|R]],[X|L1], L2):- X<Y, !,findpartition([Y|R], L1, L2).
findpartition([X|[Y|R]], [X], [Y|R]).
justbigger([R|L], H, R):- R>H,!.
justbigger([R|L], H, R):- justbigger(L, H, R).
%----------------------------------------------------------%
template([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).
solve([]).
solve([X/Y|Others]):-solve(Others), our_member(Y, [1,2,3,4,5,6,7,8]), noattack(X/Y, Others).
noattack(_,[]).
noattack(X/Y,[X1/Y1|Others]):- Y=\=Y1, (X-X1) =\= (Y-Y1), (X-X1) =\= (Y1-Y), noattack(X/Y, Others).
%----------------------------------------------------------%
move(1,X,Y,_) :-  
        write('Move top disk from '), 
        write(X), 
        write(' to '), 
        write(Y), 
        nl. 
    move(N,X,Y,Z) :- 
        N>1, 
        M is N-1, 
        move(M,X,Z,Y), 
        move(1,X,Y,_), 
        move(M,Z,Y,X).
%--------------------------------------------------------%
musician_solution(S):-
	band_soloists(S),
	first(X,S),plays(X,piano),
	order_mbers(Y,Z,S),
		named(Y,jhon),plays(Y,sax),
		country(Z,australia),
	order_mbers(Y1,Z1,S),
		named(Y1,mark),plays(Z1,violin),
		country(Y1,us),
	member(U,S),country(U,japan),
	member(V,S),named(V,sam).

band_soloists(band(soloist(N1,C1,I1),
		   soloist(N2,C2,I2),
		   soloist(N3,C3,I3))).
named(soloist(N,_,_),N).
country(soloist(_,C,_),C).
plays(soloist(_,_,I),I).
first(X,band(X,_,_)).
order_mbers(X,Y,band(X,Y,Z)).
order_mbers(X,Z,band(X,Y,Z)).
order_mbers(Y,Z,band(X,Y,Z)).
member(X,band(X,Y,Z)).
member(Y,band(X,Y,Z)).
member(Z,band(X,Y,Z)).
