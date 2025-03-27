SELECT p.name AS person_name, menu.pizza_name, pizzeria.name AS pizzeria_name 
FROM person p
INNER JOIN person_order po
ON po.person_id = p.id
INNER JOIN menu
ON po.menu_id = menu.id
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;