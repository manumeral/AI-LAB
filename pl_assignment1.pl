same_length([],[]).
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
gdc(A,B,C):-max(A,B,A),gcd(A mod B,B,C);max(A,B,B),gcd(A,B mod A, C).

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

merge_sort_mod(A,C):-our_member([],A),delete1([],A,B),merge_sort(B,C),!.
merge_sort_mod(A,C):-merge_sort(A,C).
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

insertion_sort([],[]).
insertion_sort([H|T],L):-insertion_sort(T,L1), insert(H,L1,L).
insert(X,[],[X]).
insert(X,[H|T],[X|[H|T]]):-X=<H.
insert(X,[H|T],[H|T1]):-X>H,insert(X,T,T1).

%-------------------------------------------------------------%

select1(X,[X|R],R).
select1(X,[H|R],[X|R1]):-select1(X,R,R1).

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
