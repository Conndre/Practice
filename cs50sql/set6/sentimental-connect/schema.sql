/* Your task at hand is to create a MySQL database for LinkedIn from scratch.
The implementation details are up to you */

CREATE DATABASE "linkedin";
USE "linkedin";

CREATE TABLE "users"(
    "id" INTEGER AUTO_INCREMENT PRIMARY KEY,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "username" VARCHAR(255) NOT NULL UNIQUE,
    "password" CHAR(128),
    PRIMARY KEY ("ID")
);

CREATE TABLE "schools"(
    "id" INTEGER AUTO_INCREMENT,
    "name" VARCHAR(255) NOT NULL,
    "school_type" ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "founding_year" DATE,
    PRIMARY KEY ("ID")
);

CREATE TABLE "companies"(
    "id" INTEGER AUTO_INCREMENT,
    "name" VARCHAR(255) NOT NULL,
    "industry" ENUM('Technology', 'Education', 'Business') NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "connections"(
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY ("user1_id", "user2_id"),
    FOREIGN KEY ("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY ("user2_id") REFERENCES "users"("id")
);   `

CREATE TABLE "user_schools"(
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start" DATE,
    "end" DATE,
    "degree" TEXT,
    PRIMARY KEY ("user_id", "school_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "school"("id")
);

CREATE TABLE "user_companies"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start" DATE,
    "end" DATE,
    "title" TEXT
    PRIMARY KEY ("user_id", "company_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);

