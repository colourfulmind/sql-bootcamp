DROP INDEX IF EXISTS idx_menu_unique;

CREATE UNIQUE INDEX idx_menu_unique
    ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO FALSE;

EXPLAIN ANALYSE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizza_name = 'cheese pizza';
