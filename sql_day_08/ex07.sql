-- Session #1
-- Start session #1 with repeatable read isolation level.
BEGIN
TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #2
-- Start session #2 with repeatable read isolation level.
BEGIN
TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1
-- Set rating to 4 for pizzeria with id #1 in session #1.
UPDATE pizzeria
SET rating = 4
WHERE id = 1;

-- Session #2
-- Set rating to 4 for pizzeria with id #2 in session #2.
UPDATE pizzeria
SET rating = 4
WHERE id = 2;

-- Session #1
-- Set rating to 4 for pizzeria with id #2 in session #1.
UPDATE pizzeria
SET rating = 4
WHERE id = 2;

-- Session #2
-- Set rating to 4 for pizzeria with id #1 in session #1. Get an error.
UPDATE pizzeria
SET rating = 4
WHERE id = 1;

-- Session #1
-- Commit changes in session #1.
COMMIT;

-- Session #2
-- Commit changes in session #2. Rollback.
COMMIT;
