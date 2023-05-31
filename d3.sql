# Write your MySQL query statement below
select e.name,b.bonus from employee e left join bonus b on e.empid=b.empid where b.bonus<1000 or b.bonus is null
# Write your MySQL query statement below
select name from customer where referee_id is null or referee_id<>2