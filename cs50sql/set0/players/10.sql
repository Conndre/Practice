/* In 10.sql, write SQL query to answer a question of your choice. This query should:
Make use of AS to rename a column
Involve at least condition, using WHERE
Sort by at least one column using ORDER BY */

SELECT ROUND(AVG("Birth_year"), 2) AS average_birth_year
FROM "players"
WHERE "Birth_year" <= '2024'
ORDER BY first_name, last_name;

