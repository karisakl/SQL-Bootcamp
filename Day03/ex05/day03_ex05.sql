SELECT pizzeria.name AS pizzeria_name FROM pizzeria
INNER JOIN person_visits pv
ON pizzeria.id = pv.pizzeria_id
INNER JOIN person
ON person.id = pv.person_id
WHERE person.name = 'Andrey'
EXCEPT
SELECT pizzeria.name AS pizzeria_name FROM person
INNER JOIN person_order po
ON person.id = po.person_id
INNER JOIN menu
ON po.menu_id = menu.id
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Andrey'
ORDER BY pizzeria_name;


