USE vk;

-- 1
SELECT COUNT(*) AS cnt, user_friend_id FROM  
(SELECT body, from_user_id AS user_friend_id FROM messages WHERE to_user_id = 1) AS communication
GROUP BY user_friend_id
ORDER BY cnt DESC 
LIMIT 1;

-- 2

SELECT COUNT(*) AS likes FROM profiles WHERE (YEAR(NOW())-YEAR(birthday)) < 10;


-- 3

SELECT COUNT(*) AS likes, gender FROM likes, profiles
WHERE likes.user_id = profiles.user_id
GROUP BY gender  
LIMIT 1;