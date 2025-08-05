
-- *** The Lost Letter ***

--Get ID address from sender(432)
SELECT* FROM "addresses"
WHERE "address" = "900 Somerville Avenue";

--GET ID address from recipient (854)
SELECT* FROM "addresses"
WHERE "address" = "2 Finnigan Street";

SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM packages
        WHERE (from_address_id = (SELECT "id" FROM "addresses" WHERE "address" = "900 Somerville Avenue"))
        AND (to_address_id = (SELECT "id" FROM "addresses" WHERE "address" = "2 Finnigan Street"))
);

--Check addresses  and what type of address they are.
select * from packages where id = 384;

select * from addresses where id = 854;



-- *** The Devious Delivery ***

--What were the contents of the Devious Delivery?: Duck debugger
SELECT* FROM "packages"
WHERE "from_address_id" IS NULL;

--Get package_id (5098)
SELECT id FROM "packages"
WHERE "from_address_id" IS NULL;

--Get id for action Drop
SELECT* FROM "scans"
WHERE "package_id" = '5098';

--At what type of address did the Devious Delivery end up? Police Station
SELECT* FROM "addresses"
WHERE "id" = '348';



-- *** The Forgotten Gift ***
--Check addresses  and what type of address they are.
SELECT* from "addresses"
WHERE "address" IN ('728 Maple Place', '109 Tileston Street');

--What are the contents of the Forgotten Gift?: Flowers
SELECT* from "packages"
WHERE "from_address_id" = '9873'
AND "to_address_id" = '4983';

--Check data  for driver_id
SELECT* FROM "scans"
WHERE "package_id" = '9523';

--Who has the Forgotten Gift?: Mikel
SELECT* FROM "drivers"
WHERE "id" = '17';





