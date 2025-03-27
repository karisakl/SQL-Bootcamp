-- session 1
start transaction isolation level read committed;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
commit;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';


-- session 2
start transaction isolation level read committed;
update pizzeria set rating = 3.6 WHERE name = 'Pizza Hut';
commit;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';