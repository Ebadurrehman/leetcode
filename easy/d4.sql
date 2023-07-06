#Write your MySQL query statement below
select customer_number from (
select customer_number,count(order_number) as a1  from orders group by customer_number  order by a1 desc limit 1
) as b

# Write your MySQL query statement below
select name,population,area from world where area>2999999 or population>24999999