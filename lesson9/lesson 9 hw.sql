-- 1 
USE example;

INSERT INTO sample.users 
SELECT * shop.users WHERE id = 1;
DELETE FROM shop.users  WHERE  id = 1;
COMMIT;

SELECT * FROM shop.users;
SELECT * FROM sample.users;
 
-- 2
USE shop;

CREATE VIEW prod.description  AS SELECT 
	products.name  AS product,
	catalogs.name AS catalogs
FROM products

LEFT JOIN catalogs ON products.catalog_id =  catalogs.id;

SELECT * FROM prod.description;

-- Администрирование и урок от 05.11 буду пересматривать, поэтому пока ДЗ только в "урезанном формате".


