
--Your task is to decode the cipher left for you by the detective.
--Create a table triplets
CREATE TABLE
	triplets (
		sentence_number INTEGER,
		start_char      INTEGER,
		length          INTEGER
	);

--Insert the values in the created table
INSERT INTO
	triplets (sentence_number, start_char, length)
VALUES
	(14, 98, 4),
	(114, 3, 5),
	(618, 72, 9),
	(630, 7, 3),
	(932, 12, 5),
	(2230, 50, 7),
	(2346, 44, 10),
	(3041, 14, 5);


--The view should be named message and  have a single column (phrase)
CREATE VIEW
	message AS
SELECT
	substr (s.sentence, t.start_char, t.length) AS phrase
FROM
	sentences AS s
	JOIN triplets AS t ON t.sentence_number = s.id;
