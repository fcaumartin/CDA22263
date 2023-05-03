-- Active: 1664351913126@@127.0.0.1@3306@hotel
insert into client
(cli_nom, cli_prenom)
values
    ('toto', 'titi'),
    ('tutu', 'tata');


update client
set cli_ville='Amiens'
where cli_id=1;

delete from client
where cli_id=1;