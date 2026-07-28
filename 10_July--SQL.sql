-- functions:
-- block of code, collection of statement --> perfrom certain task
-- code reusable
-- code duplicacy is removed
-- make your code divided into smaller section

-- Inbuilt functions
-- scalar functions --> applies on every row and return the output of every row

-- string,number,date
use world;
select name, continent, concat(continent," have ", name) from country;
-- used to add or seperate the strings

-- concat_ws(with seperator)
select name, continent, concat_ws("-", name, continent) from country; 

select name,upper(name) from country;
select name,lower(name) from country;

select name, substr(name,1) from country;
-- used for the indexing of the string
select name, substr(name,2) from country;
select name, substr(name,2,4) from country; -- extract string character
-- 4 means the length of the 4 letter not till the 4th letter
select name, substr(name,-4) from country;
-- last 4 characters

select name, length(name), char_length(name) from country;
-- length is used for total no. of bytes
-- char_length is used for total no. of characters

select name, replace(name,"a","@") from country;
-- used to replace

select trim(     "he llo"    );
-- remove wide spaces from starting and ending

select name, lpad(name,6,"-") from country;
-- for making specific count of string at left

select name, rpad(name,6,"-") from country;
-- for making specific count of string at right

select current_date(), current_time(), current_timestamp(), now();
select now(), adddate(now() ,2);
-- addition of date

select now(), adddate(now(),-40);
-- also can subtract the date

select adddate(now(), interval 1 month);
select adddate(now(), interval 1 year);
select adddate(now(), interval 1 week);
select adddate(now(), interval 1 quarter);

select now(), year(now()), month(now()), extract(month
from now()), extract(minute from now());

select now(), date_format(now(),"%m"); -- no. of month
select now(), date_format(now(), "%M"); -- name of month
select now(), date_format(now(), "%YY"); -- y will be the chars