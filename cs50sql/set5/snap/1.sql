/*1- The app’s user engagement team needs to identify active users.
Find all usernames of users who have logged in since 2024-01-01.*/
SELECT "username" FROM "users"
WHERE "last_login_date" > '2024-01-01';
