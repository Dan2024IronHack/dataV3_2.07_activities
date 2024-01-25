USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name AS category,  COUNT(fc.film_id) AS film_count
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY c.category_id
ORDER BY film_count DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT email, SUM(p.amount)
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
GROUP BY s.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS number_of_film
FROM sakila.actor a
JOIN sakila.film_actor fa
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY number_of_film DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT email, COUNT(r.rental_id) AS number_of_rental
FROM sakila.customer c
JOIN sakila.rental r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id 
ORDER BY number_of_rental DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address, a.district
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT fa.film_id, COUNT(a.actor_id) AS number_of_actor
FROM sakila.actor a
JOIN sakila.film_actor fa
ON fa.actor_id = a.actor_id
GROUP BY fa.film_id
ORDER BY number_of_actor DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, COUNT(c.customer_id) AS no_of_rental, SUM(p.amount) AS total_paid
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id  = c.customer_id
GROUP BY c.customer_id
ORDER BY total_paid DESC;

-- 8. List the titles of films per category.
SELECT c.name AS category_id, f.title
FROM sakila.film f
JOIN sakila.film_category fc
ON f.film_id = fc.film_id
JOIN sakila.category c
ON fc.category_id = c.category_id
ORDER BY c.name;

SELECT *
FROM sakila.film f;

SELECT *
FROM sakila.category c;
