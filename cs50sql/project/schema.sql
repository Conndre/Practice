-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Table for storing clinic locations
CREATE TABLE "clinics"(
    "id" INTEGER ,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Table for storing doctors
CREATE TABLE "doctors"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "specialty" TEXT NOT NULL,
    "clinic_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("clinic_id") REFERENCES "clinics"("id")
);

-- Table for storing patients
CREATE TABLE "patients"(
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    "contact_info" TEXT,
    PRIMARY KEY ("id")
);

-- Table for storing appointments
CREATE TABLE "appointments"(
    "id" INTEGER,
    "doctor_id" INTEGER,
    "patient_id" INTEGER,
    "appointment_time" DATETIME,
    "clinic_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("doctor_id") REFERENCES "doctors"("id"),
    FOREIGN KEY ("patient_id") REFERENCES "patients"("id"),
    FOREIGN KEY ("clinic_id") REFERENCES "clinics"("id")
);

-- Table for storing medical records (diagnoses and treatments)
CREATE TABLE "medical_records" (
    ("id") INTEGER,
    "patient_id" INTEGER,
    "doctor_id" INTEGER,
    "diagnosis" TEXT,
    "treatment" TEXT,
    "record_date" DATE,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("patient_id") REFERENCES "patients"("id"),
    FOREIGN KEY ("doctor_id") REFERENCES "doctors"("id")
);

-- Table for storing departments (e.g., Cardiology, Dermatology, etc.)
CREATE TABLE "departments" (
    ("id") INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Create indexes to speed common searches
CREATE INDEX "patients_name_search" ON "patients" ("first_name", "last_name");
CREATE INDEX "doctors_name_search" ON "doctors" ("first_name", "last_name");
CREATE INDEX "doctors_specialty_search" ON "doctors" ("first_name", "last_name", "specialty");

-- Adding a department_id to doctors to track their specialty department
ALTER TABLE "doctors" ADD COLUMN "department_id" INTEGER;
ALTER TABLE "doctors" ADD FOREIGN KEY ("department_id") REFERENCES "departments"("id");

