WITH pizzerias AS
         (SELECT pizzeria.id,
                 menu.pizza_name AS pizza_name,
                 pizzeria.name   AS pizzeria_name,
                 menu.price      AS price
          FROM menu
                   JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)
SELECT p1.pizza_name,
       p1.pizzeria_name AS pizzeria_name_1,
       p2.pizzeria_name AS pizzeria_name_2,
       p1.price
FROM pizzerias p1
         JOIN pizzerias p2 ON p1.pizza_name = p2.pizza_name
WHERE p1.price = p2.price
  AND p1.id > p2.id
ORDER BY pizza_name;
