gcd(X,X,X).
gcd(X,Y,Z):-X>Y,X1 is X-Y,gcd(X1,Y,Z);Y>X,gcd(Y,X,Z). 
