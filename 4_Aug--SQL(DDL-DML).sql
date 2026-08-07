-- Datatypes
-- Constraint

-- value --> "type"
-- int x

-- table, column --> datatype

use newdb2;

create table test1( rollno int); -- create --> DDL statement
insert into test1 values(10); -- DML statement
insert into test1 values(30);

-- tinyint --> can store the small numeric values, it uses 1byte memory
-- 1byte --> 8 bit
-- 2**8 --> 256
-- -128 to 127 (range)
create table test2(rollno tinyint);
insert into test2 values(78);
insert into test2 values(True);

-- 0 to 255 but no negative number
create table test3 (rollno tinyint unsigned);
insert into test3 values(129);

/* 
tinyint - 1 byte
small int - 2 byte(16 bit)
int - 4 byte
big int - 8 byte (64 bit)
*/

-- spaces and every character will occupy the space

-- string datatype
-- varchar --> size is not fixed, it uses upto memory how much is needed
-- char --> fixed size of character, it blocks the size of the memory of the given value
create table test4(gender char(1));
insert into test4 values('M');

create table test7(name char(10), name2 varchar(10));
insert into test7 values('abc','abc');
insert into test7 values('def  ','def  ');
select name, char_length(name), name2, char_length(name2) from test7;
insert into test7 values('aman', null);
-- for using null instead we have a better option that is constraint
select * from test7;
-- in char it will truncate the trailing whitespace but not in varchar

select table_name, data_length
from information_schema.tables where
table_schema  = database()
and table_name in ('test4','test7');

-- Constraints
-- set of rules that we apply on the volume
-- to prevent invalid data entry

-- not null
create table test10(id int, name varchar(20) not null);
insert into test10 values(10, 'abhishek');
insert into test10 values(10, null);
insert into test10(id) values(11); -- can take the single column value
select * from test10; -- will show error as we cannot insert the null values

create table test12(id int, name varchar(20) default 'regex');
insert into test12 values(10,'mahi');
insert into test12(id) values(11); -- default is regex
insert into test12(name) values('tushar');
select * from test12;

create table test13(id int unique, name varchar(20));
insert into test13 values(10,'mahi');
insert into test13 values(10,'sadaf'); -- error
insert into test13 values(11, 'saloni'); -- works
insert into test13 values(null, 'yash'); -- works

-- Primary key
create table test14(id int primary key, name varchar(20));
insert into test14 values(10,'mahi');
insert into test14 values(10,'ads'); -- duplicate values
insert into test14 values(null, 'ads'); -- not null constraint