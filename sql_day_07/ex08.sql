-- WITH orders AS (SELECT DISTINCT pizzeria.name
--                 FROM person_order
--                          JOIN menu ON person_order.menu_id = menu.id
--                          JOIN pizzeria ON menu.pizzeria_id = pizzeria.id),
--      visits AS (SELECT DISTINCT pizzeria.name
--                 FROM person_visits
--                          RIGHT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id)
-- SELECT person.address,
--        pizzeria.name,
--        COUNT(orders.name) AS count_of_orders
-- FROM person_order
--          JOIN person ON person_order.person_id = person.id
--          JOIN menu ON person_order.menu_id = menu.id
--          JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
--          JOIN orders ON orders.name = pizzeria.name
-- WHERE pizzeria.name IN ((SELECT name FROM orders) UNION ALL (SELECT name FROM visits))
-- GROUP BY person.address, pizzeria.name
-- ORDER BY person.address, pizzeria.name;

SELECT person.address,
       pizzeria.name,
       COUNT(pizzeria_id) AS count_of_orders
FROM person_order
         JOIN person ON person_order.person_id = person.id
         JOIN menu ON person_order.menu_id = menu.id
         JOIN pizzeria On menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY person.address, pizzeria.name;
