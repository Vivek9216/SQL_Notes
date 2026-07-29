use world;

select distinct(continent), name from country;
-- we cannot use count function here

select continent, count(name) from country group by continent;
-- it does the work at once

select count(name) from country where continent = "north america";
select count(name) from country where continent = "asia";
-- by this method we have to do seperately

select count(name), count(distinct(name)) from country;
select name, count(name) from country group by name;

select count(name) from city where district = "zuid-holland";

select * from city group by district;
-- can use only the column which is used in groupby

select district, count(name), sum(population) from city group by district;

select * from city;
select count(name) from city where countrycode ="AFG";
select countrycode, count(name) from city group by countrycode;

select count(name), count(code), count(continent), count(indepyear) from country;
-- count do not count the null values

select * from country;
select count(name) from country where lifeexpectancy between 70.1 and 83.5;

select count(name),sum(population) from country where IndepYear>1990;
select count(name) from country where indepyear is null;
select region, count(name) , sum(surfacearea) from country group by region;
select continent, count(name) from country group by continent;
select region, continent, count(name) from country group by region, continent;