with temp_bal(id, type, volume, cur_id) as
(
select user_id, type, sum(money) as volume, currency_id as cur_id
from balance
group by user_id, type, cur_id
), temp_cur(id, name, last_updated) as
(
select id, name, max(updated) as last_updated
from currency
group by id, name
)
select
	case 
		when u.name is not null then u.name
		else 'not defined'
	end as name,
	case
		when u.lastname is not null then u.lastname
		else 'not defined'
	end as lastname,
	temp_bal.type, temp_bal.volume,
	case 
		when temp_cur.name is not null then temp_cur.name
		else 'not defined'
	end as currency_name,
	coalesce((select rate_to_usd from currency c where c.id = temp_cur.id and c.updated = temp_cur.last_updated), 1) as last_rate_to_usd,
	temp_bal.volume * coalesce((select rate_to_usd from currency c where c.id = temp_cur.id and c.updated = temp_cur.last_updated), 1) as total_volume_in_usd
	from "user" u full join temp_bal
			on u.id = temp_bal.id
			full join temp_cur
			on temp_cur.id = temp_bal.cur_id
order by name desc, lastname, type;

