-- Review the tables in the database and explore tables
use sakila;
select * from actor;
-- Select one column from a table and get film titles.
select title from film;
-- Selecting a column to alias it.
select distinct name as language from language;
-- How many stores does the company have?
select * from store;
select count(store_id) from store;
-- Company has 2 stores.
-- How many employees?
select count(staff_id) from staff;
select first_name from staff;
-- The company has 2 employees.
-- Return the list of first names of the employees.
select first_name from staff;
