
/* Usage: to test your hack as you write it in your hack.sql files: .read hack.sql
To reset the database:  run .read reset.sql to return the database to its original form. */


--Alter the password of the website’s administrative account, admin, to instead be “oops!”.
--Generate a hash from oops! at "md5hashgenerator.com"
UPDATE "users"
SET "password" = "982c0381c279d139fd221fce974916e7"
WHERE "username" = "admin";


--Erase any logs of the above password change recorded by the database.
DELETE FROM "user_logs"
WHERE "new_username" = "admin" AND "old_username" = "admin";


/* Add false data to throw others off your trail.
In particular, to frame emily33, make it only appear—in the user_logs table
—as if the admin account has had its password changed to emily33’s password.*/
INSERT INTO "user_logs" ("type","old_username","new_username","new_password")
VALUES ("update","admin","admin",(
    SELECT "password"
    FROM "users"
    WHERE "username" = 'emily33')
);

