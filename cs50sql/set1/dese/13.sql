/* 13.sql- A query to answer a question you have about the data! The query should:
Involve at least one JOIN or subquery */

SELECT "name", AVG("graduated")
FROM "schools"
         JOIN "graduation_rates" ON schools.id = graduation_rates.school_id
GROUP BY schools.district_id LIMIT 10;
