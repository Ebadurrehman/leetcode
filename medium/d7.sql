# Write your MySQL query statement below
select user_id as buyer_id,u.join_date,ifnull(ord,0) as orders_in_2019 from 
(select 
buyer_id,count(order_id) as ord
from Orders
where order_date >'2018-12-31' group by buyer_id) t
right join users u on t.buyer_id=u.user_id

select product_id,price from (select distinct product_id, new_price as price, rank() over (partition by product_id order by change_date desc) as rk
from products p
where change_date <= '2019-08-16'
) t right join (select distinct product_id from products) p1 using(product_id)
where rk=1
union
select distinct product_id, 10 as price
from products
where product_id not in
(select product_id
from products
where change_date <= '2019-08-16')