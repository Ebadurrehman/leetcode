select max(num) num from (
select num,count(num) c from MyNumbers group by num 
) as b where c=1

# Write your MySQL query statement below
select * from cinema where mod(id,2)<>0 and description<>'boring' order by rating desc