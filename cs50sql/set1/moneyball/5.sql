/* 5.sql- Find all teams that Satchel Paige played for.
Return a table with a single column, one for the name of the teams. */

SELECT "teams"."name" FROM "performances"
JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE "player_id" = (
    SELECT "id" FROM "players" WHERE "first_name" = "Satchel"
    AND "last_name" = "Paige"
);

