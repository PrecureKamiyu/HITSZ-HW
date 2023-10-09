# HITSZ 2023 Database Experiment

## lab 1 sql

you need to revise the code manually in sql_1.sql to
``` sql
select concat(c.first_name, " ", c.last_name) as customer_name
from country as co
inner join city as ci on co.country_id = ci.country_id
inner join address as a on ci.city_id = a.city_id
inner join customer as c on a.address_id = c.address_id
where co.country = 'Germany'
```
and you need to change the report respectively.

It is a simple mistake.

## lab 2
lab2 has not much code. It is rather bullshit. so just read the report.
