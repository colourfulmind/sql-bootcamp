CREATE SEQUENCE seq_person_discounts INCREMENT 1;

SELECT setval('seq_person_discounts',
              (CASE
                   WHEN (SELECT COUNT(id) FROM person_discounts) = 0 THEN 1
                   ELSE (SELECT MAX(id) FROM person_discounts)
                  END));

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
