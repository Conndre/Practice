--This view should contain all listings that have exactly one bedroom

/* Test: How many one-bedroom listings are there? And how many can accommodate at least 4 guests?
 SELECT COUNT(*) FROM one_bedrooms;   1,228 one-bedroom
 SELECT COUNT(*) FROM one_bedrooms WHERE accommodates >= 4;    222 bedrooms */

CREATE VIEW	"one_bedrooms" AS
SELECT
	"id",
	"property_type",
	"host_name",
	"accommodates"
FROM
	"listings"
WHERE
	"bedrooms" = 1;
