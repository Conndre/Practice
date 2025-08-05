/* 5.sql - Find cities with 3 or fewer public schools.
Return the names of the cities and the number of public schools within them, ordered DESC.
If two cities have the same number of public schools, order them alphabetically. */

SELECT "city", COUNT("name") FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT(name) <= 3
ORDER BY COUNT(name) DESC, city;
