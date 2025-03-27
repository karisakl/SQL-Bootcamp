-- session 1
start transaction isolation level serializable;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
commit;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';


-- session 2
start transaction isolation level serializable;
update pizzeria set rating = 3.0 WHERE name = 'Pizza Hut';
commit;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';