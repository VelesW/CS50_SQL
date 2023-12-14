-- .timer on -- turn the timer on in order to test time of typical queries

-- Test queries before creating an indexes
-- EXPLAIN QUERY PLAN
-- SELECT "courses"."title", "courses"."semester"
-- FROM "enrollments"
-- JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
-- JOIN "students" ON "enrollments"."student_id" = "students"."id"
-- WHERE "students"."id" = 3;

DROP INDEX IF EXISTS "course_id_index";
DROP INDEX IF EXISTS "course_index";
DROP INDeX IF EXISTS "student_index";
DROP INDEX IF EXISTS "requirement_index";
DROP INDEX IF EXISTS "satisfy_index";

-- VACUUM;
CREATE INDEX "course_id_index" ON "enrollments" ("course_id");
CREATE INDEX "course_index" ON "courses" ("id", "department", "number", "semester");
CREATE INDEX "student_index" ON "students" ("id");
CREATE INDEX "requirement_index" ON "requirements" ("id");
CREATE INDEX "satisfy_index" ON "satisfies" ("course_id", "requirement_id");

-- Test queries after creating an indexes
-- EXPLAIN QUERY PLAN
-- SELECT "courses"."title", "courses"."semester"
-- FROM "enrollments"
-- JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
-- JOIN "students" ON "enrollments"."student_id" = "students"."id"
-- WHERE "students"."id" = 3;
