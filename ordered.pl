ordered([X]).
ordered([X|[Y|Rest]]):-X=<Y,ordered([Y|Rest]).
