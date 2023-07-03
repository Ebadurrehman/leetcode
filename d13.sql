# Write your MySQL query statement below
select product_name,unit from (
select p.product_name ,sum(unit) as unit  from orders o inner join products p 
on p.product_id=o.product_id
where  order_date between '2020-02-01' and '2020-02-29'  
group by o.product_id ) a where unit>=100

# Write your MySQL query statement below
select eu.unique_id,e.name from employees e left join employeeUNI eu
 on e.id=eu.id

 # Write your MySQL query statement below

select u.name,COALESCE(sum(r.distance), 0) as travelled_distance from 
rides r right join users u on u.id=r.user_id
group by u.id
order by travelled_distance desc , name asc 
