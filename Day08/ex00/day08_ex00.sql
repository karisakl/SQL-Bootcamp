-- session 1
start transaction;

update pizzeria set rating = 5 WHERE name = 'Pizza Hut'; 

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

commit;

-- session 2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';