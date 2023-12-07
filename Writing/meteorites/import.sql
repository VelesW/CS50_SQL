-- create temporary table
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" REAL,
    "lat" REAL,
    "long" REAL
);

-- import csv table
.import --csv meteorites.csv "meteorites_temp"

-- update temporary table
UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "long" = ROUND("long", 2);

UPDATE "meteorites_temp"
SET "lat" = ROUND("lat", 2);

UPDATE "meteorites_temp"
SET "year" = ROUND("year", 2);

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2);

DELETE FROM "meteorites_temp"
WHERE "nametype" = "Relict";

-- create meteorites table

CREATE TABLE IF NOT EXISTS "meteorites"(
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" REAL,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

-- insert into meeteorites table
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp"
ORDER BY "year", "name";

-- delete meteorites_temp table
DROP TABLE IF EXISTS "meteorites_temp";
