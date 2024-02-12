WITH USERS_BALANCE AS (SELECT COALESCE("user".name, 'not defined')     AS name,
                              COALESCE("user".lastname, 'not defined') AS lastname,
                              balance.type                             AS type,
                              SUM(balance.money)                       AS volume,
                              balance.currency_id
                       FROM "user"
                                FULL JOIN balance on "user".id = balance.user_id
                       GROUP BY 1, 2, 3, 5),
     CURRENT_CURRENCY AS (SELECT currency.id,
                                 name,
                                 rate_to_usd,
                                 lastdate
                          FROM (SELECT id,
                                       MAX(updated) AS lastdate
                                FROM currency
                                GROUP BY 1) AS LAST_CURRENCY
                                   LEFT JOIN currency ON LAST_CURRENCY.lastdate = currency.updated AND
                                                         LAST_CURRENCY.id = currency.id)
SELECT USERS_BALANCE.name,
       lastname,
       type,
       volume,
       COALESCE(CURRENT_CURRENCY.name, 'not defined')        AS currency_name,
       COALESCE(rate_to_usd, 1)                              AS last_rate_to_usd,
       COALESCE(CAST(volume * rate_to_usd AS FLOAT), volume) AS total_volume_in_usd
FROM USERS_BALANCE
         LEFT JOIN CURRENT_CURRENCY ON CURRENT_CURRENCY.id = USERS_BALANCE.currency_id
ORDER BY 1 DESC, 2, 3;
