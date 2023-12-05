SELECT ROUND(AVG("height"), 3) AS "average_height", "first_name", "last_name", "height"
FROM "players"
WHERE "birth_year" >= 2000
ORDER BY "height", "last_name";

