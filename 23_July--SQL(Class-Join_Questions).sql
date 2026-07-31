use deptdb;

select d.dept_name, sum(budget) from projects as p
join departments as d
on p.dept_id = d.dept_id
group by dept_name;

-- ques --> Find dept_name and the total employees working in that dept

select d.dept_name, count(emp_name) from employees as e join
departments as d 
on e.dept_id = d.dept_id
group by dept_name
having count(emp_name)>1;

-- where clause and having clause both can be used by group by
-- where clause is used to filter the data from column
-- where clause is independent
-- having clause is dependent on group by
-- execution order --> where, groupby, having
-- agg. function are used with having