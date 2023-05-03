-- Rechercher le prénom des employés et le numéro de la région de leur
-- département.
select * from employe;
select * from dept;


select *
from employe
join dept on employe.nodep=dept.nodept;

-- select *
-- from employe, dept 
-- where employe.nodep=dept.nodept;


-- Rechercher le numéro du département, le nom du département, le
-- nom des employés classés par numéro de département (renommer les
-- tables utilisées).

select *
from employe e
join dept d on e.nodep=d.nodept
order by e.nodep;


-- Rechercher le nom des employés du département Distribution.
select e.nom, e.prenom
from employe e
join dept d on e.nodep=d.nodept
where d.nom='distribution';



-- Rechercher le nom et le salaire des employés qui gagnent plus que
-- leur patron, et le nom et le salaire de leur patron


select employe.prenom, employe.salaire, patron.prenom, patron.salaire 
from employe
join employe patron on employe.nosup=patron.noemp
where employe.salaire>patron.salaire;



-- Rechercher le nom et le titre des employés qui ont le même titre que
-- Amartakaldire.

select titre from employe where nom='amartakaldire';
select * 
from employe 
where titre=(
        select titre 
        from employe 
        where nom='amartakaldire'
);


-- Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus qu'un seul employé du département 31,
-- classés par numéro de département et salaire.
select salaire from employe where salaire > ANY (
                    select salaire 
                    from employe 
                    where nodep=31
                    );


select salaire 
from employe 
where salaire >  (
    select MIN(salaire) 
    from employe 
    where nodep=31
);



-- Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre que l'on trouve dans le département 32.

select *
from employe 
where nodep=31
AND
titre not in (
        select titre
        from employe
        where nodep=32
); 



-- Rechercher le nom, le titre et le salaire des employés qui ont le même
-- titre et le même salaire que Fairant

select * 
from employe
where salaire in (
        select salaire from employe where nom='fairent'
)
AND
titre in (
        select titre from employe where nom='fairent'
);



select d.nodept, d.nom, e.nom 
from employe e 
right join dept d on e.nodep=d.nodept;


select * from employe;
select * from dept;



select COUNT(nom), COUNT(tauxcom) from employe;




select titre, COUNT(*), MAX(salaire), MIN(salaire)
from employe
group by titre;


select d.noregion, AVG(e.salaire), COUNT(*)
from employe e
join dept d on e.nodep=d.nodept
GROUP BY d.noregion;








select *
from table1
join table2 on critere_jointure
join table3 on critere_jointure
where critere
group by champ
having critere
order by;










-- 3. Afficher les numéros des départements ayant au moins 3 employés.
select d.nodept, COUNT(*) as quantite
from employe e
join dept d on e.nodep=d.nodept
GROUP BY d.nodept
having quantite>=3;


-- 4. Afficher les lettres qui sont l'initiale d'au moins trois employés.

select substring(nom, 1, 1)
from employe
group by substring(nom, 1, 1)
having count(*)>2;



-- 5. Rechercher le salaire maximum et le salaire minimum parmi tous les
-- salariés et l'écart entre les deux.
select MAX(salaire), MIN(salaire), MAX(salaire)-MIN(salaire) from employe;





-- 6. Rechercher le nombre de titres différents.
select count(distinct titre) from employe;


-- 7. Pour chaque titre, compter le nombre d'employés possédant ce titre.
select titre, count(*)
from employe
group by titre
order by 2 desc;



-- 8. Pour chaque nom de département, afficher le nom du département et
-- le nombre d'employés.
select d.nom, COUNT(*) as nombre
from employe e
join dept d on e.nodep=d.nodept
GROUP BY d.nom;




-- 9. Rechercher les titres et la moyenne des salaires par titre dont la
-- moyenne est supérieure à la moyenne des salaires des Représentants.

select titre, AVG(salaire) as moyenne
from employe
group by titre
having moyenne > (select AVG(salaire) from employe where titre='representant');







-- 10.Rechercher le nombre de salaires renseignés et le nombre de taux de
-- commission renseignés.

select count(salaire), count(tauxcom) from employe;







