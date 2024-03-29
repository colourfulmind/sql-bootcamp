SELECT missing_date::date
FROM generate_series('2022-01-01'::date,
                     '2022-01-10'::date,
                     '1 day'::interval) AS missing_date
         LEFT JOIN (SELECT visit_date, person_id FROM person_visits WHERE person_id = 1 OR person_id = 2) AS visits
                   ON missing_date = visits.visit_date
WHERE person_id IS NULL
ORDER BY missing_date;
