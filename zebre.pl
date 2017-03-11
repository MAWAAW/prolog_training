/* Prédicats permettant de poser les contraintes inhérentes aux listes C,N,B,A et P */
lc([_,_,_,_,_]).
ln([norvegien,_,_,_,_]).
lb([_,_,lait,_,_]).
la([_,_,_,_,_]).
lp([_,_,_,_,_]).

/* Vrai si X et Y sont dans la même position dans les listes L1 et L2 */
meme_maison(X,[X|_],Y,[Y|_]).
meme_maison(X,[_|L1],Y,[_|L2]) :- meme_maison(X,L1,Y,L2).

/* Vrai si X et Y sont dans des positions voisines dans les listes L1 et L2 */
maison_a_cote(X,[X|_],Y,[_,Y|_]).
maison_a_cote(X,[_,X|_],Y,[Y|_]).
maison_a_cote(X,[_|L1],Y,[_|L2]) :- maison_a_cote(X,L1,Y,L2).

/* Vrai si Y est juste à droite de X dans la liste L */
maison_a_droite(X,Y,[X,Y|_]).
maison_a_droite(X,Y,[_|L]) :- maison_a_droite(X,Y,L).

/* Calcule les listes et trouve le possesseur du zebre et le buveur de vin */
zebre(C,N,B,A,P,PossZebre,BoitVin) :- lc(C), ln(N), lb(B), la(A), lp(P),
        meme_maison(anglais,N,rouge,C),
        meme_maison(chien,A,espagnol,N),
        meme_maison(japonais,N,peintre,P),
        meme_maison(italien,N,the,B),
        meme_maison(verte,C,cafe,B),
        maison_a_droite(blanche,verte,C),
        meme_maison(sculpteur,P,escargots,A),
        meme_maison(diplomate,P,jaune,C),
        maison_a_cote(norvegien,N,bleu,C),
        meme_maison(violoniste,P,jus_de_fruit,B),
        maison_a_cote(renard,A,medecin,P),
        maison_a_cote(cheval,A,diplomate,P),
        meme_maison(PossZebre,N,zebre,A),
        meme_maison(BoitVin,N,vin,B).




