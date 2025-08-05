
-- A view named "no_descriptions" that includes all columns of "listings" except "description".
/* Test: How many listings are there in total?
SELECT COUNT(*) FROM no_descriptions; -- 3,973 listings */

CREATE VIEW "no_descriptions" AS
SELECT
	"id",
	"property_type",
	"host_name",
	"accommodates",
	"bedrooms"
FROM
	"listings";



