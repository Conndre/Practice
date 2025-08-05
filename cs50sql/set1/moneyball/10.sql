/* 10.sql- Return a table with five columns, per the above. Order the results, first and foremost, by player’s IDs (least to greatest).
Order rows about the same player by year, in descending order.
Consider a corner case: suppose a player has multiple salaries or performances for a given year.
Order them first by number of home runs, in descending order, followed by salary, in descending order.
Be careful to ensure that, for a single row, the salary’s year and the performance’s year match. */

SELECT "first_name","last_name","salary","HR", "performances"."year"  AS "year" FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "players"."id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
ORDER BY "players"."id" ASC,"salaries"."year" DESC,"performances"."HR" DESC,"salaries"."salary"DESC;
