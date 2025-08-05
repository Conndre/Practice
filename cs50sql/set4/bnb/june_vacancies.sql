--This view should contain all listings and  nª of days that they remained vacant, in June of 2023
/* Test: How many listings were available in June 2023?
SELECT COUNT(*) FROM june_vacancies; --- find that there were 1,895 vacancies. */


CREATE VIEW
	"june_vacancies" AS
SELECT
	"l"."id",
	"l"."property_type",
	"l"."host_name",
	COUNT("a"."date") AS "days_vacant"
FROM
	"listings" AS "l"
	LEFT JOIN "availabilities" AS "a" ON "l"."id" = "a"."listing_id"
WHERE
	"a"."available" = 'TRUE'
	AND "a"."date" >= '2023-06-01'
	AND "a"."date" < '2023-07-01'
GROUP BY
	"l"."id",
	"l"."property_type",
	"l"."host_name";

