create database joinsdb;
use joinsdb;

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
DepartmentID INT
);

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 105), -- No matching department
(4, 'David', NULL), -- No department assigned
(5, 'Eva', 101);

select * from departments;
select * from employees; -- departmentid --> match with departmentid of department table

-- join / inner join
select e.employeeid, e.employeename, e.departmentid, d.departmentid,
d.departmentname from employees as e join departments as d;

select e.employeeid, e.employeename, e.departmentid, d.departmentid,
d.departmentname from employees as e join departments as d
on e.departmentid = d.departmentid; -- on is the new syntax and we have to use this

-- left join
select e.employeeid, e.employeename, e.departmentid, d.departmentid,
d.departmentname from employees as e left join departments as d
on e.departmentid = d.departmentid;

select e.employeeid, e.employeename, e.departmentid, d.departmentid,
d.departmentname from departments as d left join employees as e 
on e.departmentid = d.departmentid;

use world;
select count(*) from city;
select count(*) from country;

select c.id, c.name, c.countrycode, cty.code, cty.name from city as c
join country as cty
on c.countrycode = cty.code;

-- cross join/ cartesian join -- there is no condition in this join like where, on
select c.id, c.name, c.countrycode, cty.code, cty.name from city as c
cross join country as cty;

select count(*) from city as c join
country as cty;