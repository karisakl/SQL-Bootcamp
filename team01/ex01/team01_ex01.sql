with temp_table(name, lastname, cur_name, money, rate_to_usd)
as
(
select 
case 
		when u.name is not null then u.name
		else 'not defined'
	end as name,
	case
		when u.lastname is not null then u.lastname
		else 'not defined'
	end as lastname,
	c.name as currency_name,
	money,
	coalesce((select rate_to_usd from currency c where c.id = b.currency_id and b.updated > c.updated order by c.updated desc limit 1),
			(select rate_to_usd from currency c where c.id = b.currency_id and b.updated < c.updated order by c.updated limit 1)) as rate_to_usd
	from balance b full join "user" u on u.id = b.user_id
					inner join currency c on c.id = b.currency_id
)
select name, lastname, cur_name, money * rate_to_usd as currency_in_usd
from temp_table
group by name, lastname, cur_name, currency_in_usd
order by name desc, lastname, cur_name, currency_in_usd;
