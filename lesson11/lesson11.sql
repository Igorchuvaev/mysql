

USE shop;

DROP TABLE IF EXISTS logs;

CREATE TABLE logs(
	table_id SERIAL,
	table_name VARCHAR (100),
	name VARCHAR (100),
	created_at DATETIME DEFAULT CURRENT-TIMESTAMP
) ENGINE=Archive;

DELIMITER //	
CREATE TRIGGER log_insert_unit AFTER INSERT ON users
	FOR EACH ROW BEGIN 
	INSERT INTO logs (table_name, table_id, name) VALUES ('products', NEW.id, NEW.name)			
	END//
	
-- По всей видимости, необходимо создать ещё два таких триггера