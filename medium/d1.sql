CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select salary from (
      SELECT  distinct salary,dense_rank()over(order by salary desc) as rn  FROM Employee  
    )t1 where rn=N
  );
END