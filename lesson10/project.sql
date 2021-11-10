/*

1. Товар (кальян, кальянные смеси, уголь, аксессуары)
	Артикул
	Производитель
	Тип товара
	Стоимость
	
2. Товарный остаток
	Артикул товара
	Остаток
	
3. Характеристики товара	
	Артикул товара
	Остаток	

6. Скидки
	ID скидки
	Тип скидки
	Сумма скидки
	
7. Производители
	ID Производителя
	Наименование производителя
	Страна производителя
	
8. Доставка
	ID доставки
	Стоимость доставки
	
9. Курьерские службы
	ID доставки
	Регион доставки	
	Курьерские службы

	
10. Корзина (пока только на одно наименование)
	Артикул товара
	Количество данного товара
	Стоимость доставки
	К оплате
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
	('Кальян Sphinx Diona 3 Silver (Сфинкс Диона 3 Серебряный) производится в Германии. Данная модель отличается стильным и продуманным дизайном. Высота кальяна равняется 80 см. '),
	('Роскошный и недорогой кальян Magix 2203 R Black (Мэджикс 2203 Р Черный) порадует каждого пользователя. Эта модель выделяется не только улучшенным функционалом и удобством пользования, но также стильным дизайном. Такой кальян станет украшением любого интерьера.'),
	('Кальян AmyStar 640 PSMBK-BK создается немецким производителем. Высота кальяна составляет 72 см.  Модель выделяется черной шахтой и колбой, которые соединяются между собой резьбовым соединением. Изделие выполнено в стиле hi-tech. '),
	('Табак для кальяна Dark Side Base Dark Ice Cream (Дарк Сайд Бейс Шоколадное мороженое)- ароматный представитель линии кальянной продукции от российского производителя D-Tobacco. Этот вареный табак обладает средней крепостью, что по вкусу не только новичкам, но и опытным профи кальянного искусства. '),
	('Качественный турецкий табак для кальяна Adalya ACAI (Адалия Ягоды асаи) порадует любого пользователя своими свойствами. Это идеальный вариант для регулярного применения. Во время курения будет создаваться очень много плотного дыма. '),
	('Американский бренд Fumari уже много лет занимается производством качественного и разнообразного табака для приготовления лучших кальянов. Поклонникам насыщенных фруктовых ароматов мы рекомендуем экзотическую заправку с ненавязчивым вкусом гуавы. Густой и мягкий дым напомнит об освежающей прохладе вечерних тропиков, а отменное качество порадует даже самых пресыщенных гурманов.'),
	('Кокосовый уголь Cocobrico Flat от индонезийского производителя гарантирует Вам приятный отдых во время курения кальяна. Он позволит Вам прочувствовать весь аромат фруктовых табачных смесей и получить огромное количество позитивных эмоций. '),
	('Кокосовый уголь Coconara. Отличный уголь который не содержит запаха, примесей и самое главное - без дыма! 24 таблетки.'),
	('Качественные кокосовые угли от Coco Nara создают необходимые условия для курения. Они производятся из экологически чистого сырья. В основе продукта находятся стружки кокосовой скорлупы. Сырье тщательно прессуется, что обеспечивает высокую длительность курения. Продается табак в упаковке по 72 штуки.'),
	('Египетская колба для кальяна Khalil Mamoon из стекла - оригинальное изделие высокого качества. Они идеально подходят к кальянам этого производителя и к некоторым моделям других марок. Отличаются хорошей прочностью и длительностью службы. Дизайн классический, основание расписное в виде декоративного оригинального рисунка. ');
	

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
	('Sphinx',' Во время применения создается только легкая тяга. Шахта из нержавеющей стали имеет увеличенный внутренний диаметр. Колба Drops Trans выполнена из термостойкого и ударопрочного стекла. Имеет увеличенное дно для лучшей устойчивости. ', 'Германия'),
	('Magix', 'Кальян МЕДЖИКС КЛИК имеет яркий дизайн,практичен в использовании. Изготовлен из высококачественных материалов. Кальян используетКлик-систему соединение между колбой и шахтой, что дает возможность переносить кальян, удерживая его  только за шахту, не боясь разбить колбы. Модель яркая, запоминающаяся. ', 'Англия'),
	('Amy', 'Изделие выполнено в стиле hi-tech. Курительный аппарат создается по последним технологиям с использованием только лучших материалов. Все это повышает качество курения и эксплуатационные характеристики. Широкие порты и трубки делают тягу простой и удобной. Шахта создается из нержавеющей стали и выделяется толстой стенкой.', 'Германия'),
	('Dark Side', 'Крепкий и дымный табак для кальяна Dark side (Дарк Сайд) имеет необычный и яркий вкус. Он ощущается с первой затяжки и держится до конца курения. В послевкусии открываются новые ноты аромата. Все вкусы данного табака подойдут для ежедневного применения. Он не приторный и обладает умеренной сладостью и свежестью. Его можно комбинировать с другими вкусами. Освежающее гармоничное сочетание понравится каждому ценителю.', 'Россия'),
	('Adalya', 'Табак для кальяна Adalya, производимый в солнечной Турции пользуется огромной популярностью как среди новичков и любителей, так и среди профессиональных кальянщиков. Большой выбор как соло вкусов, так и различных миксов способен поразить своим разнообразием каждого. Вся линейки обладает низкой крепостью в сочетании с отличной дымностью и жаростойкостью. ', 'Турция'),
	('Fumari', 'Табак для кальяна Fumari является выходцем из Америки и одним из самых ярких представителей данной страны производства. Имеет разнообразную палитру вкусов, из которых каждый сможет подобрать для себя идеальный аромат. Стоит также обратить внимание на упаковку табака, он реализуется в удобных черных пакетах с многоразовым замком, за счет чего обеспечивается полная герметичность. ', 'США'),
	('Cocobrico Flat', 'Кокосовый уголь Cocobrico Flat разогревается до требуемой температуры в три раза быстрее, нежели его аналоги иных производителей, горит весьма долго – до двух часов, не выделят никаких запахов, благодаря чему не влияет на вкусовые качества кальянной смеси. Большим плюсом данного кокосового угля является и то, что во время разжигания не выделяются искры. Размер кубика 25*15', 'Индонезия'),
	('Coconara Flat', 'Кокосовый уголь Coconara. Отличный уголь который не содержит запаха, примесей и самое главное - без дыма! 24 таблетки.', 'Индонезия'),
	('Koko HAPA', 'Качественные кокосовые угли от Coco Nara создают необходимые условия для курения. Они производятся из экологически чистого сырья. В основе продукта находятся стружки кокосовой скорлупы. Сырье тщательно прессуется, что обеспечивает высокую длительность курения. Продается табак в упаковке по 72 штуки.', 'Индонезия'),
	('Khalil Mamoon', 'Колбы для кальянов делают из различных материалов. При этом у каждого из них есть свои преимущества и недостатки. Металлические колбы лучше отводят тепло, колбы из силикона и других искусственных материалов стоят недорого, глиняные и хрустальные внешне выглядят очень привлекательно и аутентично. Но, среди всех возможных вариантов, идеальными все же считаются именно стеклянные колбы.', 'Египет');

DROP TABLE IF EXISTS delivery;
CREATE TABLE delivery(
	delivery_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	delivery_type  VARCHAR(50),
	delivery_coast   INT UNSIGNED DEFAULT 1000);

INSERT INTO delivery (delivery_type, delivery_coast)
VALUES
	('Доставка по Москве', 500),
	('Доставка по Санкт-Петербургу', 700),
	('Самовывоз (Москва и Санкт-Петербург)', 200),
	('Доставка курьерской службой(регионы)', '1000');

DROP TABLE IF EXISTS delivery_service;
CREATE TABLE delivery_service(
	ds_id SERIAL, 
	ds_region  VARCHAR(50),
	ds_coast   INT UNSIGNED DEFAULT 1000,
	FOREIGN KEY (ds_id) REFERENCES delivery(delivery_id)
);	
	

INSERT INTO delivery_service (ds_region, ds_coast)
VALUES
	('Московская область', 1500),
	('Ленингдраская область', 700);

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






























