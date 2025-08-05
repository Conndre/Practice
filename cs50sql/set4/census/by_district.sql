
/*This view should contain the sums for each numeric column in census, grouped by district
Test: Which district has the second lowest number of families? And how many does it have?
SELECT district, families FROM by_district ORDER BY families LIMIT 1 OFFSET 1; Mustang, with 3,751 families.*/

CREATE VIEW "by_district" AS
SELECT
    "district",
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM "census"
GROUP BY "district";
