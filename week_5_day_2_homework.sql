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


SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount)> 175
	ORDER BY SUM(amount) DESC
);


--4. List all customers that live in Nepal (use the city table)


SELECT country
FROM city
JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Nepal';

--6. How many movies of each rating are there?


SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating)DESC;


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)



SELECT store_id,first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 6.99
	ORDER BY SUM(amount) DESC
);



-- 8. How many free rentals did our stores give away?
		
SELECT amount
FROM payment
GROUP BY amount
ORDER BY COUNT(amount)ASC;
