use rankdb;

select *, lead(amount,1) over(), lead(amount,2) over() from orders;

select *, lag(amount,1) over() from orders;

select * from orders order by customer_name, category;

select *, lead(amount,1) over(partition by customer_id),
amount - lead(amount,1) over(partition by customer_id)
from orders;

select *, lag(amount,1) over(partition by customer_id order by order_date) as prev2,
lag(amount,2,0) over(partition by customer_id order by order_date) as prev3,
amount + lag(amount,1,0) over(partition by customer_id order by order_date) +
lag(amount,2,0) over(partition by customer_id order by order_date)
from orders;

select customer_id, customer_name, amount,
sum(amount) over(rows between unbounded preceding and current row) from orders;

select customer_id, customer_name, amount,
sum(amount) over(order by amount) from orders;
-- cannot be used bcz same amount will not be added again if they are continuous

select customer_id, customer_name, amount,
sum(amount) over(rows between 1 preceding and current row) from orders;

select order_id, customer_id, customer_name, amount, sum(amount)
over(order by amount rows between unbounded preceding and current row)
from orders;

select order_id, customer_id, customer_name, order_date, amount,
sum(amount) over(partition by customer_id order by order_date
rows between 2 preceding and current row)
from orders;

select order_id, customer_id, customer_name, order_date, amount,
sum(amount) over(partition by customer_id order by order_date
rows between 1 preceding and 1 following)
from orders;