SELECT name, count(*) as count_of_visits FROM person_visits pv
INNER JOIN person ON pv.person_id = person.id
GROUP BY name
ORDER BY 2 DESC, 1 ASC
LIMIT 4;