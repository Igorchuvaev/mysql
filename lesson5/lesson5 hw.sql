USE vk;

-- 1
UPDATE users SET created_at = NOW(), updated_at = NOW();

-- 2
DROP TABLE  IF EXISTS user2;
CREATE TABLE user2(
	id SERIAL PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50), 
	created_at VARCHAR(50),
	updated_at VARCHAR(50)
);

INSERT user2 (firstname,lastname,created_at,updated_at)
VALUES ('Vasiliy', 'Sidorov', '20.10.2017 8:10', '20.10.2017 8:10'
);

UPDATE user2 SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'); 
UPDATE user2 SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE user2 MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
ALTER TABLE user2 MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;

-- 3
CREATE TABLE storehouses_products(
	value BIGINT UNSIGNED,
	product_name VARCHAR (50)
);

INSERT storehouses_products (value, product_name)
VALUES 
	(0, 'товар1'),
	(2500, 'товар2'),
	(0, 'товар3'),
	(30, 'товар4'),
	(500, 'товар5'),
	(1, 'товар6');

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN TRUE ELSE FALSE END, value;

-- 4

SELECT user_id, birthday FROM profiles WHERE birthday LIKE '%08%' OR birthday LIKE '%05%';

-- 5  

CREATE TABLE store_unit (
	id SERIAL PRIMARY KEY,
	unit VARCHAR (30)
);

INSERT store_unit (id,unit)
VALUES 
	(1, 'товар1'),
	(2, 'товар2'),
	(5, 'товар3');
SELECT id, unit, FIELD( id,5,1,2) AS new_id FROM store_unit WHERE id IN (5,1,2);
SELECT * FROM store_unit WHERE id IN (5,1,2) ORDER BY FIELD(id,5,1,2); 



-- Практическое задание по теме “Агрегация данных”

-- 1 

ALTER TABLE profiles ADD age_user2 INT NOT NULL;

UPDATE profiles SET age_user2 = TIMESTAMPDIFF(YEAR, birthday, NOW());

SELECT AVG(age_user2) FROM profiles;

-- 2 Постараюсь доделать

-- 3

CREATE TABLE multiplication (
	id SERIAL PRIMARY KEY, 
	value INT NULL 
);

INSERT INTO multiplication (value) VALUES
	(1),
	(2),
	(3),
	(4),
	(5);

SELECT exp(SUM(ln(value))) mult FROM multiplication;

