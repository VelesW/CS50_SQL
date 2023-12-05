SELECT "p"."first_name", "p"."last_name"
FROM "players" AS "p"
JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
ORDER BY "s"."salary" DESC,
    "p"."first_name" ASC,
    "p"."last_name" ASC,
    "p"."id" ASC
LIMIT 1;
