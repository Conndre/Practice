
/* Import and clean the data from a file csv and store into a table in a database
Before you import a CSV, define the schema for the table into which that data will be imported.
Test: Select name, year from meteorites where year = 1998 and name like 'Yam%'  limit 10; */

CREATE TABLE "meteorites_temp"(
  "name" TEXT,
  "id" INTEGER,
  "nametype" TEXT,
  "class" TEXT,
  "mass" REAL,
  "discovery" TEXT,
  "year" INTEGER,
  "lat" REAL,
  "long" REAL,
  primary key("id"));

.import --csv --skip 1 meteorites.csv meteorites_temp

-- Replacing Empty values with "NULL"
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = "";
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = "";
UPDATE "meteorites_temp" SET "lat" =  NULL WHERE "lat" = "";
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = "";

--Round off to 2 decimal points all columns with decimal values
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2);
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2);

--Exclude nametype = relict from table
DELETE FROM "meteorites_temp" WHERE "nametype" = "Relict";

--Exclude nametype from table
ALTER TABLE "meteorites_temp" DROP COLUMN "nametype";

--Create the meteorite table and sort by year and name
CREATE TABLE "meteorites"(
  "id" INTEGER,
  "name" TEXT,
  "class" TEXT,
  "mass" REAL,
  "discovery" TEXT,
  "year" INTEGER,
  "lat" REAL,
  "long" REAL,
  primary key("id"));

INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
SELECT "name","class","mass","discovery","year","lat","long"
FROM "meteorites_temp"
ORDER BY "year","name";

--Once you’re done with the temporary table, it’s good practice to drop it!
DROP TABLE "meteorites_temp";


