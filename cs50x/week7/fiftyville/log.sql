-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT description FROM crime_scene_reports
    WHERE year = 2023 AND month = 7 AND day = 28 AND street = "Humphrey Street";

--Report said that Theft of CS50 duckling took place at 16:36 atHumphrey Street bakery
-- Interviews were conducted with 3 witnesses and mentions the bakery
-- Littering took place at 16:36. No know witnesses

SELECT id, transcript FROM interviews
    WHERE year = 2023 AND month = 7 AND day = 28;

-- First Transcript. "I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money".
/* Second Transcript: "As the thief was leaving the bakery, they called someone who talked to them.
In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
The thief then asked the person on the other end of the phone to purchase the flight ticket" */

SELECT name FROM people
    JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate
    WHERE year = 2023 AND month = 7 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <= 25
    AND activity = "exit";

--Suspects: Vanessa, Bruce, Barry, Luca, Sofia, Iman, Diana, Kelsey

SELECT name from people
    JOIN bank_accounts ON bank_accounts.person_id = people.id
    JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
    WHERE year = 2023 AND month = 7 AND day = 28
    AND atm_location = "Leggett Street" AND transaction_type = "withdraw";

--Suspects: Bruce, Diana, Brooke, Kenny, Iman, Luca, Taylor, Benista
--Common Suspects are: Bruce, Diana, Luca, Iman

SELECT name from people
    JOIN passengers ON people.passport_number = passengers.passport_number
    JOIN flights ON passengers.flight_id = flights.id
    JOIN airports ON flights.origin_airport_id = airports.id
    WHERE year = 2023 AND month = 7 AND day = 29
    AND airports.city = "Fiftyville" AND flights.hour = 8 AND flights.minute = 20;

--Common Suspects: Bruce, Luca
--Check for Phone Call from Interviews

SELECT name FROM people
    JOIN phone_calls ON phone_calls.caller = people.phone_number
    WHERE year = 2023 AND month = 7 AND day = 28 AND duration > 60;

--The thief is Bruce

SELECT city FROM airports
    WHERE id = (SELECT destination_airport_id FROM flights
    WHERE year = 2023 AND month = 7 AND day = 29 AND origin_airport_id = (
        SELECT id FROM airports WHERE city = "Fiftyville")
        ORDER BY hour, minute
        LIMIT 1);

-- The destination is New York
--Look for the accomplice number

SELECT phone_number FROM people WHERE name = "Bruce";

--Accomplice's Phone number: (367) 555-5533
--Look for the accomplice name using the phone number

SELECT people.name FROM people
    JOIN phone_calls ON people.phone_number = phone_calls.receiver
    WHERE year = 2023  AND month = 7 AND day = 28
    AND duration < 60 AND phone_calls.caller = "(367) 555-5533";

-- The accomplice is Robin
