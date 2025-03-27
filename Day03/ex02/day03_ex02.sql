SELECT pizza_name, price, pizzeria.name
FROM (
    SELECT id AS menu_id FROM menu
    EXCEPT
    SELECT menu_id FROM person_order
    ) AS p
INNER JOIN menu
ON p.menu_id = menu.id
INNER JOIN pizzeria
ON pizzeria.id =  menu.pizzeria_id
ORDER BY pizza_name, price;