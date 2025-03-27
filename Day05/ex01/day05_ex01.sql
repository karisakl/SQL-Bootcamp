set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name as pizzeria_name FROM menu
INNER JOIN pizzeria 
on pizzeria.id = menu.pizzeria_id;