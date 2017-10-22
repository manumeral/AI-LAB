% length of list without accumulator %
length2([],0).
length2([H|T],N):-length2(T,N1),N is N1+1.

% length of list using accumulator %
length3(L,N):-length_acc(L,0,N).
length_acc([],A,A).
length_acc([H|T],A,N):-A1 is A+1,length_acc(T,A1,N).

% selecting element from the list %
select1(X,[X|R],R).
select1(X,[H|R],[H|R1]):-select1(X,R,R1).


% ==================================================================== %

permutation([],[]).
permutation(L,[H|T]):-select1(H,L,R),permutation(R,T).

permutation_sort([],[]).
permutation_sort(L,L1):-permutation(L,L1),ordered(L1),!.

% ==================================================================== %

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

% ==================================================================== %
insertionsort([],[]).
insertionsort([H|T],L):-insertionsort(T,L1),inserttolist(H,L1,L).

inserttolist(X,[],[X]).
inserttolist(X,[H|T],[X|[H|T]]):-X=<H,!.
inserttolist(X,[H|T],[H|T1]):-X>H,inserttolist(X,T,T1).

% ==================================================================== %

selectionsort([],[]).
selectionsort(L,[H|T]):-least(H,L,R),selectionsort(R,T).

least(_,[],[]).
least(X,L,R):-select1(X,L,R),smaller(X,R).

smaller(_,[]).
smaller(X,[H|T]):-X=<H,smaller(X,T).

% ==================================================================== %

template([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).
solve([]).
solve([X/Y|Others]):-solve(Others), our_member(Y, [1,2,3,4,5,6,7,8]), noattack(X/Y, Others).
noattack(_,[]).
noattack(X/Y,[X1/Y1|Others]):- Y=\=Y1, (X-X1) =\= (Y-Y1), (X-X1) =\= (Y1-Y), noattack(X/Y, Others).

% ==================================================================== %


% ==================================================================== %
