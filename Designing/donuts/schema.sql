CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" SERIAL,
    "name" TEXT NOT NULL,
    "price_per_unit" DECIMAL(5, 2),
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "donuts" (
    "id" SERIAL,
    "name" TEXT NOT NULL,
    "gluten_free" BOOLEAN,
    "price" DECIMAL(5, 2),
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "orders" (
    "id" INTEGER,
    "donuts_id" INTEGER,
    "customer_id" INTEGER,
    FOREIGN KEY ("donuts_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE IF NOT EXISTS "customers" (
    "id" SERIAL,
    "first_name" TEXT,
    "last_name" TEXT,
    "history_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("history_id") REFERENCES "customer_history"("id")
);

CREATE TABLE IF NOT EXISTS "customer_history" (
    "id" INTEGER,
    "order_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")
);
