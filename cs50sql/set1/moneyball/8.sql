/* 8.sql- Find the 2001 salary of the player who hit the most home runs in 2001.
Return a table with one column, the salary of the player. */

SELECT "salaries"."salary" FROM "salaries"
JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
WHERE "performances"."HR" = (
    SELECT MAX("HR") from "performances"
    WHERE "year" = 2001
)
AND "salaries"."year" = 2001;
