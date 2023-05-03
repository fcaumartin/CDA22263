-- Active: 1664351913126@@127.0.0.1@3306@papyrus
-- 1. Quelles sont les commandes du fournisseur 09120 
select * from entcom where numfou=9120;

-- 2. Afficher le code des fournisseurs pour lesquels des commandes ont été passées.

select distinct numfou from entcom;


-- 3. Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.

select count(*), count(distinct numfou) from entcom;


-- Editer les produits ayant un stock inférieur ou égal au stock d'alerte et
-- dont la quantité annuelle est inférieur est inférieure à 1000
-- (informations à fournir : n° produit, libellé produit, stock, stock actuel
-- d'alerte, quantité annuelle)

select * 
from produit
where stkphy<=stkale AND qteann<1000;

-- Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
select * 
from fournis
--where posfou like '78%' or posfou like '75%';
where SUBSTRING(posfou, 1, 2) in ('75', '78', '92', '77');



-- Quelles sont les commandes passées au mois de mars et avril ?

select *
from entcom
where MONTH(datcom) between 3 AND 4;


-- Quelles sont les commandes du jour qui ont des observations
-- particulières ?

select *
from entcom
where CAST(datcom as DATE)=CAST(now() as DATE)
AND obscom != '';

update entcom set datcom='2023-03-16' where numcom=1;

-- Lister le total de chaque commande par total décroissant
-- (Affichage numéro de commande et total)

select numcom, sum(priuni*qtecde) as total
from ligcom
group by numcom
order by 2 desc;





-- 9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura
-- dans le calcul du total les articles commandés en quantité supérieure
-- ou égale à 1000.
select numcom, sum(priuni*qtecde) as total
from ligcom
where qtecde<1000
group by numcom
having total>10000
order by 2 desc;


-- 10. Lister les commandes par nom fournisseur

select f.nomfou, e.numcom, e.datcom
from entcom e
join fournis f on e.numfou=f.numfou;








-- 11. Sortir les produits des commandes ayant le mot "urgent' en observation?

select distinct e.numcom, p.libart, f.nomfou, l.qtecde*l.priuni as total
from produit p
join ligcom l on p.codart=l.codart
join entcom e on e.numcom=l.numcom
join fournis f on f.numfou=e.numfou

where e.obscom like '%urgent%';








-- Coder de 2 manières différentes la requête suivante :
-- Lister le nom des fournisseurs susceptibles de livrer au moins un article


select distinct f.nomfou
from fournis f
join entcom e on f.numfou=e.numfou
join ligcom l on l.numcom=e.numcom
where l.qteliv<l.qtecde;

select nomfou from fournis where numfou in (
    select numfou from entcom where numcom in (
        select numcom from ligcom where qteliv<qtecde
    )
);







-- 13. Coder de 2 manières différentes la requête suivante
-- Lister les commandes (Numéro et date) dont le fournisseur est celui de la commande 70210 :

select * from entcom where numfou in (
    select numfou from entcom where numcom=70210
);

select e2.* 
from entcom e1
join entcom e2 on e1.numfou=e2.numfou
where e1.numcom=70210
;






-- 14. Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés sur Prix1) que le moins cher des rubans (article dont le premier caractère commence par R). On affichera le libellé de l’article et prix1


select * from vente where prix1<(
    select min(prix1) from vente where codart like 'r%'
);






-- 15. Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis fournisseur

select p.libart, f.nomfou
from fournis f
join entcom e on f.numfou=e.numfou
join ligcom l on l.numcom=e.numcom
join produit p on p.codart=l.codart
where l.qteliv<l.qtecde AND p.stkphy<p.stkale*1.5
order by 1, 2;


-- 16. Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30 jours. La liste est triée par fournisseur puis produit

select p.libart, f.nomfou
from fournis f
join entcom e on f.numfou=e.numfou
join ligcom l on l.numcom=e.numcom
join produit p on p.codart=l.codart
join vente v on (v.codart=l.codart AND v.numfou=e.numfou)
where l.qteliv<l.qtecde AND p.stkphy<p.stkale*1.5 AND v.delliv<30
order by 1, 2;




-- 17. Avec le même type de sélection que ci-dessus, sortir un total des stocks par fournisseur trié par total décroissant

select sum(p.stkphy), f.nomfou
from fournis f
join entcom e on f.numfou=e.numfou
join ligcom l on l.numcom=e.numcom
join produit p on p.codart=l.codart
join vente v on (v.codart=l.codart AND v.numfou=e.numfou)
where l.qteliv<l.qtecde AND p.stkphy<p.stkale*1.5 AND v.delliv<31
GROUP BY f.nomfou
order by 1, 2;






-- 18. En fin d'année, sortir la liste des produits dont la quantité réellement commandée dépasse 90% de la quantité annuelle prévue.

select codart, sum(qtecde) as total
from ligcom
group by codart
having total > (select sum(p.qteann)*0.9 from produit p where p.codart=codart);




-- 19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix indiqués sont hors taxes et que le taux de TVA est 20%.


select f.nomfou, sum(l.priuni*l.qtecde)*1.2
from fournis f
join entcom e on f.numfou=e.numfou
join ligcom l on l.numcom=e.numcom
where YEAR(e.datcom)=2018
group by f.nomfou;



/*
20. Existe-t-il des lignes de commande non cohérentes avec les produits
vendus par les fournisseurs. ? */



select distinct l.codart, e.numfou
from entcom e 
join ligcom l on l.numcom=e.numcom
EXCEPT
select distinct codart, numfou
from vente;