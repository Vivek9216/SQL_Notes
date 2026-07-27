-- to create a database
create database movies;

-- using the database(folder)
use movies;

-- to create a table and give the column name
create table deepika(filmname varchar(30), amount int, director varchar(30));

-- to know the info about the table
describe deepika;

-- to see the table
select * from deepika;

-- to insert data
insert into deepika values("kalki",100000,"Karan johar");

-- sql is not case sensitive

show databases; -- will show all the database

use world;
describe country;

select * from country;
select name, continent from country;
select continent, name from country; -- can be in any order and can access the column multiple times

select name, population, population+1000 from country;
-- no changes in the original table

select name,population+1000 as new_population from country;

select name
from country; -- can write in multiple lines

-- select --> to access the column
-- you can write a query(logic) in any case format
-- you can give a column name using "as" keyword

-- to filter the data --> where
select * from country where continent = "asia";
select * from country where name = "bahrain";
select name, continent, population from country where name = "india";
select * from country where population = 156483000;
select * from country where continent = "europe" and indepyear>1990;
select * from country where continent = "europe" or indepyear>1990;

select name, code from country where surfacearea>19000;
select name, code from country where region = "southern europe";
select name, code from country where name = "africa" and region = "central africa";
select name, continent, population from country where name ="africa" or continent = "asia";
select name, region, population, population/100*10 + population as new_population from country where indepyear>1950;