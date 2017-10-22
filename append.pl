append([],L,L).
append([X|Rest],L,[X|Rest1]):-append(Rest,L,Rest1).
