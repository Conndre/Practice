--This view should contain, in order from greatest to least, the most populated districts in Nepal

/* test: Which district has the highest population? SELECT district, population FROM most_populated LIMIT 1;  Kathmandu
  And how many households are in that district? SELECT households FROM most_populated LIMIT 1; 275,806 households */

CREATE VIEW "most_populated" AS
SELECT
    "district",
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM "census"
GROUP BY "district"
ORDER BY "population" DESC;
