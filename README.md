# 总体评价
## database
实验1和实验2都是sql实操，很简单而没什么用。实验3要求写一个简单的有图形界面的数据库。建议照着别人的搓一个，耗时是最长的。实验4是本部流传下来的、bufferpool 的模拟和某些 sql 语句的实现。纯 c 语言。非常垃圾，根本无法模拟 bufferpool，concurrency 都没有。
## cryptography
实验主要是算法的实现。除了实验3是验证实验，也即，不用你写代码，但是实验描述非常垃圾，很难看懂。
## os
有在创新，但是实验1到实验3都很简单，也即，没什么用。
## big data
无法评价。有点乱来。主要是看大作业做的怎么样。
## compiler
很一般。很简单。也即，没用。

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
