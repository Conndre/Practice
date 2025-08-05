/* 4-The app needs to send users a summary of their engagement.
Find the username of the most popular user, defined as the user who has had the most messages sent to them.*/
SELECT username FROM users
JOIN messages WHERE users.id = to_user_id
GROUP BY to_user_id
ORDER BY COUNT(to_user_id) DESC, username
LIMIT 1;

