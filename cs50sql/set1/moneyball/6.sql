/* 6.sql- Which teams might be the biggest competition for the A’s this year?
Return the top 5 teams, sorted by the total number of hits by players in 2001.
Call the column representing total hits by players in 2001 “total hits”. Sort by total hits, highest to lowest.
Return two columns, one for the teams’ names and one for their total hits in 2001. */

SELECT "teams"."name", SUM("H") AS "total hits" FROM "performances"
JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "total hits" DESC LIMIT 5;

