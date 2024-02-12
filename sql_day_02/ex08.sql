SELECT person.name
FROM menu
         JOIN person_order ON person_order.menu_id = menu.id
         JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'male'
  AND person.address IN ('Moscow', 'Samara')
  AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY person.name DESC;
