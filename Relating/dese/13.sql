SELECT "name", "city"
FROM "schools"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
WHERE "type" IS "Charter School"
GROUP BY "schools"."district_id";
