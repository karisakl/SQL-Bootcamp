WITH dates(gs) AS (
SELECT gs::date 
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs) 
SELECT gs AS missing_date FROM dates
LEFT JOIN 
(SELECT visit_date 
FROM person_visits 
WHERE person_id in (1, 2)) AS person_visits 
ON person_visits.visit_date = dates.gs
WHERE person_visits.visit_date IS NULL
ORDER BY missing_date;