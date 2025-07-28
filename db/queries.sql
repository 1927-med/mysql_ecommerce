-- Example queries
SELECT * FROM users;
SELECT * FROM products WHERE category_id = 1;
SELECT * FROM orders WHERE user_id = 1;
SELECT * FROM order_items WHERE order_id = 1;

-- Join queries
SELECT u.username, o.order_date, o.total
FROM users u
JOIN orders o ON u.id = o.user_id;

SELECT p.name, oi.quantity
FROM products p
JOIN order_items oi ON p.id = oi.product_id
WHERE oi.order_id = 1;

-- Aggregate queries
SELECT SUM(total) AS total_revenue
FROM orders;

SELECT AVG(price) AS average_price
FROM products;

SELECT COUNT(*) AS num_orders
FROM orders
WHERE user_id = 1;