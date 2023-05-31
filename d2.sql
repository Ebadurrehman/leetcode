select c.name Customers from customers c left join orders o on c.id=o.customerId where o.id is null

SELECT w1.id
FROM Weather w1, Weather w2
WHERE dateDiff(w1.recordDate,w2.recordDate) = 1 AND w1.Temperature > w2.Temperature;

select player_id,min(event_date) as first_login from activity group by player_id