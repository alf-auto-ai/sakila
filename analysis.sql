-- 1. Total Revenue
SELECT SUM(amount) AS total_revenue
FROM payment;

-- 2. Monthly Revenue Trend
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
       SUM(amount) AS revenue
FROM payment
GROUP BY month
ORDER BY month;

-- 3. Top 10 Customers (High-Value Users)
SELECT customer_id,
       COUNT(*) AS transactions,
       SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- 4. Most Popular Movies (Most Watched Content)
SELECT f.title,
       COUNT(r.rental_id) AS rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY rentals DESC
LIMIT 10;

-- 5. Revenue by Category (Content Performance)
SELECT c.name AS category,
       SUM(p.amount) AS revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY revenue DESC;

-- 6. Customer Retention Proxy (Repeat Users)
SELECT customer_id,
       COUNT(rental_id) AS rentals_count
FROM rental
GROUP BY customer_id
HAVING rentals_count > 10
ORDER BY rentals_count DESC;

-- 7. Store Performance (if multiple locations)
SELECT store_id,
       COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY store_id;
