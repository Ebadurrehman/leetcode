# Write your MySQL query statement below
select id, 
case 
when p_id is null then "Root"
when id not in (select distinct p_id from tree where p_id is not null) then "Leaf"
else "Inner" end as "type" from tree

# Write your MySQL query statement below

select customer_id from customer group by customer_id
having count(distinct product_key)=(select count(product_key) from product)