CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, round(price*0.9) AS discount_price
FROM person
JOIN person_order
ON person.id = person_order.person_id
JOIN menu
ON person_order.menu_id = menu.id 
ORDER BY name, pizza_name