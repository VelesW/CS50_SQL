SELECT "first_name", "last_name"
FROM "players"
WHERE "id" IN (
    SELECT
        "p"."id"
    FROM
        "players" AS "p"
        JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
        JOIN "performances" AS "per"ON "p"."id" = "per"."player_id"
            AND "s"."year" = "per"."year"
    WHERE
        "per"."year" = 2001
        AND "per"."H" > 0
    ORDER BY
        "s"."salary" / "per"."H"
    LIMIT 10
)
AND "id" IN (
    SELECT
        "p"."id"
    FROM
        "players" AS "p"
        JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
        JOIN "performances" AS "per"ON "p"."id" = "per"."player_id"
            AND "s"."year" = "per"."year"
    WHERE
        "per"."year" = 2001
        AND "per"."RBI" > 0
    ORDER BY
        "s"."salary" / "per"."RBI"
    LIMIT 10
)
ORDER BY "id";
