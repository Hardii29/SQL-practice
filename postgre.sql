SELECT distinct customer_id as "Platinum" FROM payment WHERE amount>=7.99;
select * from film;
SELECT title as "Movie name", rental_rate as "Rental cost", replacement_cost FROM film 
WHERE rental_rate>2.99 OR replacement_cost>19.99;

SELECT title, rental_rate, rating from film where rental_rate 
between 3.99 and 4.99 order by rating asc limit 10;

select * from address;

select title from film where title ILIKE '%Rd%';

select address, district from address where district in('Dhaka','Uttar Pradesh');

select rental_rate, rental_duration, replacement_cost from film where rental_duration between 4 and 6 order by 
replacement_cost desc limit 100;

select title, length, rating, description from film where rating in('G','PG') and description like '%Action%' and length>120;