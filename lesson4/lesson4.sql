USE vk;

INSERT users (firstname, lastname, phone, email, password_hash)
SELECT name, surname, phone,email, pass  FROM test1.users;

INSERT users
SET firstname = 'Валентина',
    lastname = 'Сидорова',
    email = 'valua443@mail.com',
    phone = '89677557770';
   
INSERT INTO users (firstname, lastname, email, phone)
VALUES 
	('Алексей', 'Андреев', 'AAAA444@mail.com', '86543544312'),
	('Владислав', 'Тульков', 'VLADTU43@mail.com', '89433544312'),
	('Яна', 'Крутова', 'KruYa@mail.com', '89215432112'),
	('Мария', 'Чуйкова', 'marchu15@mail.com', '81613544312'),
	('Валерия', 'Микова', 'VAMIK13@mail.com', '89213134312'),
	('Александр', 'Досиков', 'DosAL555@mail.com', '89555544312');

INSERT INTO users (firstname, lastname, email, phone, created_at)
VALUES ( 'Джон', 'Ватсон', '221b@bs.com','13233544312',DEFAULT );

INSERT users
SET firstname = 'Ирина',
    lastname = 'Тушаина',
    email = 'irinsha@mail.com',
    phone = '89217890560';
   

SELECT lastname FROM users ORDER BY lastname;   
SELECT firstname FROM users ORDER BY firstname;   

ALTER TABLE profiles ADD COLUMN is_active BOOL DEFAULT 1;

INSERT profiles (user_id, gender, birthday, photo_id, city, country)
VALUES 
	(15 ,'m', '1975-09-01', 15 , 'Москва', 'Россия'),
	(12 ,'f', '1986-08-04', 12 , 'Москва', 'Россия'),	
	(13 ,'m', '1995-08-04', 13 , 'Москва', 'Россия'),
	(14 ,'f', '1985-01-01', 14 , 'Москва', 'Россия'),
	(16 ,'m', '1985-11-11', 16 , 'Москва', 'Россия'),
	(17 ,'m', '1999-08-04', 17 , 'Москва', 'Россия'),
	(18 ,'f', '1996-12-04', 18 , 'Москва', 'Россия'),
	(19 ,'m', '1990-12-12', 19 , 'Москва', 'Россия');

INSERT profiles (user_id, gender, birthday, photo_id, city, country)
VALUES 
	(21 ,'m', '2015-09-01', 21 , 'Москва', 'Россия');


UPDATE profiles 
SET is_active=1;

UPDATE profiles 
SET is_active=0
WHERE (YEAR(CURRENT_TIMESTAMP) - YEAR(birthday)) < 18;
-- Понимаю, что здесь надо добавить более точное значение

-- Сделаю через дополнительную колонку с возрастом юзера

ALTER TABLE profiles ADD COLUMN age_user BIGINT (3);
UPDATE profiles
SET age_user=YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5));
-- UPDATE profiles 
-- SET is_active=0
-- WHERE age_user < 18;


ALTER TABLE messages ADD COLUMN dilivered_at DATETIME;
INSERT messages (id, from_user_id, to_user_id, body,dilivered_at  )
VALUES 
	(11 ,4, 5, 'hi there', '2022-11-10');

DELETE FROM messages 
WHERE dilivered_at > now();








