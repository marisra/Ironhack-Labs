use sakila;

-- 1.Which actor has appeared in the most films?

select count(film_id) as nr_of_films, first_name, last_name from film_actor
inner join actor
on actor.actor_id = film_actor.actor_id 
group by actor.actor_id
order by count(film_actor.film_id) DESC
limit 1;

-- Most active customer (the customer that has rented the most number of films)

select first_name, last_name, count(rental_id) as nr_of_rentals from rental
inner join customer
on rental.customer_id = customer.customer_id 
group by customer.customer_id
order by count(rental_id) DESC
limit 1;

-- List number of films per category.
select name, count(film_id) as nr_of_films  from category
inner join film_category
using(category_id)
group by category.name;

-- Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff
inner join address
using(address_id);

-- Display the total amount rung up by each staff member in August of 2005.
select * from payment;

select first_name, last_name, sum(amount) from payment
inner join staff
using(staff_id)
where payment_date between "2005-08-01" and "2005-08-31" 
group by staff.staff_id;

-- List each film and the number of actors who are listed for that film.
select title, count(actor_id) as nr_of_actors from film
inner join film_actor
using(film_id)
group by film.film_id;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name. 
select first_name, last_name, sum(amount) as total_paid from payment
inner join customer
using(customer_id)
group by customer_id
order by 2;

-- Bonus: Which is the most rented film?
select title from film
inner join inventory
using(film_id)
inner join rental
on inventory.inventory_id = rental.inventory_id
group by film_id
order by count(rental_id) DESC
limit 1;
