use world;
show tables; -- shows all the table

select name, population, continent from country where continent = "asia" xor population>195000;

-- between
select * from city where population between 100000 and 150000;
select * from city where name between "a" and "b";
select * from city where name not between "a" and "b";

-- in
select * from city where name in("jaipur","jodhpur","delhi");
select * from city where name not in("jaipur","jodhpur","delhi");

-- like
select * from city where name like "breda";
select * from city where name like "b%"; -- first letter
select * from city where name like "ka%"; -- starting 2 letter
select * from city where name like "%a"; -- last letter
select * from city where name like "b%a";
select * from city where name like "%a%"; -- it can be anywhere
select * from city where name like "A_";
select * from city where name like "a___";
select * from city where name like "s%_";
select * from city where name like "a%__";
select * from city where name like "_a%_";

select name, population from city where name like "%e%";
select name, population from city where name like "%b_";
select name, population from city where name like "_a%r_";
select name, population from city where name like "%aa%";
select name, population from country where name like "_%e_e%_";