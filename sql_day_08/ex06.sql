-- Session #1
-- Start session #1 with repeatable read isolation level.
BEGIN
TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #2
-- Start session #2 with repeatable read isolation level.
BEGIN
TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1
-- Make select to see sum of all ratings in session #1.
SELECT SUM(rating)
FROM pizzeria;

-- Session #2
-- Set Pizza Hut's rating to 1 in session #2. Commit changes.
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut';

COMMIT;

-- Session #1
-- Make select to see sum of all ratings in session #1. Commit changes.
-- Make select to see sum of all ratings in session #1 after committed changes.
SELECT SUM(rating)
FROM pizzeria;

COMMIT;

SELECT SUM(rating)
FROM pizzeria;

-- Session #2
-- Make select to see sum of all ratings in session #2.
SELECT SUM(rating)
FROM pizzeria;
