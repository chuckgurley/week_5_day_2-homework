-- inner join actro and filkm actor

-- SELECT actor.actor_id, first_name, last_name, film_id
-- FROM film_actor
-- INNER JOIN actor
-- ON actor.actor_id = film_actor.actor_id;

-- -- inner join actpr

-- SELECT first_name, last_name, title
-- FROM actor  -- table a
-- INNER JOIN film_actor --b
-- ON actor.actor_id = film_actor.actor_id
-- INNER JOIN film --table c
-- ON film_actor.film_id = film.film_id;
-- Inner JOIN on the actor and film_Actor table

-- SELECT first_name, last_name, email, country
-- FROM customer
-- INNER JOIN country
-- ON customer.customer_id = country.country_id
-- WHERE country = 'Angola';


-- SELECT first_name, last_name, email, country
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- INNER JOIN city
-- ON address.city_id = city.city_id
-- INNER JOIN country
-- ON city.country_id = country.country_id
-- WHERE country = 'Angola';



-- SELECT first_name, last_name, email, country
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- INNER JOIN city
-- ON address.city_id = city.city_id
-- INNER JOIN country
-- ON city.country_id = country.country_id
-- WHERE country = 'Angola';







-- SELECT actor.actor_id, first_name, last_name, film_id
-- FROM film_actor
-- INNER JOIN actor
-- ON actor.actor_id = film_actor.actor_id;

-- -- INNER JOIN on the actor, film_actor, and film table to see which actors are in what film
-- SELECT first_name, last_name, title --selecting columns from tables
-- FROM actor --table A
-- INNER JOIN film_actor --table B
-- ON actor.actor_id = film_actor.actor_id
-- INNER JOIN film --table c?
-- ON film_actor.film_id = film.film_id;

-- Ryan Rhoades [staff he/him]
--   1:19 PM
-- Join that will produce info about a customer
-- From the country of Angola
-- First Name, Last Name, Email, Country

-- SELECT country
-- FROM country;

-- SELECT first_name, last_name, email, country --selecting columns from tables
-- FROM customer --table A
-- INNER JOIN country --table B
-- ON customer.address_id = country.country
-- INNER JOIN film --table c?
-- ON film_actor.film_id = film.film_id;

-- -- find a customer id that has a payment amount greater then 175
-- SELECT customer_id, SUM(amount)
-- FROM payment
-- GROUP BY customer_id
-- HAVING SUM(amount) > 175
-- ORDER BY SUM(amount) DESC;

-- --SELECT store_id, first_name

-- SELECT store_id, first_name, last_name, address
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- INNER JOIN city
-- ON address.city_id = city.city_id
-- INNER JOIN country
-- ON city.country_id = country.country_id



-- SELECT fidt_name, last_name, address_id
-- FROM customer
-- WHERE addtess_id IN (
-- SELECT )

-- SELECT 
-- FROM horror
-- SELECT ttitle, film_id
-- FROM film
-- WHERE film_id IN(
-- 	SELECT film_id
-- 	FROM film_category
-- 	WHERE category_id IN (
-- 		SELECT category_id
-- 		FROM category
-- 		WHERE "name" 'Horror'
-- 	)
-- );   ryans work  V mine ^
---------------------------------------------------------------------------------------------------
-- --Inner JOIN on the actor and film_Actor table
-- SELECT actor.actor_id, first_name, last_name, film_id
-- FROM film_actor
-- INNER JOIN actor
-- ON actor.actor_id = film_actor.actor_id;

-- -- INNER JOIN on the actor, film_actor, and film table to see which actors are in what film
-- SELECT first_name, last_name, title --selecting columns from tables
-- FROM actor --table A
-- INNER JOIN film_actor --table B
-- ON actor.actor_id = film_actor.actor_id
-- INNER JOIN film --table c?
-- ON film_actor.film_id = film.film_id;

-- -- Join that will produce info about a customer
-- -- From the country of Angola
-- -- First Name, Last Name, Email, Country
-- SELECT first_name, last_name, email, country
-- FROM customer
-- INNER JOIN country
-- ON customer.customer_id = country.country_id
-- WHERE country = 'Angola';


-- SELECT first_name, last_name, email, country, city, address
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- INNER JOIN city
-- ON address.city_id = city.city_id
-- INNER JOIN country
-- ON city.country_id = country.country_id
-- WHERE country = 'Angola';

-- SELECT *
-- FROM customer;

-- SELECT *
-- FROM address;

-- --Find a customer_id that has a payment amount greater than 175
-- SELECT customer_id, sUM(amount)
-- FROM payment
-- GROUP BY customer_id
-- HAVING SUM(amount) > 175
-- ORDER BY SUM(amount) DESC;

-- SELECT store_id, first_name, last_name
-- FROM customer
-- WHERE customer_id IN (
-- 	SELECT customer_id
-- 	FROM payment
-- 	GROUP BY customer_id
-- 	HAVING SUM(amount) > 175
-- 	ORDER BY SUM(amount) DESC
-- );

-- SELECT store_id, first_name, last_name, address
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- INNER JOIN city
-- ON address.city_id = city.city_id
-- INNER JOIN country
-- ON city.country_id = country.country_id
-- WHERE country = 'United States' AND customer_id IN (
-- 	SELECT customer_id
-- 	FROM payment
-- 	GROUP BY customer_id
-- 	HAVING SUM(amount) > 175
-- 	ORDER BY SUM(amount) DESC
-- );

-- -- Subquery to find all films in english
-- --using the film table and language table
-- SELECT *
-- FROM film
-- WHERE language_id IN (
-- 	SELECT language_id
-- 	FROM "language"
-- 	WHERE "name" = 'English'
-- );

-- SELECT *
-- FROM "language";


-- -- Customers who live in dallas
-- SELECT first_name, last_name, address_id
-- FROM customer 
-- WHERE address_id IN (
-- 	SELECT address_id
-- 	FROM address
-- 	WHERE city_id IN (
-- 		SELECT city_id
-- 		FROM city
-- 		WHERE city = 'Dallas'
-- 	)
-- );

-- SELECT *
-- FROM category;

-- --Subquery to grab all horror movies
-- SELECT title, film_id
-- FROM film
-- WHERE film_id IN (
-- 	SELECT film_id
-- 	FROM film_category
-- 	WHERE category_id IN (
-- 		SELECT category_id
-- 		FROM category
-- 		WHERE "name" = 'Horror'
-- 	)
-- );	

-- SELECT district
-- FROM address;


--1. List all customers who live in Texas (useJOINs)
SELECT *
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';



--2. Get all payments above $6.99 with the Customer's Full Name
SELECT *
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.amount >6.99;

--3. Show all customers names who have made payments over $175(use subqueries)

-- SELECT first_name, last_name, customer_id
-- FROM customer 
-- WHERE customer_id IN (
-- 	SELECT customer_id
-- 	FROM payment
-- 	WHERE customer IN (
-- 		SELECT payment
-- 		FROM customer_id, payment_id
-- 		WHERE paymentid IS < 175;
		
-- SELECT *
-- FROM film
-- WHERE language_id IN (
-- 	SELECT language_id
-- 	FROM "language"
-- 	WHERE "name" = 'English'
-- );	


--4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, address_id
FROM customer 
WHERE address_id IN (
SELECT address_id
	FROM address
	WHERE city_id IN (
		SELECT city_id
		FROM city
		WHERE city = 'Nepal'
		
;




--6. How many movies of each rating are there?





--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)






-- 8. How many free rentals did our stores give away?