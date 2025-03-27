insert into person_discounts
select
    row_number() over() as id,
    person_id, pizzeria_id,
    case 
    when count(*) = 1 then 10.5
    when count(*) = 2 then 22
    else 30
    end as discount
from person_order
inner join menu
on menu.id = person_order.menu_id
group by person_id, pizzeria_id;