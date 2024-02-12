SELECT menu.pizza_name,
       menu.price,
       pizzeria.name AS pizzeria_name
FROM menu
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
EXCEPT
SELECT menu.pizza_name,
       menu.price,
       pizzeria.name AS pizzeria_name
FROM person_order
         JOIN menu ON menu.id = person_order.menu_id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;
