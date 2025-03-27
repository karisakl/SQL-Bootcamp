SELECT person.name, menu.pizza_name, menu.price, (menu.price - (menu.price * person_discounts.discount / 100)) as discount_price, pizzeria.name as pizzeria_name
FROM pizzeria
INNER JOIN menu
ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order
ON menu.id = person_order.menu_id
INNER JOIN person
ON person_order.person_id = person.id
INNER JOIN person_discounts
ON person.id = person_discounts.person_id AND person_discounts.pizzeria_id = menu.pizzeria_id
ORDER BY person.name, pizza_name;