--This view should contain the 100 most frequently reviewed listings, sorted DESC
/* Test: •	How many reviews does the most frequently reviewed property have? And who is the host of that property?
 SELECT reviews, host_name FROM frequently_reviewed LIMIT 1;--find that Tiffany’s property has 860 reviews */


CREATE VIEW
	"frequently_reviewed" AS
SELECT
	"l"."id",
	"l"."property_type",
	"l"."host_name",
	COUNT("r"."id") AS "reviews"
FROM
	"listings" AS "l"
	INNER JOIN "reviews" AS "r" ON "l"."id" = "r"."listing_id"
GROUP BY
	"l"."id",
	"l"."property_type",
	"l"."host_name"
ORDER BY
	COUNT("r"."id") DESC,
	"l"."property_type" ASC,
	"l"."host_name" ASC
LIMIT
	100;


