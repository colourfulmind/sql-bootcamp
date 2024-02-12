WITH orders AS (SELECT pizzeria.name               AS name,
                       COUNT(person_order.menu_id) AS count
                FROM person_order
                         JOIN menu ON person_order.menu_id = menu.id
                         RIGHT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                GROUP BY name),
     visits AS (SELECT pizzeria.name                    AS name,
                       COUNT(person_visits.pizzeria_id) AS count
                FROM pizzeria
                         LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
                GROUP BY name)
SELECT orders.name,
       orders.count + visits.count AS total_count
FROM orders
         FULL JOIN visits ON orders.name = visits.name
ORDER BY total_count DESC, name;
