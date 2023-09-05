# Write your MySQL query statement below
select employee_id from employees where salary < 30000
and manager_id is not null and manager_id not in (select employee_id from employees )
order by employee_id
#################
#hard problem 5/9/23
#################
with cte as (
select id,visit_date,people,
lead(id,1) over(order by id) as i1 ,
lead(id,2) over(order by id) as i2
from stadium
where people>=100
),
cte2 as(
select 
*,
case when i2-i1=1 and i1-id=1 then 'con'
else 'nonc'
end as consectv
#id,visit_date,people 
from cte 
)
select * from stadium 
where 
id in (
select id from cte2 where consectv='con'
union 
select i1 as id from cte2 where consectv='con'
union
select i2 as id from cte2 where consectv='con'
)
