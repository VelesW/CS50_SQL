CREATE TABLE IF NOT EXISTS "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "check-ins" (
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE IF NOT EXISTS "flights" (
    "flight_no" INTEGER,
    "airline_id" INTEGER,
    "from_code" TEXT,
    "to_code" TEXT,
    "departure_date" NUMERIC NOT NULL,
    "arrival_date" NUMERIC NOT NULL,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id" )
);

CREATE TABLE IF NOT EXISTS "airlines" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "section" TEXT,
    PRIMARY KEY("id")
);
