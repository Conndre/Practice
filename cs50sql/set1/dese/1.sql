/* In 1.sql-- Find the names and cities of all public schools in Massachusetts.
Keep in mind that not all schools in the schools table are considered traditional public schools.
Massachusetts also recognizes charter schools */

SELECT name, city FROM "schools"
WHERE "state" = "MA" AND "type" = "Public School";
