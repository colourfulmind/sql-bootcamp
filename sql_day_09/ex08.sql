CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10) RETURNS TABLE (number INTEGER) AS $$
    WITH RECURSIVE fibonacci(previous, current) AS
        (SELECT 0, 1
        UNION ALL
        SELECT current, previous + current
        FROM fibonacci
        WHERE current < pstop)
    SELECT previous FROM fibonacci;
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
