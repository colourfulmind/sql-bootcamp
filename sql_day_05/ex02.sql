DROP INDEX IF EXISTS idx_person_name;

CREATE INDEX idx_person_name
    ON person (UPPER(name));

SET ENABLE_SEQSCAN TO FALSE;

EXPLAIN ANALYZE
SELECT name
FROM person
WHERE UPPER(name) = UPPER('Anna');
