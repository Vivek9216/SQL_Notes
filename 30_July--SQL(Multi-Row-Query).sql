-- multi-row query
create database multi_db;
use multi_db;

create table employee_c(id int, name varchar(20), salary int);

insert into employee_c values(1,"a",100), (2,"b",250), (3,'c',400), (4,"d",380), (5,"a",300);

select * from employee_c;

select * from employee_c
where salary in (select salary from employee_c where name = "a");
-- comparison operators cannot be used with multi row query like "="
-- in multi-row query we can only use in, any, all operators 
-- =all doesn't work(exception)

select * from employee_c 
where salary =any (select salary from employee_c where name = "a");

select * from employee_c 
where salary >any (select salary from employee_c where name = 'a');
-- it means where salary>100 or salary>300

select * from employee_c
where salary <any (select salary from employee_c where name = 'a');
-- it means where salary<100 or salary<300

select * from employee_c
where salary >all (select salary from employee_c where name = "a");
-- works like and operator which means salary>100 and salary>300