use world;

select continent, count(name) from country group by continent
having count(name)>10;
-- where can not be applied bcz of aggregate functions
-- having can apply over here

select continent, count(name) from country where continent like "a%"
group by continent having count(name)>10;