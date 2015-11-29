Mercier Tony
Jones Marie

TP6-Datalog

Exercice 1 : 

Q4 : 
femme.

Q5 : 
femme(X),aime(vincent,X).

Q6: 
aime(vincent,X),not femme(X).

Q8 : 
jaloux(vincent,X).

Q9:
jaloux(vincent,_).

Exercice 2 : 

Q10 :
p(X,Y).

Q16 : 
	A1 : (P1 ^T2)
	A2 : (P1 ^T2) v (P2 ^T1)

Q17 :
	A1 ^ ¬ A2 = (P1 ^ T2) ^ ¬ ((P1 ^ T2) v (P2 ^ T1))
			  = (P1 ^ T2) ^ (¬(P1 ^ T2) ^ ¬(P2 ^ T1))

			  (P1 ^ T2) ^ ¬(P1 ^ T2) =0

	¬ A1 ^ A2 = ¬(P1 ^T2) ^ ((P1 ^ T2) v (P2 ^ T1))
			  = (¬(P1 ^ T2) ^ (P1 ^ T2)) v (¬(P1 ^ T2) ^ (P2 ^ T1))
			  = 0 v (P2 ^ T1)
			  = (P2 ^ T1)

Q22 : 
	((the DET)(man N) NP )((sings V)((a DET)(song N) NP) VP)
