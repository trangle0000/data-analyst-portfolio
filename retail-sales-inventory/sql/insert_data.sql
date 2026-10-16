-- ==================================================
-- RETAIL SALES & INVENTORY ANALYSIS
-- Sample Data Insertion
-- Database: Oracle SQL
-- ==================================================

-- 1. CUSTOMERS
INSERT INTO customers
(customer_id, customer_name, city, country)
VALUES (1, 'Anna Kowalska', 'Warsaw', 'Poland');

INSERT INTO customers
(customer_id, customer_name, city, country)
VALUES (2, 'John Smith', 'London', 'UK');

INSERT INTO customers
(customer_id, customer_name, city, country)
VALUES (3, 'Maria Nowak', 'Krakow', 'Poland');

INSERT INTO customers
(customer_id, customer_name, city, country)
VALUES (4, 'Emma Brown', 'Berlin', 'Germany');

INSERT INTO customers
(customer_id, customer_name, city, country)
VALUES (5, 'David Lee', 'Warsaw', 'Poland');

-- 2. PRODUCTS

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (101, 'Cotton T-Shirt', 'Tops', 25);

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (102, 'Summer Dress', 'Dresses', 59);

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (103, 'Denim Jeans', 'Bottoms', 75);

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (104, 'Casual Blouse', 'Tops', 45);

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (105, 'Midi Skirt', 'Bottoms', 49);

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (106, 'Winter Jacket', 'Outerwear', 129);

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (107, 'Cardigan', 'Outerwear', 35);

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES (108, 'Leggings', 'Bottoms', 65);

-- 3. ORDERS
-- Order data for retail sales analysis

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1001, 1, DATE '2026-01-10', 'Completed');

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1002, 2, DATE '2026-01-15', 'Completed');

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1003, 3, DATE '2026-02-05', 'Completed');

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1004, 1, DATE '2026-02-18', 'Completed');

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1005, 4, DATE '2026-03-08', 'Completed');

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1006, 5, DATE '2026-03-20', 'Completed');

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1007, 2, DATE '2026-04-12', 'Pending');

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES (1008, 3, DATE '2026-04-25', 'Completed');

-- 4. ORDER ITEMS

INSERT INTO order_items VALUES (1, 1001, 101, 2, 25);
INSERT INTO order_items VALUES (2, 1001, 104, 1, 45);
INSERT INTO order_items VALUES (3, 1002, 102, 1, 59);
INSERT INTO order_items VALUES (4, 1003, 103, 2, 75);
INSERT INTO order_items VALUES (5, 1003, 107, 1, 35);
INSERT INTO order_items VALUES (6, 1004, 105, 2, 49);
INSERT INTO order_items VALUES (7, 1005, 106, 1, 129);
INSERT INTO order_items VALUES (8, 1006, 108, 2, 65);
INSERT INTO order_items VALUES (9, 1006, 101, 3, 25);
INSERT INTO order_items VALUES (10, 1007, 102, 1, 59);
INSERT INTO order_items VALUES (11, 1008, 104, 2, 45);
INSERT INTO order_items VALUES (12, 1008, 107, 2, 35);

-- 5. INVENTORY

INSERT INTO inventory VALUES (1, 101, 120, 30);
INSERT INTO inventory VALUES (2, 102, 15, 20);
INSERT INTO inventory VALUES (3, 103, 80, 25);
INSERT INTO inventory VALUES (4, 104, 12, 20);
INSERT INTO inventory VALUES (5, 105, 60, 15);
INSERT INTO inventory VALUES (6, 106, 8, 15);
INSERT INTO inventory VALUES (7, 107, 18, 20);
INSERT INTO inventory VALUES (8, 108, 95, 30);

COMMIT;