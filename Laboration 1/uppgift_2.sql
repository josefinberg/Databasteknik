SELECT employees.first_name, employees.last_name FROM employees;

SELECT employees.home_phone FROM employees WHERE employees.title = 'Vice President, Sales';

SELECT suppliers.contact_name, suppliers.contact_title, suppliers.company_name FROM suppliers WHERE suppliers.company_name = 'Svensk Sjöföda AB';

SELECT first_name, last_name, birth_date
FROM employees
ORDER BY employees.birth_date DESC;

SELECT company_name, country, city
FROM customers
ORDER BY country ASC, city ASC;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%an%';

SELECT first_name, last_name, title
FROM employees
WHERE title LIKE '%Vice%'
OR title LIKE '%President%'
OR title LIKE '%Manager%';

SELECT product_name, unit_price, unit_price * 1.07 AS new_price
FROM products;

SELECT product_name, unit_price * units_in_stock AS inventory_value 
FROM products;

SELECT product_name
FROM products
WHERE units_in_stock < reorder_level;

SELECT product_name
FROM products
WHERE (units_in_stock + units_on_order) < reorder_level;

SELECT category_name
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
WHERE products.product_name = 'Lakkalikööri';

SELECT product_name, company_name
FROM products
INNER JOIN suppliers
ON products.supplier_id = suppliers.supplier_id
WHERE product_name = 'Gravad lax';


SELECT product_name, suppliers.company_name
FROM products
INNER JOIN suppliers
ON products.product_id = supplier.supplier_id
INNER JOIN suppliers
ON 
WHERE order_id = 10249 ;

SELECT products.product_name, suppliers.company_name FROM orders
INNER JOIN order_details ON (order_details.order_id = orders.order_id)
INNER JOIN products ON (products.product_id = order_details.product_id)
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
WHERE orders.order_id = 10249;


SELECT COUNT (title)
FROM employees
WHERE title = 'Sales Representative';

SELECT SUM(order_details.unit_price * quantity)
FROM order_details
INNER JOIN orders ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id
WHERE order_date = '1996-12-12';

SELECT products.product_name, categories.category_name, SUM(order_details.quantity)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
INNER JOIN order_details ON products.product_id = order_details.product_id
GROUP BY products.product_name, categories.category_name;

SELECT company_name
FROM customers
INNER JOIN customers ON customers.customer_id = orders.customer_id
WHERE order_details.quantity = 0;
SELECT customers.company_name
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.order_id IS NULL;

SELECT unit_price, product_name
FROM products
WHERE category_id = 4; 

UPDATE products
SET unit_price = unit_price * 1.20
WHERE category_id = 4;

SELECT unit_price, product_name
FROM products
WHERE category_id = 4; 

SELECT products.product_name, products.unit_price
FROM products
INNER JOIN suppliers ON suppliers.supplier_id = products.supplier_id
WHERE suppliers.company_name = 'Tokyo Traders';

UPDATE products
SET unit_price = unit_price * 1.10
FROM suppliers
WHERE suppliers.supplier_id = products.supplier_id
  AND suppliers.company_name = 'Tokyo Traders';
