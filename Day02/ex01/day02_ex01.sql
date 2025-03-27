SELECT gs::date AS missing_date
FROM GENERATE_SERIES('2022-01-01','2022-01-10',interval '1 day') AS gs
LEFT JOIN (SELECT visit_date FROM person_visits
WHERE person_id IN (1, 2)) AS person_visits
ON person_visits.visit_date = gs
WHERE person_visits.visit_date IS NULL
ORDER BY missing_date;