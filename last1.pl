last1([X],X).
last1([X|Rest],Y):-last1(Rest,Y).
