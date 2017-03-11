my_last(X,[X|[]]).
my_last(X,[_|L]) :- my_last(X,L).

avant_dernier(X,[X,_|[]]).
avant_dernier(X,[_|L]) :- avant_dernier(X,L).

element_at(X,[X|_],1).
element_at(X,[_|L],N) :- R is N-1, element_at(X,L,R).

taille([],0).
taille([_|L],R) :- taille(L,N),  R is N+1.

reverse([],X,X).
reverse([Y|Q],X,L) :- reverse(Q,X,[Y|L]).

palindrome(X) :- reverse(X,X,[]).

my_flatten1([],[]).
my_flatten1(X,[X]) :- X\=[].
my_flatten1([A|C],E) :- my_flatten1(A,B), my_flatten1(C,D), append(B,D,E).

my_flatten2([],[]).
my_flatten2([A|Q],Result) :- is_list(A), !, my_flatten2(A,ResultA), my_flatten2(Q,ResultQ), append(ResultA,ResultQ,Result).
my_flatten2([A|Q],[A|ResultQ]) :- my_flatten2(Q,ResultQ).

compress([],[]).
compress([X],[X]).
compress([X,Y|Z],[X|L]) :- compress([Y|Z],L), X\=Y.
compress([X,X|Y],L) :- compress([X|Y],L).

pack([],[]).
pack([T|Q],[A|B]) :- construireListe(T,Q,Reste,A), pack(Reste, B).
construireListe(T,[],[],[T]).
construireListe(T,[Q|Reste],[Q|Reste],[T]) :- T\=Q.
construireListe(T,[T|Q],A,[T|B]) :- construireListe(T, Q, A, B).






# Exo learnprolognow

second(X,[_,X|_]).

swap12([X,Y|L],[Y,X|L]).

tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).
listtran([],[]).
listtran([X|L1],[Y|L2]) :- tran(X,Y), listtran(L1,L2).

twice([],[]).
twice([X|L1],[X,X|L2]) :- twice(L1,L2).

increment(X,Y) :- Y is X+1.
sum(X,Y,Z) :- Z is X+Y.

addone([],[]).
addone([X|L1],[R|L2]) :- R is X+1, addone(L1,L2).


