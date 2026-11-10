SELECT product_name, unit_price
FROM products;

CREATE PROCEDURE increase_price()
LANGUAGE plpgsql
AS $$ 
BEGIN
    UPDATE products
    SET unit_price = unit_price * 1.05;
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

SELECT *
FROM product_overview;

CREATE VIEW product_overview AS
SELECT product_name, categories.category_name, unit_price
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id;
