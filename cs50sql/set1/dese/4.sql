/* 4.sql-- Find the 10 cities with the most public schools.
Return the names of the cities and the number of public schools ordered DESC.
If two cities have the same number of public schools, order them alphabetically. */

SELECT COUNT(*) AS "num_public_school", "city"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "num_public_school" DESC, "city" ASC LIMIT 10;
