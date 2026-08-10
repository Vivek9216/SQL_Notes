-- Windows function:
-- they are the function which are used to perform the calculation on the set of rows
-- these calculations are done in relation with the current row
-- they do not collapse the data like group by


-- over() --> works on set of rows

create database w_db;
use w_db;

create table employees(id int, name varchar(20), dept varchar(20), salary int);

insert into employees values(1,'a','hr',100), (2,'b','hr',200), (3,'c','marketing',300), (4,'d','marketing',400), (5,'e','hr',500);

select sum(salary) from employees; -- aggregate
select dept, sum(salary) from employees; -- error

select dept, sum(salary) from employees group by dept; -- total salary by dept
select deot, name, sum(salary) from employees group by dept; -- error

select *, (select sum(salary) from employees) from employees;

select *, (select sum(salary) from employees where employees.dept = e.dept) from employees e;
-- subquery and correlated subquery will be long method and will also run slowly

select *, sum(salary) over(), max(salary) over() from employees;
-- no use of having group by function on non-aggregated function

select *, sum(salary) over() - salary as difference from employees;

-- partition by
select *, sum(salary) over(partition by dept) from employees;
select *, sum(salary) over(partition by dept, name) from employees;

select *, max(salary) over(partition by dept) from employees;


create database windows_db;
use windows_db;
CREATE TABLE employee_sales (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sale_date DATE,
    sales_amount DECIMAL(10,2)
);

INSERT INTO employee_sales values
	(1,  'Alice', 'Electronics', '2026-01-05', 1200.00),
    (2,  'Bob',   'Electronics', '2026-01-08', 1800.00),
    (3,  'Alice', 'Electronics', '2026-01-15', 1500.00),
    (4,  'Charlie','Electronics','2026-01-20', 1800.00),
    (5,  'Bob',   'Electronics', '2026-01-25', 2200.00),

    (6,  'David', 'Furniture',   '2026-01-03', 2500.00),
    (7,  'Emma',  'Furniture',   '2026-01-10', 1800.00),
    (8,  'David', 'Furniture',   '2026-01-18', 3000.00),
    (9,  'Frank', 'Furniture',   '2026-01-22', 1800.00),
    (10, 'Emma',  'Furniture',   '2026-01-28', 3200.00),

    (11, 'George','Clothing',    '2026-01-04', 900.00),
    (12, 'Helen', 'Clothing',    '2026-01-09', 1400.00),
    (13, 'George','Clothing',    '2026-01-16', 1100.00),
    (14, 'Helen', 'Clothing',    '2026-01-21', 1400.00),
    (15, 'Ian',   'Clothing',    '2026-01-27', 2000.00);

select *, sum(sales_amount) over(partition by department) from employee_sales;

select *, avg(sales_amount) over(partition by department) from employee_sales;

select *, sum(sales_amount) over(partition by employee_name) from employee_sales;

select *, avg(sales_amount) over(partition by department) as department_average,
round(sales_amount - avg(sales_amount) over(partition by department)) as difference from employee_sales;
-- alias names cannot be used in the operations like +,-,etc.

select distinct(department), sum(sales_amount) over(partition by department) as department_total, sum(sales_amount) over()
as company_total from employee_sales;

select distinct(department), sum(sales_amount) over(partition by department) as department_total, sum(sales_amount) over()
as company_total, (sum(sales_amount) over(partition by department)/ sum(sales_amount) over()) * 100 from employee_sales; 