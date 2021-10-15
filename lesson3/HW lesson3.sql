USE vk;
DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	like_id SERIAL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (from_user_id) REFERENCES users (id), 
	FOREIGN KEY (to_user_id) REFERENCES users (id) 
);


DROP TABLE IF EXISTS photo_album;
CREATE TABLE photo_album (
	album_id SERIAL,
	name VARCHAR (100),	
	description VARCHAR (200),
	user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (album_id) REFERENCES images (id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	INDEX (name)
);

DROP TABLE IF EXISTS images;
CREATE TABLE images(
	img_id SERIAL,
	img_name VARCHAR(255),
	img_size BIGINT UNSIGNED,
	description VARCHAR (200),
	created_at DATETIME NOT NULL DEFAULT NOW(),
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (id)
);