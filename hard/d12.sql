# Write your MySQL query statement below
select distinct s.user_id,
coalesce(cast(round(sum(if(c.action='confirmed',1,0))/count(c.action),2) as DECIMAL(10, 2) ),0)as confirmation_rate 
from confirmations c right join signups s on c.user_id=s.user_id group by user_id 

# Write your MySQL query statement below
with cte as (
select departmentId,
name,
salary,
dense_rank() over(partition by departmentId order by salary desc) as rn from employee
) 
select d.name as Department,cte.name as Employee,cte.salary from cte inner join department d on
 cte.departmentId=d.id where rn<=3 order by salary