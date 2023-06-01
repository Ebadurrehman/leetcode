# Write your MySQL query statement below
select class from (
select class,count(student) as cc  from courses group by class 
) as b where cc>=5
# Write your MySQL query statement below
select x,y,z,
 case when 
 (x+y>z and x+z>y and y+z>x)then 'Yes'
 else 'No' end as triangle
 from triangle
 # Write your MySQL query statement below
select x,y,z,
 case when 
 (x+y>z and x+z>y and y+z>x)then 'Yes'
 else 'No' end as triangle
 from triangle