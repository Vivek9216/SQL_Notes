use world;
-- multiple row functions
select distinct(continent) from country; -- giving result of all the rows which are unique

select distinct(name) from country; -- finding all the unique values
select count(continent) from country; -- count of the column
select count(distinct(continent)) from country; -- unique continent count of the column

-- aggregate functions:
-- are the function which are used to apply the calculations on set of rows eg- count,max,min

select count(population), sum(population), avg(population) from country;

select count(surfacearea), sum(surfacearea), max(surfacearea) from country;

select count(continent), max(continent), min(continent) from country; -- checks in alphabetical order
-- only these 3 function on the string can be applied

select population, count(population) from country; 
-- will give error bcz in agg. function it will only apply with the agg. function not with the normal/non-aggreagated column

select avg(population) - avg(replace(population, 1 ,4)) from country ;
select population, replace(population, 0 , "") from country; -- 0 will be removed

-- data sorting(order by clause)
select name, continent, region, population from country order by name; -- ascending order
select name , continent from country order by name desc; -- descending order

select name, continent, region, population from country order by population, name; -- name will be also in ascending order
select name, continent, region, population from country order by continent, name;

select name, continent, region, population from country order by region, population desc;
-- region will be asc and population will be desc