SELECT pizzeria.name               AS name,
       COUNT(person_order.menu_id) AS count_of_orders,
       ROUND(AVG(menu.price), 2)   AS average_price,
       MAX(menu.price)             AS max_price,
       MIN(menu.price)             AS max_price
FROM person_order
         JOIN menu ON person_order.menu_id = menu.id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY name;
