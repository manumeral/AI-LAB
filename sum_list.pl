sum_list([],0).
sum_list([X|Rest],N):-sum_list(Rest,M),N is M+X.
