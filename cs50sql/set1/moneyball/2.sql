/* 2.sql -Find Cal Ripken Jr.’s salary history. Sort by year in descending order.
Return a table with two columns, one for year and one for salary. */


SELECT "year", "salary" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
WHERE "first_name" = 'Cal' and "last_name" = 'Ripken'
ORDER BY "year" DESC;

