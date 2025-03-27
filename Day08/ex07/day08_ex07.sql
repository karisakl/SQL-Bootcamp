-- session 1
start transaction;
update pizzeria set rating = 4 WHERE name = 'Dominos';
update pizzeria set rating = 4 WHERE name = 'Pizza Hut';
commit;


-- session 2
start transaction;
update pizzeria set rating = 3 WHERE name = 'Pizza Hut';
update pizzeria set rating = 3 WHERE name = 'Dominos';
commit;