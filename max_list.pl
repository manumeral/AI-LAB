:-ensure_loaded(max).
max_list([X],X).
max_list([X|L],Max):-max_list(L,Max2),max(Max2,X,Max).
