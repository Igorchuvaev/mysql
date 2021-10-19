USE vk;

INSERT users (firstname, lastname, phone, email, password_hash)
SELECT name, surname, phone,email, pass  FROM test1.users;

INSERT users
SET firstname = '���������',
    lastname = '��������',
    email = 'valua443@mail.com',
    phone = '89677557770';
   
INSERT INTO users (firstname, lastname, email, phone)
VALUES 
	('�������', '�������', 'AAAA444@mail.com', '86543544312'),
	('���������', '�������', 'VLADTU43@mail.com', '89433544312'),
	('���', '�������', 'KruYa@mail.com', '89215432112'),
	('�����', '�������', 'marchu15@mail.com', '81613544312'),
	('�������', '������', 'VAMIK13@mail.com', '89213134312'),
	('���������', '�������', 'DosAL555@mail.com', '89555544312');

INSERT INTO users (firstname, lastname, email, phone, created_at)
VALUES ( '����', '������', '221b@bs.com','13233544312',DEFAULT );

INSERT users
SET firstname = '�����',
    lastname = '�������',
    email = 'irinsha@mail.com',
    phone = '89217890560';
   

SELECT lastname FROM users ORDER BY lastname;   
SELECT firstname FROM users ORDER BY firstname;   

ALTER TABLE profiles ADD COLUMN is_active BOOL DEFAULT 1;

INSERT profiles (user_id, gender, birthday, photo_id, city, country)
VALUES 
	(15 ,'m', '1975-09-01', 15 , '������', '������'),
	(12 ,'f', '1986-08-04', 12 , '������', '������'),	
	(13 ,'m', '1995-08-04', 13 , '������', '������'),
	(14 ,'f', '1985-01-01', 14 , '������', '������'),
	(16 ,'m', '1985-11-11', 16 , '������', '������'),
	(17 ,'m', '1999-08-04', 17 , '������', '������'),
	(18 ,'f', '1996-12-04', 18 , '������', '������'),
	(19 ,'m', '1990-12-12', 19 , '������', '������');

INSERT profiles (user_id, gender, birthday, photo_id, city, country)
VALUES 
	(21 ,'m', '2015-09-01', 21 , '������', '������');


UPDATE profiles 
SET is_active=1;

UPDATE profiles 
SET is_active=0
WHERE (YEAR(CURRENT_TIMESTAMP) - YEAR(birthday)) < 18;
-- �������, ��� ����� ���� �������� ����� ������ ��������

-- ������ ����� �������������� ������� � ��������� �����

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








