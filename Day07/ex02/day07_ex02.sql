(SELECT name, count(*) as "count", 'visit' as action_type FROM person_visits pv
INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY "count" DESC
LIMIT 3)
UNION
(SELECT name, count(*) as "count", 'order' as action_type FROM person_order po
INNER JOIN menu ON po.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY "count" DESC
LIMIT 3)
ORDER BY action_type, "count" DESC;