-- Session #1
-- Start session #1 with read committed isolation level.
BEGIN
TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #2
-- Start session #2 with read committed isolation level.
BEGIN
TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #1
-- Make select to see Pizza Hut's rating in session #1.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
-- Set Pizza Hut's rating to 3.6 in session #2. Commit changes.
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

COMMIT;

-- Session #1
-- Make select to see Pizza Hut's rating in session #1. Commit changes.
-- Make select to see Pizza Hut's rating in session #1 after committed changes.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
-- Make select to see Pizza Hut's rating in session #2.
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
