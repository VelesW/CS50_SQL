SELECT
    "p"."first_name",
    "p"."last_name",
    "s"."salary",
    "s"."year",
    "per"."HR"
FROM "players" AS "p"
JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
JOIN "performances" AS "per"ON "p"."id" = "per"."player_id"
    AND "s"."year" = "per"."year"
ORDER BY
    "p"."id" ASC,
    "s"."year" DESC,
    "per"."HR" DESC,
    "s"."salary" DESC;
