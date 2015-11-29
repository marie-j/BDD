--Jones Marie
--Mercier Tony

--TP5 BDD

--Q1 :
SELECT eid, max(portee) FROM employes NATURAL JOIN certifications NATURAL JOIN avions 
GROUP BY eid HAVING count(aid) >=2;

--Q2 :
SELECT enom FROM employes e NATURAL JOIN certifications 
WHERE exists (SELECT * FROM vols v 
	WHERE e.salaire < v.prix AND v.dep='CDG' AND v.arr='NOU' 
	AND not exists(SELECT * FROM vols v2 
		WHERE v2.prix < v.prix AND v2.dep='CDG' AND v2.arr='NOU'));

--Q3 :
SELECT dep, arr, distance FROM vols v 
WHERE exists (SELECT * FROM employes e NATURAL JOIN certifications c NATURAL JOIN avions a 
	WHERE portee >= v.distance AND e.salaire > 100000) ORDER BY distance;

--Q4 : 
select distinct enom from employes e natural join certifications c natural join avions a
where a.portee >= 1500 
and not exists (select * from avions a1 natural join certifications c1
	where a1.portee < 1500 and c1.eid = c.eid);

--Q5 : 
select distinct enom from employes e natural join certifications c natural join avions a 
where  a.portee >1500 
and exists(select * from certifications c1 natural join avions a1 
	where e.eid = c1.eid and a1.aid = c1.aid and a1.portee > 1500 and a.aid <> a1.aid) 
and not exists (select * from certifications c2 natural join avions a2 
	where c2.eid = e.eid and a2.aid = c2.aid and a2.portee < 1500);

--Q6 : 
select distinct enom from employes e natural join certifications c natural join avions a
where a.portee >= 1500 
and not exists (select * from avions a1 natural join certifications c1
	where a1.portee < 1500 and c1.eid = c.eid)
and exists (select * from avions a2 natural join certifications c2
	where e.eid = c2.eid and a2.anom like '%Boeing%');

--Q7 : 
(select enom,eid from employes  
where salaire >= all 
	( select salaire from employes except
		select salaire from employes 
			where salaire >= all (select salaire from employes)))
except
(select enom,eid from employes
where salaire >= all(select salaire from employes));

--Q8 : 
select distinct enom from employes e natural join certifications c natural join avions a
where a.portee >= 2000
and not exists (select * from avions a2 natural join certifications c2
	where e.eid = c2.eid and a2.anom like '%Boeing%');

--Q9 :
select enom, salaire from employes e 
where e.salaire > (select avg(e2.salaire) from employes e2 natural join certifications c2) 
and not exists (select * from employes e3 natural join certifications c3 
	where c3.eid = e.eid); 

--Q10 :
select avg(e.salaire) - (select avg(e2.salaire) from employes e2) as difference 
from employes e natural join certifications c;

