/*********** Faits ***********/

byCar(auckland,hamilton,50).
byCar(hamilton,raglan,50).
byCar(valmont,saarbruecken,90).
byCar(valmont,metz,60).

byTrain(metz,frankfurt,10).
byTrain(saarbruecken,frankfurt,10).
byTrain(metz,paris,60).
byTrain(saarbruecken,paris,100).

byPlane(frankfurt,bangkok,300).
byPlane(frankfurt,singapore,300).
byPlane(paris,losAngeles,900).
byPlane(bangkok,auckland,250).
byPlane(singapore,auckland,260).
byPlane(losAngeles,auckland,350).


/*********** Régles ***********/

/* Le voyage de S à E est-il possible ? */
voyage(S,E) :- byCar(S,T), voyage(T,E).
voyage(S,E) :- byTrain(S,T), voyage(T,E).
voyage(S,E) :- byPlane(S,T), voyage(T,E).
voyage(S,E) :- byCar(S,E).
voyage(S,E) :- byTrain(S,E).
voyage(S,E) :- byPlane(S,E).

/* Permet de connaître les différentes étapes */
voyage2(X,Y,[X,Y]) :- byCar(X,Y).
voyage2(X,Y,[X,Y]) :- byTrain(X,Y).
voyage2(X,Y,[X,Y]) :- byPlane(X,Y).
voyage2(A,C,[[A,B]|R]) :- byCar(A,B), voyage2(B,C,R).
voyage2(A,C,[[A,B]|R]) :- byTrain(A,B), voyage2(B,C,R).
voyage2(A,C,[[A,B]|R]) :- byPlane(A,B), voyage2(B,C,R).

/* Retourne le voyage le moins chère */
voyage3(X,Y,[X,Y],Prix) :- byCar(X,Y,Prix).
voyage3(X,Y,[X,Y],Prix) :- byTrain(X,Y,Prix).
voyage3(X,Y,[X,Y],Prix) :- byPlane(X,Y,Prix).
voyage3(A,C,[[A,B]|R],Prix) :- byCar(A,B,Prix1), voyage3(B,C,R,Prix2), Prix is Prix1 + Prix2.
voyage3(A,C,[[A,B]|R],Prix) :- byTrain(A,B,Prix1), voyage3(B,C,R,Prix2), Prix is Prix1 + Prix2.
voyage3(A,C,[[A,B]|R],Prix) :- byPlane(A,B,Prix1), voyage3(B,C,R,Prix2), Prix is Prix1 + Prix2.

min([T|Q],Min) :- min(Q,T,Min).
min([],Min,Min).
min([T|Q],Min0,Min) :- Min1 is min(T,Min0), min(Q,Min1,Min).
voyageMin(X,Y,Z,Prix) :- findall(A,voyage3(X,Y,_,A),L), min(L,Prix), voyage3(X,Y,Z,Prix).





