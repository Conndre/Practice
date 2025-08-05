/* 2- Users need to be prevented from re-opening a message that has expired.
 Find when the message with ID 151 expires. You may use the message’s ID directly in your query. */
SELECT "expires_timestamp" FROM "messages"
WHERE "id" = "151";

