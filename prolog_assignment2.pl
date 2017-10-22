add_int(X,0,X).
add_int(X,Y,Z):-Y>0,!,X1 is X+1,Y1 is Y-1,add_int(X1,Y1,Z).
add_int(X,Y,Z):-Y<0,X1 is X-1,Y1 is Y+1,add_int(X1,Y1,Z).

sub_int(X,0,X).
sub_int(X,Y,Z):-Y>0,!,X1 is X-1,Y1 is Y-1,sub_int(X1,Y1,Z).
sub_int(X,Y,Z):-Y<0,X1 is X+1,Y1 is Y+1,sub_int(X1,Y1,Z).

mult_int(X,0,Z):-Z is 0.
mult_int(X,Y,Z):-Y>0,!,Y1 is Y-1,mult_int(X,Y1,Z1),Z is Z1+X.
mult_int(X,Y,Z):-Y<0,Y1 is Y+1,mult_int(X,Y1,Z1),Z is Z1-X.

div_int(0,_,Z):-Z is 0.
div_int(X,Y,0):-X>0,!,X<Y.
div_int(X,Y,0):-X<0,X>Y.
div_int(X,Y,Z):-X*Y>0,!,X1 is X-Y,div_int(X1,Y,Z1),Z is Z1+1.
div_int(X,Y,Z):-X*Y<0,X1 is X+Y,div_int(X1,Y,Z1),Z is Z1-1.

split_list([X|Rest],A,B):-X>0,!,split_list(Rest,[X|A],B).
split_list([X|Rest],A,B):-X<0,split_list(Rest,A,[X|B]).

count([],Z):-Z is 0.
count([X|Rest],Z):-X>100,!,count(Rest,Z1),Z is Z1+1.
count([X|Rest],Z):-X=<100,count(Rest,Z).

rep_first_element(_,[],[]).
rep_first_element(Y,[_|Rest],[Y|Rest]).

replace([H|T], 1, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > 1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).

delete_nth([],_,[]).
delete_nth([H|T],1,T).
delete_nth([H|T],N,[H|L1]):-N>1,N1 is N-1,delete_nth(T,N1,L1).

cutlast([X],[]).
cutlast([X|Rest],[X|Rest1]):-cutlast(Rest,Rest1).

trim(1,[X|Rest],Rest).
trim(N,[X|Rest],L):-N1 is N-1,trim(N1,Rest,L).

trimlast(N,L,L1):-N>0,N1 is N-1,cutlast(L,L2),trimlast(N1,L2,L1),!.
trimlast(_,L,L).

double([],[]).
double([X],L):-append(X,[X],L).
double([H|T],[H|[H|T1]]):-double(T,T1).

fact(0,Z):-Z is 1.
fact(1,Z):-Z is 1.
fact(N,Z):-N1 is N-1,fact(N1,Z1),Z is Z1*N.

fact1(N,F):-fact_acc(N,1,F).
fact_acc(0,A,A).
fact_acc(1,A,A).
fact_acc(N,A,F):-A1 is A*N,N1 is N-1,fact_acc(N1,A1,F).

reverse1(L,L1):-reverse_acc(L,[],L1).
reverse_acc([],A,A).
reverse_acc([H|T],[H|A],L1):-reverse_acc(T,A,L1).

remove([],[]).
remove([H|T],[H|L]):-not(our_member(H,T)),!,remove(T,L).
remove([H|T],L):-remove(T,L).

rmv_dup(L,L1):-rmv(L,[],L1).
rmv([],A,A).
rmv([H|T],A,L1):-our_member(H,A),!,rmv(T,A,L1).
rmv([H|T],A,L1):-rmv(T,[H|A],L1).

sort_quick(L,M):-quicksort(L,[],M).
quicksort([],A,A).
quicksort([H|T],R,M):-partition(T,Lt,H,Gt),quicksort(Gt,R,Gt_sorted),quicksort(Lt,[H|Gt_sorted],M).
partition([],[],_,[]).
partition([H|T],[H|T1],X,Gt):-H=<X,!,partition(T,T1,X,Gt).
partition([H|T],Lt,X,[H|T2]):-H>X,partition(T,Lt,X,T2).

quick_sort([X|Xs],Ys) :-
  partition(Xs,Left,X,Right),
  quick_sort(Left,Ls),
  quick_sort(Right,Rs),
  append(Ls,[X|Rs],Ys).
quick_sort([],[]).


bubblesort(InputList,SortList) :-
        swap(InputList,List) , ! ,bubblesort(List,SortList).
bubblesort(SortList,SortList).
    
swap([X,Y|List],[Y,X|List]) :- X > Y.
swap([Z|List],[Z|List1]) :- swap(List,List1).


flat_list([],[]).
flat_list([H|T],L):-!,flat_list(H,L1),flat_list(T,L2),append(L1,L2,L).
flat_list(H,[H]).

mean(L,X):-sumlist(L,Sum),length2(L,Length),X is Sum/Length.

alternate(L1,[],L1).
alternate([],L2,L2).
alternate([X|T1],[Y|T2],[X|[Y|T]]):-alternate(T1,T2,T).

transpose([],[],[]).
transpose([X|T1],[Y|T2],[[X,Y]|T]):-transpose(T1,T2,T).

inner_product([],[],[]).
inner_product([X|T1],[Y|T2],[Z|T]):-Z is X*Y,inner_product(T1,T2,T).




