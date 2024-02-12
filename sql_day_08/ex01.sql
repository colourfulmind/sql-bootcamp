-- Session #1
-- Start session #1.
BEGIN
TRANSACTION;

-- Session #2
-- Start session #2.
BEGIN
TRANSACTION;

-- Session #1
-- Make select to see Pizza Hut's rating in session #1.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
-- Make select to see Pizza Hut's rating in session #2.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #1
-- Set Pizza Hut's rating to 4 in session #1.
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';

-- Session #2
-- Try to set Pizza Hut's rating to 3.6 in session #2.
-- Can't set new changes because changes in session #1 isn't committed.
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

-- Session #1
-- Commit changes in session #1.
-- Set Pizza Hut's rating to 3.6 in session #2.
COMMIT;

-- Session #2
-- Commit changes in session #2.
COMMIT;

-- Session #1
-- Make select in session #1. See Pizza Hut's rating is the same as in the last commit - 3.6.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
-- Make select in session #2. See Pizza Hut's rating is 3.6.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
