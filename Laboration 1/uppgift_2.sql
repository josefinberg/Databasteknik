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


Undersök beställning 10249. Ta fram vilka produkter som ingår i beställningen och vilken leverantör som levererar respektive produkt.

För att lösa uppgiften behöver du kombinera information från flera relaterade tabeller.

Ta reda på hur många anställda som har titeln Sales Representative. Resultatet ska visas som ett antal.

Beräkna det totala värdet av de produkter som beställdes den 12 december 1996.

2.17 (VG)
Ta fram den totala sålda mängden för varje produkt och visa samtidigt vilken kategori produkten tillhör.

Resultatet ska innehålla produktens namn, kategori och den totala mängd som har sålts av produkten.

Ta reda på vilka kunder som aldrig har gjort någon beställning.

Det finns flera sätt att lösa uppgiften. Välj en lämplig SQL-lösning och var beredd att förklara hur din lösning identifierar kunder som saknar beställningar.

Höj priset med 20 % för samtliga produkter som tillhör kategorin med category_id = 4.

Kontrollera priserna före och efter uppdateringen så att du kan verifiera att rätt produkter har ändrats.

Höj priset med 10 % för samtliga produkter som levereras av Tokyo Traders.

Kontrollera priserna före och efter uppdateringen och verifiera att endast produkter från rätt leverantör har ändrats.