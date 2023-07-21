# Write your MySQL query statement below
#select delivery_id, customer_id,order_date,customer_pref_delivery_date from delivery
select
round((count(customer_id)/(select count(distinct(customer_id)) from delivery))*100,2) as immediate_percentage
 from delivery 
 where (customer_id,order_date)
 in (select customer_id,min(order_date) from delivery group by customer_id)
 and order_date=customer_pref_delivery_date

 # Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m') as month,country,
count(*) as trans_count,
sum(if(state='approved',1,0)) as approved_count,
sum(amount)as  trans_total_amount,
sum(if(state='approved',amount,0)) as  approved_total_amount
 from transactions
 group by month,country