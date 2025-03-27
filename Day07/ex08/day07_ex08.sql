SELECT address, pizzeria.name, count(*) AS "count_of_orders" FROM person
INNER JOIN person_order po ON person.id = po.person_id
INNER JOIN menu ON po.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY address, pizzeria.name
ORDER BY 1, 2;