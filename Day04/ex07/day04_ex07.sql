INSERT INTO person_visits
VALUES ((SELECT MAX(id)+1 FROM person_visits),
(SELECT id FROM person WHERE name = 'Dmitriy'),
(SELECT pizzeria_id FROM pizzeria INNER JOIN menu
ON pizzeria.id = menu.pizzeria_id
WHERE price < '800' AND pizza_name != 'Papa Johns'
ORDER BY 1 limit 1), 
'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;