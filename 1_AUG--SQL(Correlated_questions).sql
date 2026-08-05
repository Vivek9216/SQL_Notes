create database newdb;

use newdb;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender CHAR(1),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


INSERT INTO Department VALUES
(101, 'HR', 'Delhi'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Mumbai'),
(104, 'Sales', 'Pune'),
(105, 'Marketing', 'Hyderabad');



INSERT INTO Employee VALUES
(1, 'Amit',    'M', 55000, 101, NULL),
(2, 'Neha',    'F', 48000, 101, 1),
(3, 'Raj',     'M', 62000, 101, 1),
(4, 'Priya',   'F', 70000, 102, NULL),
(5, 'Arjun',   'M', 68000, 102, 4),
(6, 'Kiran',   'F', 72000, 102, 4),
(7, 'Rohit',   'M', 61000, 102, 4),
(8, 'Sneha',   'F', 80000, 103, NULL),
(9, 'Vikas',   'M', 75000, 103, 8),
(10,'Anjali',  'F', 78000, 103, 8),
(11,'Mohit',   'M', 50000, 104, NULL),
(12,'Pooja',   'F', 45000, 104, 11),
(13,'Deepak',  'M', 53000, 104, 11),
(14,'Riya',    'F', 60000, 104, 11),
(15,'Kunal',   'M', 65000, 105, NULL),
(16,'Nisha',   'F', 62000, 105, 15),
(17,'Varun',   'M', 59000, 105, 15),
(18,'Isha',    'F', 67000, 105, 15),
(19,'Manish',  'M', 64000, 105, 15),
(20,'Kavya',   'F', 52000, 101, 1);


select * from employee where dept_id=104
and salary=(select max(salary) from employee where dept_id=104);

select * from employee as eout where 
salary=(select max(salary) from employee where dept_id = eout.dept_id);

select e.emp_id, e.emp_name, d.dept_name, e.salary from employee as e 
join department as d on e.dept_id = d.dept_id
where salary > (select avg(salary) from employee where dept_id = e.dept_id);

select e.emp_name from employee as e 
where salary >all (select salary from employee where dept_id = e.dept_id and emp_id != e.emp_id); 

select distinct(d.dept_id), d.dept_name from department as d 
where dept_id =any (select dept_id from employee where salary>70000);

select e.emp_name from employee as e
where salary != (select max(salary) from employee where dept_id = e.dept_id );

select emp_name, dept_id, salary from employee as e1
where salary = (select max(salary) from employee as e2 where dept_id = e1.dept_id
and salary < (select max(salary) from employee where dept_id = e1.dept_id));