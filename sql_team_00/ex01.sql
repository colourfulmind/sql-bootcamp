DROP TABLE IF EXISTS routes;

CREATE TABLE IF NOT EXISTS routes
(
    start_point VARCHAR NOT NULL,
    end_point   VARCHAR NOT NULL,
    cost        INTEGER NOT NULL
);

INSERT INTO routes (start_point, end_point, cost)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);

WITH RECURSIVE find_routes AS (SELECT start_point as start,
                                      end_point,
                                      cost
                               FROM routes
                               UNION
                               SELECT CONCAT(parent.start, ',', child.start_point),
                                      child.end_point,
                                      parent.cost + child.cost
                               FROM routes AS child
                                        JOIN find_routes AS parent ON child.start_point = parent.end_point
                               WHERE start NOT LIKE CONCAT('%', child.start_point, '%'))
(SELECT cost                                    AS total_cost,
       CONCAT('{', start, ',', end_point, '}') AS tour
FROM find_routes
WHERE LENGTH(start) = 7
  AND start LIKE 'a,%'
  AND end_point = 'a'
  AND cost = (SELECT MIN(cost)
              FROM find_routes
              WHERE LENGTH(start) = 7
                AND start LIKE 'a%'
                AND end_point = 'a')
ORDER BY total_cost, tour)
UNION
(SELECT cost                                    AS total_cost,
       CONCAT('{', start, ',', end_point, '}') AS tour
FROM find_routes
WHERE LENGTH(start) = 7
  AND start LIKE 'a,%'
  AND end_point = 'a'
  AND cost = (SELECT MAX(cost)
              FROM find_routes
              WHERE LENGTH(start) = 7
                AND start LIKE 'a%'
                AND end_point = 'a')
ORDER BY total_cost, tour);
