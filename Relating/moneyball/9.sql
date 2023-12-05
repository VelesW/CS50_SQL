SELECT "teams"."name", ROUND(AVG("salaries"."salary")) AS "average salary"
FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "average salary"
LIMIT 5;
