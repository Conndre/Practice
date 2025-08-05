
CREATE INDEX "student_index" ON "students" ("student_id", "course_id");
CREATE INDEX "student_name" ON "students" ("name");
CREATE INDEX "courses_name" ON "students" ("department","semester","title");
CREATE INDEX "courses_index" ON "students" ("id");
CREATE INDEX "course_2023" ON "courses" ("id","department","semester","title")
WHERE "semester" = 2023;
CREATE INDEX "course_select" ON "courses" ("deparment","number","semester","title");

/* write a set of SQL statements that create indexes which will speed up typical queries on the harvard.db database.
Be sure to balance speed with disk space, only creating indexes you need. */
CREATE INDEX courses_dep ON courses(department);
CREATE INDEX courses_title ON courses(title);
CREATE INDEX courses_dep_num_sem ON courses(department, number, semester);
CREATE INDEX enr_stud_course ON enrollments(student_id, course_id);
CREATE INDEX enr_course ON enrollments(course_id);
CREATE INDEX satisfies_course ON satisfies(course_id);
CREATE INDEX satisfies_req ON satisfies(requirement_id);
