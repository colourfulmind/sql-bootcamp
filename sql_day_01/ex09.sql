SELECT name
FROM pizzeria
WHERE id IN (SELECT id
             FROM pizzeria
             EXCEPT
             SELECT pizzeria_id
             FROM person_visits);

SELECT name
FROM pizzeria
EXCEPT
SELECT name
FROM pizzeria
WHERE EXISTS(SELECT pizzeria_id
             FROM person_visits
             WHERE pizzeria_id = pizzeria.id);

-- SELECT name
-- FROM pizzeria
-- WHERE id NOT IN (SELECT pizzeria_id
--                  FROM person_visits);

-- SELECT name
-- FROM pizzeria
-- WHERE NOT EXISTS(SELECT pizzeria_id
--                  FROM person_visits
--                  WHERE pizzeria_id = pizzeria.id);
