SELECT "teams"."name", SUM("performances"."H") AS "Hits"
FROM "teams"
JOIN "performances" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "Hits" DESC
LIMIT 5;
