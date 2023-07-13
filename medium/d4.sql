# Write your MySQL query statement below
 with cte as (select requester_id,count(requester_id) as cc from RequestAccepted group by requester_id union all (
select accepter_id,count(accepter_id) as cc from RequestAccepted group by accepter_id))

,
cte1 as
(select requester_id, sum(cc) su from cte group by requester_id)  
select distinct(requester_id) as id,su as num from cte1  where su=(select max(su) from cte1)