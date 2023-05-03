
create user toto2@localhost 
identified by 'toto';


create user titi@localhost identified by 'toto';

grant all privileges 
on *.* 
to titi@localhost  
WITH GRANT OPTION;

flush PRIVILEGES;