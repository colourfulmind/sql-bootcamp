WITH cur_quotes AS (SELECT b.user_id AS u_id,
                           b.money,
                           b.updated,
                           c.name    AS cur_name,
                           c.rate_to_usd,
                           c.updated AS cur_updated
                    FROM balance b
                             JOIN currency c
                                  ON b.currency_id = c.id),
     result_table AS (SELECT q2.id, q2.cur_name, q2.money, q2.updated, COALESCE(q1.diff, q2.diff) AS res_diff
                      FROM (SELECT u_id AS id, cur_name, money, updated, MIN(updated - cur_updated) AS diff
                            FROM cur_quotes
                            WHERE updated - cur_updated > INTERVAL '0 days'
                            GROUP BY 1, 2, 3, 4) q1
                               FULL JOIN (SELECT cur_quotes.u_id            AS id,
                                                 cur_name,
                                                 money,
                                                 updated,
                                                 MAX(updated - cur_updated) AS diff
                                          FROM cur_quotes
                                          WHERE updated - cur_updated < INTERVAL '0 days'
                                          GROUP BY 1, 2, 3, 4) AS q2
                                         ON q1.id = q2.id
                                             AND q1.cur_name = q2.cur_name
                                             AND q1.money = q2.money
                                             AND q1.updated = q2.updated)
SELECT COALESCE(u.name, 'not defined')     AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       result_table.cur_name               AS currency_name,
       result_table.money * cu.rate_to_usd AS currency_in_usd
FROM result_table
         LEFT JOIN "user" u ON result_table.id = u.id
         LEFT JOIN currency cu
                   ON result_table.res_diff = (result_table.updated - cu.updated) AND result_table.cur_name = cu.name
ORDER BY 1 DESC, 2, 3;
