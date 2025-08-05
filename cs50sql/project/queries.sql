-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--Count the Number of Appointments per Doctor
SELECT "d"."name" AS "doctor_name", COUNT("a"."appointment_id") AS "appointment_count"
FROM "doctors" AS "d"
LEFT JOIN "appointments "a ON "d"."doctor_id" = "a"."doctor_id"
GROUP BY "d"."name";

--View Appointments for a Specific Doctor
SELECT "p"."name" AS "patient_name", "a"."appointment_time", "c"."name" AS "clinic_name"
FROM "appointments" AS "a"
JOIN "patients" AS "p" ON "a"."patient_id" = "p"."patient_id"
JOIN "clinics" AS "c" ON "a"."clinic_id" = "c"."clinic_id"
WHERE "a"."doctor_id" = 1;

--List Doctors by Specialty Department
SELECT "d"."name", "d"."specialty", "c"."name" AS "clinic_name"
FROM "doctors" AS "d"
JOIN "departments" AS "dept" ON "d"."department_id" = "dept.department_id"
JOIN "clinics" AS "c" ON "d"."clinic_id" = "c"."clinic_id"
WHERE "dept"."name" = 'Cardiology';

--Find Appointments by Clinic: This query shows all appointments scheduled at a specific clinic.
SELECT "p"."name" AS "patient_name", "a"."appointment_time", "d"."name" AS "doctor_name"
FROM "appointments" AS "a"
JOIN "patients" AS "p" ON "a"."patient_id" = "p"."patient_id"
JOIN "doctors" AS "d" ON "a"."doctor_id" = "d"."doctor_id"
JOIN "clinics" AS "c" ON "a"."clinic_id" = "c"."clinic_id"
WHERE "c"."name" = 'Integral Medic Clinic';

--Add Medical Clinic
INSERT INTO "clinics" ("name", "location")
VALUES ('Integral Medic Clinic', '256 Main St, Springfield');

--Add Departments
INSERT INTO "departments" ("name")
VALUES ('Cardiology'), ('Dermatology'), ('Orthopedics');

--Add Doctors
INSERT INTO "doctors" ("first_name", "last_name", "specialty")
VALUES ('John', 'Roux', 'Cardiologist'),
       ('Mary', 'Baker', 'Dermatologist');

--Add patients
INSERT INTO "patients" ("name", "age", "contact_info")
VALUES ('John', 'Klane', '45', '523-1234'),
       ('Jane', 'Rust', '33', '533-5678');

--Schedule Appointments
INSERT INTO "appointments" ("doctor_id", "patient_id", "appointment_time," "clinic_id")
VALUES (1, 1, '2024-12-20 10:00:00', 1),
       (2, 2, '2024-12-21 14:00:00', 1);

