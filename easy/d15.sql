# Write your MySQL query statement below
select customer_id,count(customer_id) as count_no_trans from visits 
where visit_id not in (select visit_id from transactions) 
group by customer_id order by count_no_trans desc

# Write your MySQL query statement below
select name,balance from (
select name,t.account,sum(t.amount) as balance 
from transactions t inner join users u using(account) 
group by t.account )t1 where balance > 10000