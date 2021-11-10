/*

1. ����� (������, ��������� �����, �����, ����������)
	�������
	�������������
	��� ������
	���������
	
2. �������� �������
	������� ������
	�������
	
3. �������������� ������	
	������� ������
	�������	

6. ������
	ID ������
	��� ������
	����� ������
	
7. �������������
	ID �������������
	������������ �������������
	������ �������������
	
8. ��������
	ID ��������
	��������� ��������
	
9. ���������� ������
	ID ��������
	������ ��������	
	���������� ������

	
10. ������� (���� ������ �� ���� ������������)
	������� ������
	���������� ������� ������
	��������� ��������
	� ������
*/	

DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	maker VARCHAR (50),
	product_type enum('hookah', 'mix', 'coal', 'accessories') NOT NULL,
	coast INT UNSIGNED NOT NULL	
);

INSERT INTO products (maker, product_type, coast) 
VALUES 
	('Sphinx','hookah', 5000),
	('Magix', 'hookah', 2000),
	('Amy', 'hookah', 7000),
	('Dark Side', 'mix', 700),
	('Adalya', 'mix', 500),
	('Fumari', 'mix', 800),
	('Cocobrico Flat', 'coal', 800),
	('Coconara Flat', 'coal', 400),
	('Koko HAPA', 'coal', 800),
	('Khalil Mamoon', 'accessories', 600);

DROP TABLE IF EXISTS balance;
CREATE TABLE balance(
	balance_id SERIAL, 
	balance_product  INT UNSIGNED DEFAULT 0,
	FOREIGN KEY (balance_id) REFERENCES products(id)
);

INSERT INTO balance (balance_product)
VALUES 
	(1), (2), (4), (25), (14), (1), (30), (89), (17), (34);

DROP TABLE IF EXISTS properties;
CREATE TABLE properties(
	properties_id SERIAL, 
	property_product  VARCHAR(500),
	FOREIGN KEY (properties_id) REFERENCES products(id)
);

INSERT INTO properties (property_product)
VALUES 	
	('������ Sphinx Diona 3 Silver (������ ����� 3 ����������) ������������ � ��������. ������ ������ ���������� �������� � ����������� ��������. ������ ������� ��������� 80 ��. '),
	('��������� � ��������� ������ Magix 2203 R Black (������� 2203 � ������) �������� ������� ������������. ��� ������ ���������� �� ������ ���������� ������������ � ��������� �����������, �� ����� �������� ��������. ����� ������ ������ ���������� ������ ���������.'),
	('������ AmyStar 640 PSMBK-BK ��������� �������� ��������������. ������ ������� ���������� 72 ��.  ������ ���������� ������ ������ � ������, ������� ����������� ����� ����� ��������� �����������. ������� ��������� � ����� hi-tech. '),
	('����� ��� ������� Dark Side Base Dark Ice Cream (���� ���� ���� ���������� ���������)- ��������� ������������� ����� ��������� ��������� �� ����������� ������������� D-Tobacco. ���� ������� ����� �������� ������� ���������, ��� �� ����� �� ������ ��������, �� � ������� ����� ���������� ���������. '),
	('������������ �������� ����� ��� ������� Adalya ACAI (������ ����� ����) �������� ������ ������������ ������ ����������. ��� ��������� ������� ��� ����������� ����������. �� ����� ������� ����� ����������� ����� ����� �������� ����. '),
	('������������ ����� Fumari ��� ����� ��� ���������� ������������� ������������� � �������������� ������ ��� ������������� ������ ��������. ����������� ���������� ��������� �������� �� ����������� ������������ �������� � ������������ ������ �����. ������ � ������ ��� �������� �� ���������� �������� �������� ��������, � �������� �������� �������� ���� ����� ����������� ��������.'),
	('��������� ����� Cocobrico Flat �� �������������� ������������� ����������� ��� �������� ����� �� ����� ������� �������. �� �������� ��� �������������� ���� ������ ��������� �������� ������ � �������� �������� ���������� ���������� ������. '),
	('��������� ����� Coconara. �������� ����� ������� �� �������� ������, �������� � ����� ������� - ��� ����! 24 ��������.'),
	('������������ ��������� ���� �� Coco Nara ������� ����������� ������� ��� �������. ��� ������������ �� ������������ ������� �����. � ������ �������� ��������� ������� ��������� ��������. ����� ��������� ����������, ��� ������������ ������� ������������ �������. ��������� ����� � �������� �� 72 �����.'),
	('���������� ����� ��� ������� Khalil Mamoon �� ������ - ������������ ������� �������� ��������. ��� �������� �������� � �������� ����� ������������� � � ��������� ������� ������ �����. ���������� ������� ���������� � ������������� ������. ������ ������������, ��������� ��������� � ���� ������������� ������������� �������. ');
	

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts(
	discount_id SERIAL, 
	discount_type  VARCHAR(50),
	discount_size   INT  DEFAULT 0
);

INSERT INTO discounts (discount_type, discount_size)
VALUES
	('Every 30th day of the month', 5),
	('The amount of the basket is more than 10000', 7);

DROP TABLE IF EXISTS makers;
CREATE TABLE makers(
	makers_id SERIAL, 
	maker_name  VARCHAR(100),
	maker_description VARCHAR(1000),
	maker_country   VARCHAR(100),
	FOREIGN KEY (makers_id) REFERENCES products(id)
);

INSERT INTO makers (maker_name, maker_description, maker_country) 
VALUES 
	('Sphinx',' �� ����� ���������� ��������� ������ ������ ����. ����� �� ����������� ����� ����� ����������� ���������� �������. ����� Drops Trans ��������� �� ������������� � ������������� ������. ����� ����������� ��� ��� ������ ������������. ', '��������'),
	('Magix', '������ ������� ���� ����� ����� ������,��������� � �������������. ���������� �� ������������������ ����������. ������ ��������������-������� ���������� ����� ������ � ������, ��� ���� ����������� ���������� ������, ��������� ���  ������ �� �����, �� ����� ������� �����. ������ �����, ��������������. ', '������'),
	('Amy', '������� ��������� � ����� hi-tech. ����������� ������� ��������� �� ��������� ����������� � �������������� ������ ������ ����������. ��� ��� �������� �������� ������� � ���������������� ��������������. ������� ����� � ������ ������ ���� ������� � �������. ����� ��������� �� ����������� ����� � ���������� ������� �������.', '��������'),
	('Dark Side', '������� � ������ ����� ��� ������� Dark side (���� ����) ����� ��������� � ����� ����. �� ��������� � ������ ������� � �������� �� ����� �������. � ����������� ����������� ����� ���� �������. ��� ����� ������� ������ �������� ��� ����������� ����������. �� �� ��������� � �������� ��������� ��������� � ���������. ��� ����� ������������� � ������� �������. ���������� ����������� ��������� ���������� ������� ��������.', '������'),
	('Adalya', '����� ��� ������� Adalya, ������������ � ��������� ������ ���������� �������� ������������� ��� ����� �������� � ���������, ��� � ����� ���������������� �����������. ������� ����� ��� ���� ������, ��� � ��������� ������ �������� �������� ����� ������������� �������. ��� ������� �������� ������ ��������� � ��������� � �������� ��������� � ��������������. ', '������'),
	('Fumari', '����� ��� ������� Fumari �������� �������� �� ������� � ����� �� ����� ����� �������������� ������ ������ ������������. ����� ������������� ������� ������, �� ������� ������ ������ ��������� ��� ���� ��������� ������. ����� ����� �������� �������� �� �������� ������, �� ����������� � ������� ������ ������� � ������������ ������, �� ���� ���� �������������� ������ �������������. ', '���'),
	('Cocobrico Flat', '��������� ����� Cocobrico Flat ������������� �� ��������� ����������� � ��� ���� �������, ������ ��� ������� ���� ��������������, ����� ������ ����� � �� ���� �����, �� ������� ������� �������, ��������� ���� �� ������ �� �������� �������� ��������� �����. ������� ������ ������� ���������� ���� �������� � ��, ��� �� ����� ���������� �� ���������� �����. ������ ������ 25*15', '���������'),
	('Coconara Flat', '��������� ����� Coconara. �������� ����� ������� �� �������� ������, �������� � ����� ������� - ��� ����! 24 ��������.', '���������'),
	('Koko HAPA', '������������ ��������� ���� �� Coco Nara ������� ����������� ������� ��� �������. ��� ������������ �� ������������ ������� �����. � ������ �������� ��������� ������� ��������� ��������. ����� ��������� ����������, ��� ������������ ������� ������������ �������. ��������� ����� � �������� �� 72 �����.', '���������'),
	('Khalil Mamoon', '����� ��� �������� ������ �� ��������� ����������. ��� ���� � ������� �� ��� ���� ���� ������������ � ����������. ������������� ����� ����� ������� �����, ����� �� �������� � ������ ������������� ���������� ����� ��������, �������� � ����������� ������ �������� ����� �������������� � ����������. ��, ����� ���� ��������� ���������, ���������� ��� �� ��������� ������ ���������� �����.', '������');

DROP TABLE IF EXISTS delivery;
CREATE TABLE delivery(
	delivery_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	delivery_type  VARCHAR(50),
	delivery_coast   INT UNSIGNED DEFAULT 1000);

INSERT INTO delivery (delivery_type, delivery_coast)
VALUES
	('�������� �� ������', 500),
	('�������� �� �����-����������', 700),
	('��������� (������ � �����-���������)', 200),
	('�������� ���������� �������(�������)', '1000');

DROP TABLE IF EXISTS delivery_service;
CREATE TABLE delivery_service(
	ds_id SERIAL, 
	ds_region  VARCHAR(50),
	ds_coast   INT UNSIGNED DEFAULT 1000,
	FOREIGN KEY (ds_id) REFERENCES delivery(delivery_id)
);	
	

INSERT INTO delivery_service (ds_region, ds_coast)
VALUES
	('���������� �������', 1500),
	('������������� �������', 700);

DROP TABLE IF EXISTS busket;
CREATE TABLE busket(
	busket_id SERIAL, 
	busket_balance  INT UNSIGNED DEFAULT 0,
	busket_delivery_coast INT UNSIGNED DEFAULT 1000,
	busket_total_coast INT UNSIGNED DEFAULT 1000,
	FOREIGN KEY (busket_id) REFERENCES booking(booking_id),
	FOREIGN KEY (busket_id) REFERENCES discounts(discount_id),
	FOREIGN KEY (busket_id) REFERENCES delivery(delivery_id)
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking(
	booking_id SERIAL, 
	booking_unit  VARCHAR(150),
	booking_product_type enum('hookah', 'mix', 'coal', 'accessories') NOT NULL,
	coast INT UNSIGNED NOT NULL,	
	booking_balance  INT UNSIGNED DEFAULT 0,
	FOREIGN KEY (booking_id) REFERENCES products(id)
);

SELECT maker, coast FROM products WHERE product_type = 'hookah';

SELECT 
	(SELECT maker FROM products  WHERE id= 1) AS product,
	maker_country,
	(SELECT coast FROM products WHERE id = 1) AS coast ,
	(SELECT balance_product FROM balance WHERE balance_id = 1 ) AS balance
FROM makers WHERE makers_id=1;	

SELECT maker, coast  FROM products p 
JOIN makers m ON p.id = m.makers_id 
WHERE m.makers_id = (SELECT id FROM products WHERE product_type = 'accessories');

SELECT * FROM busket b ;
START TRANSACTION;
UPDATE balance SET balance_product= balance_product - 1 WHERE balance_id = 2;
UPDATE busket SET busktet_balance= busktet_balance + 5000;
UPDATE busket SET busket_delivery = busket_delivery + 500;
UPDATE busket SET busket_total_coast = busktet_balance + busket_delivery;
COMMIT ;
ROLLBACK;
SELECT * FROM  busket ;

DROP PROCEDURE IF EXISTS sp_unit_makers;

DELIMITER //

CREATE PROCEDURE sp_unit_makers (IN unit_id BIGINT UNSIGNED)
BEGIN
	SELECT p.property_product AS property FROM properties p 
	WHERE p.properties_id = unit_id; 
END//

DELIMITER ;

CALL sp_unit_makers(1);






























