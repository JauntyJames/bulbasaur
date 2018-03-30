# Task 2

[x] Which customer has made the most rentals at store 2?

Karl Seal

```
WITH customers AS (
  SELECT * FROM customer
  WHERE store_id = 2
  )
SELECT 
  COUNT(rental.customer_id) AS rentals,
  customers.first_name,
  customers.last_name
FROM rental JOIN customers
ON rental.customer_id = customers.customer_id
GROUP BY 
  customers.customer_id,
  customers.first_name,
  customers.last_name
ORDER BY rentals desc
LIMIT 10;
```

[x] A customer tried to rent 'Image Princess' from store 1 on 29/07/2005 at 3pm
but it was sold out. would he be able to rent it from store 2 if he tried?

Yes

```
WITH image_princess AS (
  SELECT film.title, inventory.store_id, inventory.inventory_id
  FROM film JOIN inventory
  ON film.film_id = inventory.film_id
  WHERE title = 'Image Princess' AND store_id = 2
)
SELECT 
  image_princess.inventory_id, 
  image_princess.store_id,
  rental.rental_date,
  rental.return_date
FROM film JOIN inventory
ON image_princess.inventory_id = rental.inventory_id;
```

[x] How many customers are active at any given month per year? We define active
as perfoming at least one rental during that month.

June 2005 => 2311

```
WITH month_rental AS (
  SELECT * FROM rental
  WHERE EXTRACT(MONTH FROM rental_date) = 6 AND EXTRACT(YEAR FROM rental_date) =
  2005
)
SELECT COUNT(month_rental.customer_id)
FROM month_rental JOIN customer
ON month_rental.customer_id = customer.customer_id;
```

[ ] Which film category is the most popular among our customers?

[ ] which film is the most popular in category 'Sports'?

[ ] Are there any other insights that you can gather from the data that would be
helpful to the owner of the business?
