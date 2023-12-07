-- Alter the password of the website’s administrative account.
UPDATE "users"
    SET "password" = "982c0381c279d139fd221fce974916e7"
    WHERE "username" IS "admin";

-- Erase any logs of the above password change recorded by the database.
DELETE FROM "user_logs"
    WHERE "type" = "update"
    AND "new_username" = "admin";

-- Add false data to throw the company off of your trail.
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
    VALUES (
        "update",
        "admin",
        "admin",
        (SELECT "password" FROM "users"
        WHERE "username" = "admin"),
        (SELECT "password" FROM "users"
        WHERE "username" = "emily33")
    );

