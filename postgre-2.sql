select distinct first_name, count(*) from actor group by first_name order by count desc;

select * from language;

select name, title, rental_rate from language inner join film on language.language_id = film.language_id;

select a.first_name, count(f.film_id) from actor a join film_actor f 
on a.actor_id=f.actor_id group by a.first_name order by count desc;

select CONCAT(a.first_name, '', a.last_name) AS "ACTOR NAME", count(fa.film_id) AS "TOTAL MOVIES" 
from actor a join film_actor fa on a.actor_id=fa.actor_id join film f on fa.film_id=f.film_id 
group by "ACTOR NAME" order by "TOTAL MOVIES" desc;

SELECT * FROM rental;

select f.rating, count(r.rental_id) from film f join inventory i on f.film_id=i.film_id 
join rental r on i.inventory_id=r.inventory_id group by f.rating order by count desc;

select extract(quarter from current_date) ;

select current_date;

select rental_date, return_date, AGE(return_date,rental_date), first_name, last_name, email 
from rental join customer on rental.customer_id=customer.customer_id 
where return_date is not null and AGE(return_date,rental_date)>= interval'7 days' order by AGE asc;

select title, substr(title,10) from film;

select title, substr(title,15) from film where length(title)>15;

select title, substr(title,6,3) from film;
select title, substr(title,6,1) from film;

select city_id, cast(city_id as varchar) from address;

select title, rental_rate, 
case 
	when rental_rate<1 then 'Budget'
	when rental_rate>=1 and rental_rate<=4 then 'Standard'
	when rental_rate>4 then 'Premium'
end as "category"
from film;

select address, address2, coalesce(address2, 'house') from address;

select amount, coalesce(10/nullif(amount,0), 0) from payment where amount=0;

create view movie_cast_details as
select film_id, title, rating, name from film join language on film.language_id=language.language_id;

select * from movie_cast_details where rating='G';

select CONCAT(first_name, ' ', last_name) as "Customer name", email, sum(p.amount) as "Total rental",
case
when sum(p.amount)>0 then 'silver'
when sum(p.amount)>100 then 'gold'
when sum(p.amount)>150 then 'platinum'
when sum(p.amount)>200 then 'elite'
end as "Customer category"
from customer c join payment p on c.customer_id=p.customer_id;