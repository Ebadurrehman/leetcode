CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select salary from (
      SELECT  distinct salary,dense_rank()over(order by salary desc) as rn  FROM Employee  
    )t1 where rn=N
  );
END

# Write your MySQL query statement below
select score,dense_rank() over(order by score desc) as 'rank' from scores

# Write your MySQL query statement
select distinct num as ConsecutiveNums from (
select num, lag(num,1) over() as  prev,lead(num,1) over() as after,lead(num,2)over() as cc  from logs
)t where num=prev and num=after 