SELECT person.name
FROM person_order
         JOIN person ON person.id = person_order.person_id
         JOIN menu ON menu.id = person_order.menu_id
WHERE gender = 'female'
  AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'cheese pizza')
GROUP BY person.name
HAVING COUNT(menu.pizza_name) > 1
ORDER BY person.name;
