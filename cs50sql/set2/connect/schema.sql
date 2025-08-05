CREATE TABLE if not exists Users(
    "id" INTEGER,
    "first_name" TEXT,
    "last name" TEXT,
    "username" TEXT,
    "password" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE if not exists Schools(
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE if not exists Companies (
    "id" INTEGER,
    "name" TEXT,
    "sector" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE if not exists UserConnections(
    "id" INTEGER,
    "user_id" INTEGER,
    FOREIGN KEY("user_id") REFERENCES "Users"("id")
);

CREATE TABLE if not exists UserSchools(
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" DATE,
    "end_date" DATE,
    "degree" TEXT,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("school_id") REFERENCES "Schools"(id)
);

CREATE TABLE if not exists UserCompanies(
    "id" INTEGER,
    "user_id" INTEGER,
    "Company_id" INTEGER,
    "start_date" DATE,
    "end_date" DATE,
    "degree" TEXT,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("company_id") REFERENCES "Companies"("id")
);
