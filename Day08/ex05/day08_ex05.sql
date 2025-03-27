-- session 1
start transaction isolation level read committed;
select sum(rating) from pizzeria;
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;


-- session 2
start transaction isolation level read committed;
update pizzeria set rating = 1 WHERE name = 'Pizza Hut';
commit;
select sum(rating) from pizzeria;