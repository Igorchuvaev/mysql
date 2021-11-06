USE vk;

-- 1



SELECT 	
	COUNT(*) AS total,
	u.lastname FROM users u
JOIN messages m ON u.id = m.from_user_id 
WHERE u.id=1
ORDER BY total
LIMIT 1;


-- 3
SELECT 
	COUNT(*) AS total, 
	profiles.gender 
FROM likes
JOIN profiles ON likes.user_id = profiles.user_id
WHERE gender IN ('m', 'f')
GROUP BY profiles.gender
ORDER BY total DESC
LIMIT 1;

-- 2

ALTER TABLE profiles ADD COLUMN age BIGINT (3);
UPDATE profiles
SET age=TIMESTAMPDIFF(YEAR, birthday, NOW());

SELECT 
	COUNT(*) AS total,
	user_id ,
	age
FROM profiles p
LEFT JOIN  likes l ON l.user_id = p.user_id
WHERE p.age < 10
ORDER BY total DESC;







