-- session 1
start transaction isolation level repeatable read;
select sum(rating) from pizzeria;
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;


-- session 2
start transaction isolation level repeatable read;
update pizzeria set rating = 5 WHERE name = 'Pizza Hut';
commit;
select sum(rating) from pizzeria;