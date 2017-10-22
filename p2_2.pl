preorder(nil,[]).
preorder(bt(Left,Root,Right),L):-preorder(Left,L1),preorder(Right,L2),append([Root|L1],L2,L).

inorder(nil,[]).
inorder(bt(Left,Root,Right),L):-inorder(Left,L1),inorder(Right,L2),append(L1,[Root|L2],L).

postorder(nil,[]).
postorder(bt(Left,Root,Right),L):-postorder(Left,L1),postorder(Right,L2),append(L1,L2,L3),append(L3,[Root],L).



find([H|T],L,H):-our_member(H,L),!.
find([H|T],L,N):-find(T,L,N).

getpostorder(Pre,In,Post):-getpostorder1(Pre,In,[],Post).
getpostorder1(Pre,[],A,A).
getpostorder1(Pre,In,A,A1):-find(Pre,In,N),!,append(Left,[N|Right],In),getpostorder1(Pre,Right,A,R),getpostorder1(Pre,Left,A,L),append(L,R,L1),append(L1,[N],A1).

getpreorder(Post,In,Pre):-reverse_list(Post,Po),getpreorder1(Po,In,[],Pre).
getpreorder1(Po,[],A,A).
getpreorder1(Po,In,A,A1):-find(Po,In,N),!,append(Left,[N|Right],In),getpreorder1(Po,Left,A,L),getpreorder1(Po,Right,A,R),append([N|L],R,A1).

insert(nil,X,bst(nil,X,nil)).
insert(bst(Left,Root,Right),X,bst(Left1,Root,Right)):-X=<Root,!,insert(Left,X,Left1).
insert(bst(Left,Root,Right),X,bst(Left,Root,Right1)):-X>Root,insert(Right,X,Right1).

min_in_tree(bst(nil,Root,_),Root).
min_in_tree(bst(Left,Root,_),N):-min_in_tree(Left,N).

delete_leaf(T,X,NT):-insert(NT,X,T).

linearize(nil,[]).
linearize(bst(Left,Root,Right),L):-linearize(Left,L1),linearize(Right,L2),append(L1,[Root|L2],L).

tree_sort(Xs, Ys):-make_tree(Xs, nil, T), linearize(T, Ys).
make_tree([], T, T).
make_tree([X|Xs], T, U):-insert(T,X, V),make_tree(Xs, V, U).



