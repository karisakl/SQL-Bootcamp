SELECT menu1.pizza_name, pizzeria1.name AS pizzeria_name_1, pizzeria2.name AS pizzeria_name_2, menu1.price 
FROM pizzeria pizzeria1
INNER JOIN menu menu1
ON pizzeria1.id = menu1.pizzeria_id
INNER JOIN menu menu2
ON menu1.pizza_name = menu2.pizza_name
INNER JOIN pizzeria pizzeria2
ON menu2.pizzeria_id = pizzeria2.id
WHERE menu1.price = menu2.price AND pizzeria1.id > pizzeria2.id
ORDER BY menu1.pizza_name;
