use joinsdb;

-- natural & self join
-- is a type in which we dont provide condition
-- automatic join perform based on the column name

select e.employeeid, e.employeename, e.departmentid, d.departmentid,
d.departmentname from employees as e natural join departments as d;
-- we dont use natural join because it filters every row from both tables with same column name

create database selfjoindb;
use selfjoindb;

create table employees(eid int, name varchar(30), manager_id int);

insert into employees values(1,"tushar",null),(2,"abhinav",1),(3,"saksham",1),(4,"akshay",2);
select * from employees;

# self join
select emp.eid, emp.name, emp.manager_id, mngr.eid, mngr.name from employees as emp
join employees as mngr
where emp.manager_id = mngr.eid;