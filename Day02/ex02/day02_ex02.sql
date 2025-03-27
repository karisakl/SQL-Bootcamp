SELECT CASE
WHEN person.name IS NULL THEN '-'
ELSE person.name
END AS person_name, 
person_visits.visit_date AS visit_date,
CASE
WHEN pizzeria.name IS NULL THEN '-'
ELSE pizzeria.name
END AS pizzeria_name
FROM person
FULL OUTER JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS person_visits
ON person.id = person_visits.person_id
FULL OUTER JOIN pizzeria
ON pizzeria.id = person_visits.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;