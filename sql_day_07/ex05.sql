SELECT DISTINCT person.name
FROM person_visits
         JOIN person ON person_visits.person_id = person.id
ORDER BY person.name;
