CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name 
FROM menu
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_visits
ON person_visits.pizzeria_id = menu.pizzeria_id
INNER JOIN person
ON person_visits.person_id = person.id
WHERE person.name = 'Dmitriy' AND price < '800' AND visit_date = '2022-01-08'