--Jones Marie 
--Mercier Tony

--TP4 BDD

-- Q1 : 

 select acoul  from Articles group by acoul having count(aid)= 1; 

select acoul from Articles a where not exists (select * from Articles abis where a.acoul=abis.acoul and a.anom <> abis.anom );

--Q2 : 
select anom from Articles a where acoul='rouge' and not exists (select * from Articles a2 where a2.acoul='vert' and a.anom = a2.anom);

select anom from Articles a where acoul='rouge' and a.anom <> all(select anom from Articles where acoul='vert');

select anom from Articles a where acoul='rouge' and anom not in (select anom from Articles where acoul='vert');

--Q3 : 
select fnom,max(prix) from Articles a natural join Fournisseurs f natural join Catalogue c group by f.fnom,a.acoul having a.acoul='rouge';

--Q4 : 
select distinct aid from Catalogue c where exists (select fid from Catalogue c1 where c.aid = c1.aid and c.fid <> c1.fid);

select aid from Catalogue c group by aid having count(fid) >=2; 

--Q5:
select fid from Catalogue c where exists (select * from Articles where aid = ALL(select aid from Catalogue c1)) ;

--Q6 :
select fnom from Fournisseurs f natural join Catalogue c where not exists (select * from Catalogue c1 where c.prix < c1.prix);

select fnom from Fournisseurs f natural join Catalogue c where c.prix >= all(select prix from Catalogue c);

--Q7 :
select anom,min(prix),max(prix) from Articles a natural join Catalogue c where exists ( select * from Catalogue c1 where c.aid = c1.aid and c.fid <> c1.fid) group by anom;

--Q8 : 
select distinct fnom,anom from Fournisseurs f natural join Catalogue c natural join Articles a where exists (select * from Catalogue c1 natural join Articles a1 where a.anom = a1.anom and c1.fid = c.fid and a.acoul <> a1.acoul);

select distinct fnom,anom from Fournisseurs f natural join Catalogue c natural join Articles a where acoul <> some(select acoul from Articles a1 natural join Catalogue c1 where a.anom = a1.anom and c.fid=c1.fid);

--Q9 : 
select distinct fid,count(aid) from Catalogue c group by fid having count(aid) >= all(select count(aid) from Catalogue c1 group by fid );

--Q10:
select anom from Articles a natural join Catalogue c where not exists ( select fid from Catalogue c1 natural join Articles a1 where a.anom=a1.anom and c.fid <> c1.fid);

select anom from Articles a natural join Catalogue c group by anom having count(fid) <= 1;

--Q11 : 
select fid from Fournisseurs f where not exists (select fid from Fournisseurs f1 natural join Catalogue c where f.fid = f1.fid );

select fid from Fournisseurs f where fid not in (select fid from Catalogue c);

select fid from Fournisseurs f  where f.fid <> all(select fid from Catalogue);

--Q12 :
select aid from Catalogue c where not exists (select aid from Catalogue c1 where c1.prix < 100 and c.aid = c1.aid);

select aid from Catalogue c group by aid having min(prix) > 100;

select aid from Catalogue c where aid <> all(select aid from Catalogue c where prix <100);


--Q13 : 
select distinct aid from Catalogue c where not exists (select fad from Catalogue c1 natural join Fournisseurs f where c.aid = c1.aid and fad <> all(select fad from Fournisseurs where fad like '%USA%'));
