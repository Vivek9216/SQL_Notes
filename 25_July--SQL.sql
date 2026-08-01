use world;

select name, indepyear, ifnull(indepyear, 0) from country;
-- ifnull -> values can be replaced by any character or number

select name, indepyear, lifeexpectancy, coalesce(indepyear, lifeexpectancy,
name) from country;
-- coalesce -> the first column which is non-null will be return by coalesce

-- case statement --> it works like if-else statement
select name, population, indepyear, if(indepyear>1947, True, false) from country;
select name, population, indepyear, if(indepyear>1947, "After india", "Before india") from country;

select name, population, indepyear,
if( indepyear>1947, "After India",
	if(indepyear>1920,"just before india","before india independence")) from country;
    
-- select col, col2,
-- case,
	-- when condition then -------
    -- when condition2  then ------------
-- end case
-- from table

select name, population, indepyear,
case
	when indepyear>1947 then "After 1947"
    when indepyear>1919 then "only after 1919"
    
    else "no condition"
end
from country;

select name, population,
case
	when population between 200000 and 500000 then "small population"
    when population> 500000 then "average population"
    
    else "large population"
end
from country;

select continent, count(name), 
case
	when count(name)>25 then "large scale continent"
    when count(name)>15 then "average scale continent"
    when count(name)>10 then "small scale continent"
end
from country group by continent;