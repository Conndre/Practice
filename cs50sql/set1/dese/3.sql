
/* 3.sql- Find the average per-pupil expenditure. Name the column “Average District Per-Pupil Expenditure”.
Note the per_pupil_expenditure column contains the average amount,per pupil, each district spent last year.
Find the average of this set of averages, weighting all districts equally regardless of their size. */

 SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
FROM "expenditures";

