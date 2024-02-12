SELECT person.name                                               AS name,
       menu.pizza_name                                           AS pizza_name,
       menu.price                                                AS price,
       menu.price - menu.price * person_discounts.discount / 100 AS discount_price,
       pizzeria.name                                             AS pizzeria_name
FROM person_discounts
         JOIN person ON person_discounts.person_id = person.id
         JOIN pizzeria ON person_discounts.pizzeria_id = pizzeria.id
         JOIN menu ON pizzeria.id = menu.pizzeria_id
         JOIN person_order ON menu.id = person_order.menu_id
WHERE person.id = person_order.person_id
ORDER BY name, pizza_name;
