CREATE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson VARCHAR DEFAULT 'Dmitriy',
                                                   IN pprice NUMERIC DEFAULT 500,
                                                   IN pdate DATE DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                name VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT pizzeria.name
        FROM person_visits
                 JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                 JOIN person ON person_visits.person_id = person.id
                 JOIN menu ON pizzeria.id = menu.pizzeria_id
        WHERE person.name = pperson
          AND person_visits.visit_date = pdate
          AND menu.price < pprice;
END;
$$
    LANGUAGE PLPGSQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
