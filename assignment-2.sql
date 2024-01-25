SELECT * FROM salesman;

SELECT s.name, c.cust_name, c.city FROM salesman s INNER JOIN customer c ON s.city=c.city;

SELECT O.Ord_no, o.purch_amt, c.cust_name, c.city FROM "order" o INNER JOIN customer c ON o.customer_id=c.customer_id WHERE o.purch_amt BETWEEN 500 AND 2000;

SELECT c.cust_name, c.city, s.name, s.commission FROM customer c INNER JOIN salesman s ON c.salesman_id=s.salesman_id;

SELECT c.cust_name, c.city, s.name, s.commission FROM customer c INNER JOIN salesman s ON c.salesman_id=s.salesman_id WHERE s.commission>0.12;

SELECT c.cust_name, c.city AS "Customer City", s.name AS "Salesman", s.city AS "Salesman City", s.commission FROM customer c INNER JOIN salesman s ON c.salesman_id = s.salesman_id WHERE s.commission > 0.12 AND c.city != s.city;

SELECT o.Ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name AS "salesman", s.commission 
FROM (( "order" o INNER JOIN Customer c ON o.customer_id = c.customer_id)
INNER JOIN salesman s ON o.salesman_id = s.salesman_id);

SELECT c.cust_name, c.city AS "Customer City", c.grade, s.name AS "Salesman", s.city AS "Salesman City", s.commission 
FROM customer c INNER JOIN salesman s ON c.salesman_id = s.salesman_id ORDER BY c.customer_id ASC; 

SELECT c.cust_name, c.city AS "Customer City", c.grade, s.name AS "Salesman", s.city AS "Salesman City", s.commission 
FROM customer c INNER JOIN salesman s ON c.salesman_id = s.salesman_id WHERE c.grade<300 ORDER BY c.customer_id ASC; 

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
  FROM customer c LEFT JOIN "order" o ON c.customer_id=o.customer_id ORDER BY o.ord_date;

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name AS "salesman", s.commission 
FROM ((customer c LEFT OUTER JOIN "order" o ON c.customer_id=o.customer_id) LEFT OUTER JOIN salesman s ON c.salesman_id=s.salesman_id);

SELECT s.name FROM salesman s LEFT JOIN customer c ON s.salesman_id = c.salesman_id ORDER BY S.NAME;

SELECT s.name AS "salesman", c.cust_name, c.city, C.GRADE, o.ord_no, o.ord_date, o.purch_amt FROM ((SALESMAN S LEFT JOIN customer c 
ON c.salesman_id=s.salesman_id) LEFT JOIN "order" o ON c.customer_id=o.customer_id);

SELECT s.name AS "Salesman", o.purch_amt, c.grade FROM salesman s LEFT JOIN customer c ON s.salesman_id=c.salesman_id
LEFT JOIN "order" o ON c.customer_id=o.customer_id WHERE o.purch_amt >= 2000 AND grade IS NOT NULL;

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
 FROM customer c RIGHT JOIN "order" o ON c.customer_id= o.customer_id;

 select * from salesman cross join customer;

 SELECT c.cust_name, c.city AS "Customer City", s.name AS "Salesman", s.city AS "Salesman City"
 from salesman s cross join customer c where s.city=c.city;

 SELECT c.cust_name, c.city AS "Customer City", c.grade, s.name AS "Salesman", s.city AS "Salesman City"
 from salesman s cross join customer c where s.city is not null and c.grade is not null;

 SELECT c.cust_name, c.city AS "Customer City", c.grade, s.name AS "Salesman", s.city AS "Salesman City"
 from salesman s cross join customer c where s.city<>c.city and c.grade is not null;

 SELECT distinct s.salesman_id, s.name, c.customer_id, c.cust_name, o.Ord_no FROM salesman s JOIN "order" o ON s.salesman_id = o.salesman_idJOIN customer c ON o.customer_id = c.customer_id;