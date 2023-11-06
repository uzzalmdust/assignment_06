USE `assignment_06`;

-- Task: 01

SELECT customers.*, count(orders.order_id) as total_oders
FROM `customers`
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;


-- Task: 02


SELECT order_items.order_id, products.name, order_items.quantity, (order_items.quantity*order_items.unit_price) as total_amount 
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
ORDER BY order_id;

-- Task: 03


SELECT categories.name as cname, sum(order_items.quantity*order_items.unit_price) as revenue 
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN categories
ON products.category_id = categories.category_id
GROUP BY cname
ORDER BY revenue DESC;

-- Task: 04


SELECT customers.customer_id, customers.name, sum(orders.total_amount) as purchase_amount
FROM customers
JOIN orders
ON  customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
ORDER BY purchase_amount DESC
LIMIT 5;