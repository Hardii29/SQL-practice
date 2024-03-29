CREATE VIEW "Customer_rental_info" AS
select concat(first_name, ' ', last_name) as "Customer name", email, sum(amount) as "Total rental",
case
when sum(amount)>200 then 'elite'
when sum(amount)>150 then 'Platinum'
when sum(amount)>100 then 'Gold'
when sum(amount)>0 then 'Silver'
end as "Customer category"
from customer c join payment p on c.customer_id=p.customer_id group by "Customer name", email;
drop view "Customer_rental_info";
select * from "Customer_rental_info";

CREATE DATABASE student;
DROP DATABASE pg;

CREATE TABLE Details(
roll_no SERIAL NOT NULL,
	name varchar(50) not null
);

CREATE DATABASE mycommerce;

CREATE TABLE order_details(
	orderid SERIAL not null unique primary key,
	customer_name varchar(50),
	product_name varchar(20),
	order_from varchar(10),
	order_amount decimal(5,2),
	order_date timestamp,
	delivery_date timestamp
);
ALTER TABLE order_details RENAME COLUMN customer_name TO customer_first_name;

ALTER TABLE order_details ADD COLUMN cancel_date timestamp;