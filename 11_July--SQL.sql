use world;

-- numeric functions
select lifeexpectancy, round(lifeexpectancy) from country; -- round function
select 34.58,round(34.58);
select 76.469, round(76.469,1); -- after decimal values
select 76.269, round(76.269,2);

-- round off to nearest 10, 100, 1000
select 9, round(9.5, -1); -- before decimal values to nearest 10
select 65.8, round(65.8, -1);
select 13.2, round(13.2,-2); -- to nearest 100
select 244.6, round(244.6,-2);
select 257.6, round(257.6,-3); -- to nearest 1000

select round(34.857, -1), truncate(34.857, 1), mod(4,2), mod(3,5); -- truncate just shows the values after decimal and mod gives the rem
select floor(34.001), floor(34.99999); -- discards the value after decimal
select ceil(34.000001); -- always shows the upper value
select abs(10.1111) , abs(-10.1233232);
