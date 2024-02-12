-- Session #1
-- Start session #1, set Pizza Hut's rating to 5, make select to check that the rating has changed.
BEGIN
TRANSACTION;

UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
-- Make select to check that Pizza Hut's rating hasn't changed in the database.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #1
-- Commit changes.
COMMIT;

-- Session #2
-- Make select to check that Pizza Hut's rating is now available in the database.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
