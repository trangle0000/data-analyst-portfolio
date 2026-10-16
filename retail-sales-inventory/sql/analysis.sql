
-- =====================================================
-- RETAIL SALES & INVENTORY ANALYSIS
-- Database: Oracle SQL
-- Project: Data Analyst Portfolio
-- =====================================================


-- 1. MONTHLY SALES ANALYSIS
-- Calculate monthly revenue and completed orders.

SELECT
    TO_CHAR(o.order_date, 'YYYY-MM') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY sales_month;


-- 2. TOP-SELLING PRODUCTS
-- Identify products generating the highest revenue.

SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    p.product_name,
    p.category
ORDER BY revenue DESC;


-- 3. SALES BY CATEGORY
-- Compare revenue across product categories.

SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY revenue DESC;


-- 4. CUSTOMER ANALYSIS
-- Calculate spending and order counts per customer.

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.country,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city,
    c.country
ORDER BY total_spent DESC;


-- 5. INVENTORY ANALYSIS
-- Identify products that require restocking.

SELECT
    p.product_name,
    p.category,
    i.stock_quantity,
    i.reorder_level,
    CASE
        WHEN i.stock_quantity < i.reorder_level
        THEN 'Reorder Needed'
        ELSE 'Sufficient Stock'
    END AS stock_status
FROM inventory i
JOIN products p
    ON i.product_id = p.product_id
ORDER BY i.stock_quantity ASC;
