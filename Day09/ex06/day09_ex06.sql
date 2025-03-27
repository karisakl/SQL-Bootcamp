CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', pprice numeric default 500, pdate date default '2022-01-08') 
RETURNS TABLE(name varchar) AS $$
BEGIN
RETURN QUERY
SELECT pizzeria.name FROM menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
WHERE price < pprice AND person.name = pperson AND visit_date = pdate;
END;
$$
LANGUAGE plpgsql;