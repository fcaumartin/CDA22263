-- Active: 1664351913126@@127.0.0.1@3306@exercice1
DROP DATABASE IF EXISTS exercice1;

CREATE DATABASE exercice1;

USE exercice1;


create table Personne (
    per_num int AUTO_INCREMENT PRIMARY KEY,
    per_nom CHAR(50) ,
    per_prenom CHAR(50),
    per_adresse CHAR(50),
    per_ville CHAR(50)
);

create table Groupe (
    gro_num int AUTO_INCREMENT PRIMARY KEY,
    gro_nom CHAR(50)
);

create table Appartient (
    per_num int,
    gro_num int,
    FOREIGN KEY (per_num) REFERENCES Personne(per_num),
    FOREIGN KEY (gro_num) REFERENCES Groupe(gro_num),
    PRIMARY KEY (per_num, gro_num)
);

create index idx1 on Personne(per_nom);

select * from personne where per_nom='titi';
