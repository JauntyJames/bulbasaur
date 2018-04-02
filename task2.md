# Task 2

- [x] Which customer has made the most rentals at store 2?

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
    ORDER BY rentals DESC
    LIMIT 10;
    ```

- [x] A customer tried to rent 'Image Princess' from store 1 on 29/07/2005 at 3pm
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

- [x] How many customers are active at any given month per year? We define active
as perfoming at least one rental during that month.
    
    month | customers
    ------|----------
    June 2005 | 2311
          
    ```
    WITH month_rental AS (
      SELECT * FROM rental
      WHERE EXTRACT(MONTH FROM rental_date) = 6 AND EXTRACT(YEAR FROM rental_date) = 2005
    )
    SELECT COUNT(month_rental.customer_id)
    FROM month_rental JOIN customer
    ON month_rental.customer_id = customer.customer_id;
    ```

- [x] Which film category is the most popular among our customers?

    Sports => 1179 rentals

    ```
    WITH categorized_film AS (
      SELECT category.name, film.film_id 
      FROM category
      JOIN film_category 
      ON category.category_id = film_category.category_id
      JOIN film
      ON film_category.film_id = film.film_id
    ),
    inventory_rental AS (
      SELECT * FROM rental
      JOIN inventory 
      ON rental.inventory_id = inventory.inventory_id
    )
    SELECT 
      COUNT(inventory_rental.rental_id) AS rentals,
      categorized_film.name
    FROM inventory_rental
    JOIN categorized_film
    ON categorized_film.film_id = inventory_rental.film_id
    GROUP BY categorized_film.name
    ORDER BY rentals DESC;
    ```

- [x] which film is the most popular in category 'Sports'?
    
    title | total_rentals
    ------|--------------
    'Gleaming Jawbreaker' | 29 rentals

    ```
    WITH sports_film AS (
      SELECT film.film_id, film.title
      FROM title
      JOIN film_category
      ON film_category.film_id = film.film_id
      JOIN category
      ON film_category = category.category_id
      WHERE category.name = 'Sports'
    ),
    inventory_rental AS (
      SELECT * FROM rental
      JOIN inventory
      ON rental.inventory_id = inventory.inventory_id
    )
    SELECT 
      COUNT(inventory_rental.rental_id) AS rentals, 
      sports_film.title
    FROM sports_film
    JOIN inventory_rental
    ON sports_film.film_id = inventory_rental.film_id
    GROUP BY sports_film.title
    ORDER BY rentals DESC;
    ```

- [x] Are there any other insights that you can gather from the data that would be helpful to the owner of the business?

    - What are genres are bringing in the most income?

      category | total_payments
      ---------|---------------
      Sports | $4892.19
      Sci-Fi | $4336.01
      Animation | $4245.31
      Drama | $4118.46

    ```
    WITH categorized_film AS (
      SELECT category.name, film.film_id
      FROM category
      JOIN film_category 
      ON category.category_id = film_category.category_id
      JOIN film
      ON rental.inventory_id = inventory.inventory_id
    ), 
    rental_payment AS (
      SELECT payment.amount, inventory.film_id
      FROM payment
      JOIN rental
      ON rental.rental_id = payment.rental_id
      JOIN inventory
      ON rental.inventory_id = inventory.inventory_id
    )
    SELECT 
      categorized_film.name, 
      SUM(rental_payment.amount) AS total_payments
    FROM categorized_film
    JOIN rental_payment
    ON categorized_film.film_id = rental_payment.film_id
    GROUP BY categorized_film.name
    ORDER BY total_payments DESC;
    ```

    This reveals that Sci-Fi films, for example, are bringing in more money than Action or Animation, despite being less popular. The owner of the business might use this data to inform future pricing decisions.

