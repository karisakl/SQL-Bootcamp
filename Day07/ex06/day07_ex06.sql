SELECT name, count(*) AS "count_of_orders", round(AVG(price), 2) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM person_order po
INNER JOIN menu ON po.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY name;