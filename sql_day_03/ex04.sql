WITH women_orders AS
         (SELECT pizzeria.name AS pizzeria_name
          FROM person_order
                   JOIN menu ON person_order.menu_id = menu.id
                   JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                   JOIN person ON person_order.person_id = person.id
          WHERE person.gender = 'female'),
     men_orders AS
         (SELECT pizzeria.name AS pizzeria_name
          FROM person_order
                   JOIN menu ON person_order.menu_id = menu.id
                   JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                   JOIN person ON person_order.person_id = person.id
          WHERE person.gender = 'male'),
     women_difference AS
         (SELECT *
          FROM women_orders
          EXCEPT
          SELECT *
          FROM men_orders),
     men_difference AS
         (SELECT *
          FROM men_orders
          EXCEPT
          SELECT *
          FROM women_orders)
SELECT *
FROM women_difference
UNION
SELECT *
FROM men_difference
ORDER BY pizzeria_name;
