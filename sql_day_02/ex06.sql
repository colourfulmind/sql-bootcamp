SELECT menu.pizza_name,
       pizzeria.name AS pizzeria_name
FROM person_order
         JOIN menu ON person_order.menu_id = menu.id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person_order.person_id IN (SELECT person.id FROM person WHERE name = 'Anna' OR name = 'Denis')
ORDER BY pizza_name, pizzeria_name;
