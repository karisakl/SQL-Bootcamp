(SELECT pizzeria.name AS pizzeria_name FROM pizzeria
INNER JOIN menu 
ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order
ON menu.id = person_order.menu_id
INNER JOIN person
ON person_order.person_id = person.id 
WHERE gender = 'female' 
EXCEPT
SELECT pizzeria.name AS pizzeria_name FROM pizzeria
INNER JOIN menu 
ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order
ON menu.id = person_order.menu_id
INNER JOIN person
ON person_order.person_id = person.id 
WHERE gender = 'male')
UNION
(SELECT pizzeria.name AS pizzeria_name FROM pizzeria
INNER JOIN menu 
ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order
ON menu.id = person_order.menu_id
INNER JOIN person
ON person_order.person_id = person.id 
WHERE gender = 'male' 
EXCEPT
SELECT pizzeria.name AS pizzeria_name FROM pizzeria
INNER JOIN menu 
ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order
ON menu.id = person_order.menu_id
INNER JOIN person
ON person_order.person_id = person.id 
WHERE gender = 'female')
ORDER BY pizzeria_name;