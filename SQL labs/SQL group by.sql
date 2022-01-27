use sakila;

-- In the table actor, what last names are not repeated?  

select last_name from actor
group by last_name
having count(last_name) = 1;

-- Which last names appear more than once? 

select last_name from actor
group by last_name
having count(last_name) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.

select staff_id, count(rental_id) as rentals_count from rental
group by staff_id;

-- Using the film table, find out how many films were released.

select count(film_id) as films_count from film;

-- Using the film table, find out how many films there are of each rating.

select rating, count(film_id) as films_count from film
group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.

select rating, round(avg(length),2) as average_movie_length from film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

select rating, round(avg(length),2) as average_movie_length from film
group by rating
having average_movie_length > 120;

