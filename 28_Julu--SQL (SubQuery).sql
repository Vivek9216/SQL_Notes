-- subquery -- a query within a query
			-- also known as nested query
            -- a query inside another query
 -- subquery type --> single row subquery
 
create database corr_db;
use corr_db;

create table employee_c(id int, name varchar(20), salary int);

insert into employee_c values(1,"a",100), (2,"b",250), (3,'c',400), (4,"d",380);

-- highest salary
select max(salary) from employee_c;
select * from employee_c where salary = 400;

select min(salary) from employee_c;
select * from employee_c where salary = 100;

-- Nested query or inner query or subquery
-- first inner query will run then the outer query
select * from employee_c where salary = (select min(salary) from employee_c);

-- subquery with the maximum salary
select * from employee_c where salary = (select max(salary) from employee_c);

insert into employee_c values (5, "aman", 250);

select * from employee_c where salary = (select salary from employee_c where name = "b");

select * from employee_c where salary > (select avg(salary) from employee_c);

use world;

select name from city where district = (select district from city where name = "abu dhabi");

select * from city where population = (select max(population) from city);

select district, name from city where countrycode = (select countrycode from city where name = "herat");

select district, name, population from city where countrycode = (select countrycode from city where name = "amsterdam")
order by population;