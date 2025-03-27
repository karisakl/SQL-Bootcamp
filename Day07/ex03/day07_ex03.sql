SELECT c1.name, coalesce(c1.count, 0) + coalesce(c2.count,0) as total_count
FROM
(SELECT name, count(*) as "count" FROM person_visits pv
INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
GROUP BY name
) as c1
FULL JOIN
(SELECT name, count(*) as "count" FROM person_order po
INNER JOIN menu ON po.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY name
) as c2 
ON c1.name = c2.name
ORDER BY "total_count" DESC, name ASC;