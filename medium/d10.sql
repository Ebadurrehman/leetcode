/* Write your T-SQL query statement below */
with cte as (
SELECT   distinct visited_on, 
         SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)   AS'amount',
         ROUND(avg(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS'average_amount',
         row_number()over(order by visited_on) as rn 
  from (select visited_on, sum(amount) as amount from Customer group by visited_on) as d
GROUP BY visited_on
ORDER BY visited_on
)
select visited_on, amount, average_amount from cte where rn>=7

# Write your MySQL query statement below

with cte1 as
(
select user_id,count(movie_id) as sm from movierating group by user_id
) 
,
cte2 as (
select * from cte1 where sm=(select max(sm) from cte1)
)
,cte3 as (
select  u.name as results from cte2 inner join users u on cte2.user_id=u.user_id
order by name limit 1
) 
select * from cte3
union all
(with cte4 as (
select movie_id, avg(rating) as ar from movierating where month (created_at)=2 group by movie_id
)
select m.title as results from cte4
inner join movies m on m.movie_id=cte4.movie_id 
where ar=(select max(ar) from cte4) order by results limit 1)