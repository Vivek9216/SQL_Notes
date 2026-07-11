show databases; -- will show all database present in tthe mysql

use world; -- access kar rha hu

show tables; -- how many tbales in the database

describe country; -- table me kon konse column h and uske datatype kya h

-- data access
select * from city;

select district,population from city;

select district,population+1000 from city;

-- where , clause  (*=> used to select all column)
select * from city where name='Kabul';

select name,
district,population,countrycode
from city
where countrycode='IND' and population > 200000;

select name,
district,population,countrycode
from city
where countrycode='IND' or population > 200000;

select * from city where countrycode='AFG' and countrycode='IND'; -- dono check krega tabhi dega
select * from city where countrycode='AFG' and countrycode='Kabul';
select * from city where population between 100000 and 400000;
select * from city where population=129170 or population=117196;
select * from city where population in (129170,117196);

-- like operator --

select * from city where name='Breda';

-- % charecter is used for 0 or more characters
select * from city where name like 'B%';
select * from city where name like 'K%';

select * from city where name like '%a';
select * from city where name like '%a%';

-- _  (this is mean speacialy one character)

select * from city where name like 'A__';
select * from city where name like 'T___%';
select * from city where name like 'T%_';

-- get the city and the population where you have the letter e in the city name
-- where the second lettr should be b
-- where the city name have the second lettr is a and last second lettr is r
-- where you have aa in the city name
-- get the city name and population where the country name have the two lettr 'ee' sapreated by any character it should be in the middle

select name,population from city where name like '%e%';
select * from city where name like '_b%';
select * from city where name like '_a%r_';
select * from city where name like '%aa%';
select * from city where name like '%e_e%';

-- string functions (concate,trim,replace,length,substr)
-- differece between sql and mysql

-- funtions
-- a block of code , collection of statement => perform certain task
-- code reusauable is removed
-- code duplicacy is removed
-- make your code divided into smaller section

-- Inbuilt functions
-- scaler functions => applies on every row and return the output for every row

-- string , number , dates

use world;

-- select name , continent, concat(continent,'have',name,'country') from country;

select name,
continent,
concat_ws(' ',continent,'have',name,'country')
from country;

select name,
upper(name),
substr(name,2)
from country;  -- extract string character

select name,
substr(name,2),
substr(name,2,4)
from country;

select name,
substr(name,-4,2)
from country
where name='Colombia';

select name,
length(name),
char_length(name)
from country;

select length('$'),
char_length('$');

select name,
replace(name,'a','@')
from country;

select trim('    he  llo    ');

select name,
lpad(name,6,'-')
from country;

select current_date(),
current_time(),
current_timestamp(),
now();

select now(),
adddate(now(),2);

-- Run only if sakila database is installed
select payment_date,
adddate(payment_date,2)
from sakila.payment;

select now(),
year(now()),
month(now()),
extract(month from now()),
extract(minute from now()),
weekday(now());

select now(),
date_format(now(),'%m');

select now(),
date_format(now(),'%M');

select now(),
date_format(now(),'year is %Y, month_name is %M');

-- Important
-- substr,char_length,trim,replace
-- adddate with interval , year, month, extract, date_format, now()

-- ==========================================
-- STRING FUNCTIONS
-- ==========================================

USE world;

-- CONCAT
SELECT name,
       continent,
       CONCAT(continent, ' has ', name, ' country') AS message
FROM country;

-- CONCAT_WS
SELECT name,
       continent,
       CONCAT_WS(' ', continent, 'has', name, 'country') AS message
FROM country;

-- UPPER
SELECT name,
       UPPER(name)
FROM country;

-- SUBSTR
SELECT name,
       SUBSTR(name, 2)
FROM country;

SELECT name,
       SUBSTR(name, 2, 4)
FROM country;

SELECT name,
       SUBSTR(name, -4, 2)
FROM country
WHERE name = 'Colombia';

-- LENGTH & CHAR_LENGTH
SELECT name,
       LENGTH(name),
       CHAR_LENGTH(name)
FROM country;

SELECT LENGTH('$'),
       CHAR_LENGTH('$');

-- REPLACE
SELECT name,
       REPLACE(name, 'a', '@')
FROM country;

-- TRIM
SELECT TRIM('    he  llo    ');

-- LPAD
SELECT name,
       LPAD(name, 6, '-')
FROM country;


-- ==========================================
-- DATE FUNCTIONS
-- ==========================================

SELECT CURRENT_DATE();

SELECT CURRENT_TIME();

SELECT CURRENT_TIMESTAMP();

SELECT NOW();

SELECT NOW(),
       ADDDATE(NOW(), 2);

-- ==========================================
-- SAKILA DATABASE (Run only if installed)
-- ==========================================

USE sakila;

SELECT payment_date,
       ADDDATE(payment_date, 2)
FROM payment;

SELECT NOW(),
       YEAR(NOW()),
       MONTH(NOW()),
       EXTRACT(MONTH FROM NOW()),
       EXTRACT(MINUTE FROM NOW()),
       WEEKDAY(NOW());

SELECT NOW(),
       DATE_FORMAT(NOW(), '%m');

SELECT NOW(),
       DATE_FORMAT(NOW(), '%M');

SELECT NOW(),
       DATE_FORMAT(NOW(), 'Year is %Y, Month is %M');