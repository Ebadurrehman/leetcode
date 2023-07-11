# Write your MySQL query statement below
select dept as Department, ee as Employee, Salary from (
select d.name as dept,e.name as ee,salary,
rank() over(partition by d.name order by salary desc) as rn 
from employee e inner join department d on e.departmentId=d.id) t where t.rn=1

# Write your MySQL query statement below
select d.name as  Department,e.name as Employee ,Salary
 from employee e inner join department d on e.departmentId=d.id
 where (d.id ,salary ) in (select departmentId,max(salary) from employee group by departmentId)