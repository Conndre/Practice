/* This view should contain all census records relating to a rural municipality (including “rural” in their name).
Ensure the view contains all of the columns from the census table.
Test:  How many rural districts are there? SELECT COUNT(*) FROM rural; ---461
 How many families live in rural districts? SELECT SUM(families) FROM rural; --- 2229834  */

CREATE VIEW "rural" AS
SELECT * FROM "census"
WHERE locality LIKE '%rural%';

