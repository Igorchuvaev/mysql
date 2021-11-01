-- 3
DROP DATABASE IF EXISTS airlogs;
CREATE DATABASE airlogs;
USE airlogs;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	departure VARCHAR (50),
	arrival VARCHAR (50)
);
INSERT INTO flights (departure, arrival) VALUES 
	('MOSCOW', 'OMSK'),
	('NOVGOROD', 'KAZAN'),
	('IRKUTSK', 'MOSCOW'),
	('OMSK', 'IRKUTSK'),
	('MOSCOW', 'KAZAN');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	label VARCHAR (50),
	name VARCHAR (50)
);

INSERT INTO cities (label, name) VALUES 
	('MOSCOW','ÃŒ— ¬¿'),
	('IRKUTSK','»– ”“— '),
	('NOVGOROD','ÕŒ¬√Œ–Œƒ'),
	('KAZAN',' ¿«¿Õ‹'),
	('OMSK','ŒÃ— ');


SELECT 
	id,
	(SELECT name FROM cities WHERE label = flights.departure) AS '¬˚ÎÂÚ',
	(SELECT name FROM cities WHERE label= flights.arrival ) AS 'œËÎ∏Ú'
FROM flights;


-- 1

DROP DATABASE IF EXISTS shop;
USE shop;
SELECT 
	u.id AS user_id, u.name,
	o.id AS order_id
FROM users u
RIGHT JOIN orders o ON u.id = o.user_id;

-- 2


SELECT 
	p.id, p.name, p.price,
	c.id AS cat_id,
	c.name AS catalog
FROM products p
JOIN catalogs c ON p.catalog_id = c.id; 
