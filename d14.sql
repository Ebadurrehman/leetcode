# Write your MySQL query statement below
select 
sell_date,
count(distinct product)as num_sold,
group_concat(distinct product order by product)as products
 from activities group by sell_date


 # Write your MySQL query statement below
select * from Users where mail LIKE'%@leetcode.com'
 and left(mail, length(mail)-13) rlike '^[A-Za-z][A-Za-z0-9._-]*$'
 
 # Write your MySQL query statement below
select patient_id,patient_name,conditions from patients where conditions like '% DIAB1%' 
or conditions like 'DIAB1%'