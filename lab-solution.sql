use sakila;

# 1 Get all pairs of actors that worked together.

SELECT FA1.actor_id, FA2.actor_id
FROM film_actor FA1
JOIN film_actor FA2
ON FA1.film_id = FA2.film_id AND FA1.actor_id != FA2.actor_id;


# 2 Get all pairs of customers that have rented the same film more than 3 times.

SELECT R1.customer_id, R2.customer_id, I.film_id, COUNT(*) AS num_rentals
FROM rental R1
JOIN rental R2 ON R1.customer_id < R2.customer_id AND R1.inventory_id = R2.inventory_id
JOIN inventory I ON R2.inventory_id = I.inventory_id
GROUP BY R1.customer_id, R2.customer_id, I.film_id
HAVING num_rentals > 1;

# 3 Get all possible pairs of actors and films.

SELECT F.film_id, A.actor_id
FROM film F
CROSS JOIN actor A;
