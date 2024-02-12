WITH person_ages AS (SELECT address                                                               AS address,
                            ROUND(MAX(age::NUMERIC) - (MIN(age::NUMERIC) / MAX(age::NUMERIC)), 2) AS formula,
                            ROUND(AVG(age), 2)                                                    AS average
                     FROM person
                     GROUP BY person.address)
SELECT address,
       formula,
       average,
       formula > average AS comparison
FROM person_ages
ORDER BY address;
