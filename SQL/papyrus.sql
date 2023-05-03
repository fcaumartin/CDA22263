
drop database papyrus;
create database papyrus;
use papyrus;

create table fournis (
    numfou int AUTO_INCREMENT PRIMARY KEY,
    posfou varchar(5) check (posfou RLIKE '^[0-9]{5}$'), 
    satisf int check (satisf between 1 and 10),
    staisf2 TINYINT
);

create table entcom(
    numcom int AUTO_INCREMENT PRIMARY KEY,
    datcom datetime default CURDATE(),
    numfou int,
    foreign key(numfou) REFERENCES fournis(numfou)
);

