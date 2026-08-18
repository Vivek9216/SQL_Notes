create database testdb6;

use testdb6;

-- table structure
create table testdb6.employee(id int);

select * from testdb6.employee;

drop table testdb6.employee; -- drop the table[ data is remove and also it's structure]
select * from testdb6.employee;

-- second table
create table testdb6.employee(id int);
select * from testdb6.employee;

-- DDL[ALTER]
alter table testdb6.employee add column name varchar(20);
alter table testdb6.employee drop column id; -- drop the column
select * from testdb6.employee;

alter table testdb6.employee modify column name int; -- changed the data type
desc testdb6.employee; -- to know the datatype 

alter table testdb6.employee add column empid int; -- add a column
alter table testdb6.employee add constraint unique (name); -- to add constraint

alter table testdb6.employee modify column empid int NOT NULL; -- not null on a table column
desc testdb6.employee;

alter table testdb6.employee modify empid int primary key;

desc testdb6.employee;

alter table testdb6.employee rename column empid to id; -- column rename
alter table testdb6.employee rename to employee2; -- table rename
desc testdb6.employee2;

-- Truncate --
select * from testdb6.employee2;
insert into testdb6.employee2 values(100,80);

truncate testdb6.employee2; -- first it remove the table then recreate the table again, truncate is DDL
select * from testdb6.employee2;

alter table testdb6.employee2 drop constraint name; -- remove unique constraint
SET SQL_SAFE_UPDATES = 0;

insert into testdb6.employee2 values(10,199), (13,200), (11,899), (12,5738);
update testdb6.employee2 set name = '899'; -- will make changes to every row
-- implicit typecasting

update testdb6.employee2 set name ='7123' where id = 199; -- it will delete the row with the condition
select * from testdb6.employee2;

delete from testdb6.employee2; -- it will delete all the rows
delete from testdb6.employee2 where name = 10;

select * from testdb6.employee2;
