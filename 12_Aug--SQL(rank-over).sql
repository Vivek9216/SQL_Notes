create database rankdb; 

use rankdb;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    category VARCHAR(30),
    product VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2)
);


INSERT INTO orders
(order_id, order_date, customer_id, customer_name, city, category, product, quantity, amount)
VALUES
(1001, '2026-01-05', 201, 'Amit',   'Jaipur',  'Electronics', 'Laptop',       1, 65000),
(1002, '2026-01-10', 202, 'Neha',   'Delhi',   'Electronics', 'Mobile',       2, 50000),
(1003, '2026-01-15', 201, 'Amit',   'Jaipur',  'Furniture',   'Chair',        4, 12000),
(1004, '2026-01-20', 203, 'Rahul',  'Mumbai',  'Electronics', 'Headphones',   3, 9000),
(1005, '2026-01-25', 204, 'Priya',  'Delhi',   'Clothing',    'Jacket',       2, 8000),

(1006, '2026-02-03', 201, 'Amit',   'Jaipur',  'Electronics', 'Mobile',       1, 28000),
(1007, '2026-02-08', 202, 'Neha',   'Delhi',   'Furniture',   'Table',        1, 15000),
(1008, '2026-02-12', 203, 'Rahul',  'Mumbai',  'Clothing',    'Shoes',        2, 10000),
(1009, '2026-02-18', 205, 'Vikas',  'Pune',    'Electronics', 'Laptop',       1, 70000),
(1010, '2026-02-25', 204, 'Priya',  'Delhi',   'Furniture',   'Sofa',         1, 35000),

(1011, '2026-03-02', 201, 'Amit',   'Jaipur',  'Clothing',    'Shirt',        5, 7500),
(1012, '2026-03-07', 202, 'Neha',   'Delhi',   'Electronics', 'Headphones',   2, 6000),
(1013, '2026-03-11', 203, 'Rahul',  'Mumbai',  'Electronics', 'Laptop',       1, 68000),
(1014, '2026-03-16', 205, 'Vikas',  'Pune',    'Furniture',   'Chair',        6, 18000),
(1015, '2026-03-21', 204, 'Priya',  'Delhi',   'Clothing',    'Shoes',        1, 5500),

(1016, '2026-04-04', 201, 'Amit',   'Jaipur',  'Electronics', 'Tablet',       1, 22000),
(1017, '2026-04-09', 202, 'Neha',   'Delhi',   'Clothing',    'Jacket',       1, 4500),
(1018, '2026-04-14', 203, 'Rahul',  'Mumbai',  'Furniture',   'Table',        2, 30000),
(1019, '2026-04-20', 205, 'Vikas',  'Pune',    'Electronics', 'Mobile',       2, 52000),
(1020, '2026-04-27', 204, 'Priya',  'Delhi',   'Electronics', 'Laptop',       1, 72000);

select customer_id, customer_name,
order_id, order_date, row_number() over(partition by customer_id order by order_date) from orders;

 select order_id, customer_name, amount, row_number() over(order by amount desc) from orders;
 
 select category, order_id, amount, rank() over(partition by category order by amount desc) from orders;
 
 select order_id, amount, avg(amount) over(partition by category) as category_avg, amount - avg(amount) over(partition by category)
 as difference from orders;
 
 select * from
 (select customer_id, customer_name, order_id ,amount, max(amount) over(partition by customer_id) as customer_max from orders)
 as t where amount = customer_max; 
 
 select * from
 (select customer_id, customer_name, order_id ,amount, rank() over(partition by customer_id order by amount desc) as customer_rank from orders)
 as t where customer_rank = 1; 
 
 select * from
 (select customer_id, customer_name, order_id ,amount, rank() over(partition by customer_id order by amount desc) as customer_rank from orders)
 as t where customer_rank = 1 or customer_rank = 2; 
 
 select * from
 (select customer_id, customer_name, order_id ,amount, rank() over(partition by customer_id order by amount desc) as customer_rank from orders)
 as t where customer_rank = 2; 
 
 select customer_name, order_id, amount, sum(amount) over(partition by customer_id) as total_spending,
round( (amount/sum(amount) over(partition by customer_id))*100, 2) as percentage from orders;
