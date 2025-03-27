-- session 1
start transaction;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
update pizzeria set rating = 4 WHERE name = 'Pizza Hut';
commit;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';


-- session 2
start transaction;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
update pizzeria set rating = 3.6 WHERE name = 'Pizza Hut';
commit;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';