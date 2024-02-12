SET ENABLE_SEQSCAN TO FALSE;

EXPLAIN ANALYZE
SELECT menu.pizza_name AS pizza_name,
       pizzeria.name   AS pizzeria_name
FROM menu
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;
