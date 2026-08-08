create database f_db;
use f_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'John'),
(102,'Alice'),
(103,'David');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- foreign key
    product_id INT,
    quantity INT,
    constraint customer_ID_FK foreign key (customer_id) references customers (customer_id)
    on delete cascade,
    constraint product_ID_FK foreign key (product_id) references products (product_id));
    


INSERT INTO orders VALUES
(10001,101,2,9);

select * from orders;

INSERT INTO orders VALUES -- it will give error bcz 100 is not in customers table
(10002, 108, 2, 5); 

-- syntax of foreign key(imp)
/*
create table child_table(
column1 data_type,
column2 data_type,
...
constraint fk_name foreign key (column1) references parent_table(parent_column);
*/

insert into customers values(108, "raja");
select * from customers;
select * from orders;

INSERT INTO orders VALUES -- now it will get inserted
(10002, 108, 2, 5); 

select * from products;

insert into orders -- it will give error
values(10003, 101, 7, 2);

select * from orders o left join
products p on o.product_id = p.product_id;

-- orders table will be the child table 
-- customers and product table will be the parent table

-- DML(INSERT)
DELETE FROM CUSTOMERS WHERE CUSTOMER_ID = 101;

-- parent record cannot be deleted directly without deleting the child record
-- when you delete parent record child record will be deleted directly by using cascade

select * from customers;
select * from orders;