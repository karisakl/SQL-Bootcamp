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
WHERE point2 = 'a' AND LENGTH(tour) = 7 AND total_cost IN (SELECT MIN(total_cost) FROM team00_team00 WHERE LENGTH(tour) = 7 AND point2 = 'a'
                                        UNION
                                        SELECT MAX(total_cost) FROM team00_team00 WHERE LENGTH(tour) = 7 AND point2 = 'a')
ORDER BY 1, 2