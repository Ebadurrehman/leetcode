# Write your MySQL query statement below
with cte as (
select stock_name,
case
when operation='Buy' then (-1)*price
when operation='Sell' then price
end as u_price 
from stocks
)
select stock_name,sum(u_price) as capital_gain_loss from cte group by stock_name

SELECT "Low Salary" as category, sum(if(income<20000,1,0)) AS accounts_count FROM Accounts
union
SELECT "High Salary" as category, sum(if(income>50000,1,0)) AS accounts_count FROM Accounts
union
SELECT "Average Salary" as category, sum(if(income between 20000 and 50000,1,0)) AS accounts_count FROM Accounts