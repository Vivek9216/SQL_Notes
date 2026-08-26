-- root connection

create database tcldb2;
use tcldb2;

create table tcldb2.test(id int, name varchar(20));
insert into tcldb2.test values(18,'abhinav');

select @@autocommit; -- by default autocommit is 1 mean file will be automatically saved 

start transaction; -- values will be isolated
insert into tcldb2.test values(19,'raj');

select * from tcldb2.test;
commit; -- you permanently saved the change in the database

start transaction;
insert into tcldb2.test values(20,'japan');
insert into tcldb2.test values(21,'north korea');
rollback; -- to revert the two lines inserted
select * from tcldb2.test;

SET SQL_SAFE_UPDATES = 0;
start transaction;
insert into tcldb2.test values(21,'nykaa');
update tcldb2.test set name = 'abcd';
rollback; -- to revert the two lines inserted
select * from tcldb2.test;

start transaction;
insert into tcldb2.test values(22,'laneige');
delete from tcldb2.test;
select * from tcldb2.test;
rollback;

select * from tcldb2.test;