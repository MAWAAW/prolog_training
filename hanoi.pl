tous_different([]).
tous_different([A|L]) :- pasElement(A,L), tous_different(L).
pasElement(A,[]).
pasElement(A,[B|L]) :- A\=B, pasElement(A,L).
carre_magique([A,B,C,D,E,F,G,H,I|[]],S) :- tous_different([A|L]), S is A+B+C, S is D+E+F, S is G+H+I, S is A+D+G, S is B+E+H, S is C+F+I.

hanoi(N) :- hanoi(N,socleA,socleB,socleC).
hanoi(0,_,_,_) :- !.
hanoi(N,A,B,C) :- M is N-1, hanoi(M,A,C,B), deplacer(A,B), hanoi(M,C,B,A).
deplacer(X,Y) :- write('deplacer un disque de '), write(X), write(' vers '), write(Y), nl.

