CREATE VIEW v_symmetric_union AS
WITH R AS
         (SELECT person_id
          FROM person_visits
          WHERE visit_date = '2022-01-02'
          EXCEPT
          SELECT person_id
          FROM person_visits
          WHERE visit_date = '2022-01-06'),
     S AS
         (SELECT person_id
          FROM person_visits
          WHERE visit_date = '2022-01-06'
          EXCEPT
          SELECT person_id
          FROM person_visits
          WHERE visit_date = '2022-01-02')
SELECT R.person_id
FROM R
UNION
SELECT S.person_id
FROM S
ORDER BY person_id;
