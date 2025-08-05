/* This view should contain the sums for each numeric column in census,
 across all districts and localities.
 Test. How many households are there in Nepal?
SELECT households FROM total;--- 5,642,674 households.*/

CREATE VIEW "total" AS
SELECT
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM "census";
