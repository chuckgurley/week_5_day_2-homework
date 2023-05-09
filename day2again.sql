SELECT actor.actor_id, first_name, last_name, film_id
from film_actor
INNER JOIN actor
ON actor.actor_id =  film_actor.actor_id;


SELECT first_name, last_name, title
from actor
INNER JOIN film_actor
ON actor.actor_id =  film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id;


select address
from address;

SELECT first_name, last_name, email, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

SELECT first_name, last_name, email, country
from customer
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = "Angola";



