SELECT order_date, CONCAT(name ,' (age:', age, ')') AS person_information 
FROM person_order CROSS JOIN person
WHERE person_order.person_id = person.id
ORDER BY order_date, person_information ASC;