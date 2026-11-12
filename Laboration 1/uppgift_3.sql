SELECT product_name, unit_price
FROM products;

CREATE PROCEDURE increase_price()
LANGUAGE plpgsql
AS $$ 
BEGIN
    UPDATE products
    SET unit_price = unit_price / 1.05;
END;
$$;

CALL increase_price();

CREATE PROCEDURE increase_price_category(c INTEGER)
LANGUAGE plpgsql
AS $$ 
BEGIN
    UPDATE products
    SET unit_price = unit_price * 1.05
    WHERE category_id = c;
END;
$$;

CALL increase_price_category(1);
SELECT unit_price, product_name, category_id
FROM products
WHERE category_id = 1;

CREATE VIEW product_overview AS
SELECT product_name, categories.category_name, unit_price
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id;


CREATE VIEW product_overview_price AS
SELECT product_name, categories.category_name, ROUND((products.unit_price * 10)::numeric, 2) AS price_sek
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id;

SELECT *
FROM product_overview_price;

BEGIN;
UPDATE products
SET unit_price = 50
WHERE product_id = 5;

UPDATE products
SET unit_price = 35
WHERE product_id = 7;

SELECT product_id, product_name, unit_price
FROM products
WHERE product_id IN (5,7);

ROLLBACK;

BEGIN;
UPDATE products
SET unit_price = unit_price * 2
WHERE product_id = 1;

UPDATE products
SET relationshipstatus = 'In love'
WHERE product_id = 2;

ROLLBACK;

SELECT product_id, product_name, unit_price
FROM products
WHERE product_id IN (1, 2);