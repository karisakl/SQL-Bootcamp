INSERT INTO person_order
SELECT
(select max(id) from person_order) + person.id,
person.id,
(select id from menu where pizza_name like 'gr%'),
'2022-02-25'
from person;