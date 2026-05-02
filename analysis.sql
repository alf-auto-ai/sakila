-- Total revenue
SELECT SUM(amount) AS total_revenue FROM payment;

-- Revenue by month
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month, SUM(amount) AS revenue
FROM payment
GROUP BY month
ORDER BY month;

-- Top 10 customers by revenue
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Most rented movies
SELECT film_id, COUNT(*) AS rentals
FROM rental
GROUP BY film_id
ORDER BY rentals DESC
LIMIT 10;
