aime(vincent,mia).
aime(marsellus,mia).
aime(mon_chou,lapin).
aime(lapin,mon_chou).

jaloux(X,Y):-aime(X,Z),aime(Y,Z).
