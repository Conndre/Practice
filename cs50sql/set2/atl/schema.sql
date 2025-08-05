
CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE airlines (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE flights (
    "id" INTEGER,
    "flight_number" INTEGER,
    "airline_id" INTEGER,
    "departing_airport_code" TEXT,
    "arrival_airport_code" TEXT,
    "departing_datetime" DATETIME,
    "arrival_datetime" DATETIME,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES Airlines("id")
);

CREATE TABLE checkins (
    "id" INTEGER,
    "datetime" DATETIME,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES Passenger("id"),
    FOREIGN KEY("flight_id") REFERENCES Flight("id")
);


