WITH women_visits AS
         (SELECT pizzeria.name AS pizzeria_name
          FROM pizzeria
                   JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
                   JOIN person ON person_visits.person_id = person.id
          WHERE person.gender = 'female'),
     men_visits AS
         (SELECT pizzeria.name AS pizzeria_name
          FROM person_visits
                   JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                   JOIN person ON person_visits.person_id = person.id
          WHERE person.gender = 'male'),
     women_difference AS
         (SELECT *
          FROM women_visits
          EXCEPT ALL
          SELECT *
          FROM men_visits),
     men_difference AS
         (SELECT *
          FROM men_visits
          EXCEPT ALL
          SELECT *
          FROM women_visits)
SELECT *
FROM women_difference
UNION ALL
SELECT *
FROM men_difference
ORDER BY pizzeria_name;
