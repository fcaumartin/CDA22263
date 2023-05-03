-- 1
select *
from employe;

-- 2
select *
from dept;

-- 3 
select nom, nodep, dateemb as `date d'embauche`
from employe;

-- 4. Afficher le titre de tous les employés.

select titre from employe;


-- 5. Afficher les différentes valeurs des titres des employés.
select distinct titre from employe;

delimiter ;
-- 6. Afficher le nom, le numéro d'employé et le numéro du
-- département des employés dont le titre est « Secrétaire ».
select nom, noemp, nodep, titre
from employe
where titre='sÉcrêtÄire';


-- 7. Afficher le nom et le numéro de département dont le numéro de
-- département est supérieur à 40.
select nom, nodept
from dept
where nodept>40;

-- 8. Afficher le nom et le prénom des employés dont le nom est
-- alphabétiquement antérieur au prénom.
select nom, prenom
from employe
where nom<prenom;


-- 9. Afficher le nom, le salaire et le numéro du département des employés
-- dont le titre est « Représentant », le numéro de département est 35 et
-- le salaire est supérieur à 20000

select nom, salaire, titre
from employe
where nodep=35 AND titre='representant' AND salaire>20000;



-- 10.Afficher le nom, le titre et le salaire des employés dont le titre est
-- « Représentant » ou dont le titre est « Président ».

select nom, titre, salaire
from employe
where titre='president' OR titre='representant';

-- 11.Afficher le nom, le titre, le numéro de département, le salaire des
-- employés du département 34, dont le titre est « Représentant » ou
-- « Secrétaire »

select nom, titre, salaire, nodep
from employe
where nodep=34 and (titre='representant' OR titre='secretaire');

--12
select nom, titre, salaire, nodep
from employe
where titre='representant' OR (nodep=34 and titre='secretaire');



-- Afficher le nom, et le salaire des employés dont le salaire est compris
-- entre 20000 et 30000.
select nom, salaire
from employe
where salaire>=20000 and salaire<=30000;
-- where salaire BETWEEN 20000 and 30000;

-- 15.Afficher le nom des employés commençant par la lettre « H »
select * 
from employe
where nom like 't%n';

select * 
from employe
where nom like '__u%';


-- 18 19 20
select *
from employe
order by salaire asc, nom desc;


-- 21 22 23 24 25

select nom, salaire, tauxcom
from employe;
select nom, salaire, tauxcom, (salaire*tauxcom)/100
from employe;

select nom, salaire, tauxcom
from employe
order by tauxcom;

select nom, salaire, tauxcom
from employe
where tauxcom is not null;

-- 28. Afficher le nom et le prénom (concaténés) des employés. Renommer
-- les colonne

select CONCAT(prenom, ' ', nom) as 'nomcomplet'
from employe;


-- 29. Afficher les 5 premières lettres du nom des employés.
select nom, SUBSTRING(nom, 1, 5)
from employe;

-- 30. Afficher le nom et la position de la lettre « r » dans le nom des
-- employés.
select nom, LOCATE('r', nom)
from employe;

-- 31. Afficher le nom, le nom en majuscule et le nom en minuscule de
-- l'employé dont le nom est Vrante.
select nom, UPPER(nom), CONCAT(UCASE(SUBSTRING(nom, 1, 1)), LOWER(SUBSTRING(nom, 2)))
from employe;
-- 32. Afficher le nom et le nombre de caractères du nom des employé
select nom, LENGTH(nom)
from employe;


