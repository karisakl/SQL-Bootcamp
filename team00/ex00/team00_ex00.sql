CREATE TABLE team00 (
    point1 VARCHAR,
    point2 VARCHAR,
    cost INTEGER
);

INSERT INTO team00 VALUES ('a', 'b', 10);
INSERT INTO team00 VALUES ('b', 'a', 10);
INSERT INTO team00 VALUES ('a', 'c', 15);
INSERT INTO team00 VALUES ('c', 'a', 15);
INSERT INTO team00 VALUES ('a', 'd', 20);
INSERT INTO team00 VALUES ('d', 'a', 20);
INSERT INTO team00 VALUES ('b', 'c', 35);
INSERT INTO team00 VALUES ('c', 'b', 35);
INSERT INTO team00 VALUES ('b', 'd', 25);
INSERT INTO team00 VALUES ('d', 'b', 25);
INSERT INTO team00 VALUES ('c', 'd', 30);
INSERT INTO team00 VALUES ('d', 'c', 30);

WITH RECURSIVE team00_team00 AS (
    SELECT point1 AS tour, point1, point2, cost, cost AS total_cost
            FROM team00
            WHERE point1 = 'a'
    UNION ALL
    SELECT CONCAT(tt.tour, ',', t.point1) AS tour2, t.point1, t.point2, t.cost, tt.total_cost + t.cost AS total_cost
            FROM team00 AS t
            JOIN team00_team00 AS tt ON t.point1 = tt.point2 WHERE tour NOT LIKE('%' || t.point1  || '%')
)


SELECT total_cost, CONCAT('{', tour, ',a}') AS tour
FROM team00_team00
WHERE LENGTH(tour) = 7 AND total_cost IN (SELECT MIN(total_cost) FROM team00_team00
                                                                WHERE LENGTH(tour) = 7 AND point2 = 'a')
ORDER BY 1, 2