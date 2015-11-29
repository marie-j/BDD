Jones Marie

TP2 BDD

Exercice 1 :

2 : aid et fid sont définies comme non nulles car il s'agit de clés primaires dans les tables Articles et Fournisseurs. Elles le sont dans catalogues également pour la même raison.

4 : On modifie également les valeurs dans la table où les orphelins apparaissent. (cascade)

7 : INSERT INTO Catalogue VALUES (1,17,999999.999)

8 : INSERT INTO Articles VALUES(17,'Keyboard','noir');

9 : INSERT INTO Catalogue VALUES (5,10,-20)

10 : Les articles avec l'aid =17 sont également supprimés de la table Catalogue
	DELETE FROM Articles where aid=17;
	Les résultats de la requête "SELECT * FROM Catalogue where aid=17" sont nuls. 


Exercice 2 : 

1 : select fnom as "fournisseurs" from Fournisseurs

2 : select fnom from fournisseurs where fad like '%Paris'

3 : select distinct fnom from Fournisseurs join Catalogue on (Fournisseurs.fid = Catalogue.fid) where (prix <20);

4 : select distinct fnom from Fournisseurs,Catalogue where prix <20 and prix >10;
	select distinct fnom from Fournisseurs,Catalogue where prix <20 intersect select distinct fnom from Fournisseurs,Catalogue where prix >10;

5 : select distinct anom from Articles,Catalogue where (prix <20) and (acoul='rouge' or acoul ='vert');

6 :
select distinct anom from Catalogue natural join Articles;
select distinct anom from Catalogue join Articles on (Catalogue.aid = Articles.aid);
select distinct anom from Catalogue cross join Articles on (Catalogue.aid = Articles.aid);

7 : select distinct Fournisseurs.fid from Articles,Fournisseurs,Catalogue where acoul='rouge';

8 : (select distinct fnom,fad from Fournisseurs join Catalogue on (Fournisseurs.fid = Catalogue.fid) where (prix >=1000));

9 : select aid from Articles where acoul='rouge' or acoul='vert';

10: select distinct  anom from Articles left join Catalogue on (Articles.aid = Catalogue.aid);

11 : select distinct fid from Articles join Catalogue on (Articles.aid = Catalogue.aid) where acoul='vert' or acoul='rouge';

12 : select distinct fnom from Fournisseurs,Articles,Catalogue where Catalogue.aid = Articles.aid and Fournisseurs.fid= Catalogue.fid except select distinct fnom from Fournisseurs,Articles,Catalogue where Catalogue.aid = Articles.aid and Fournisseurs.fid = Catalogue.fid and (acoul='noir' or acoul='argente';