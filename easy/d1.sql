select name from customer where referee_id is null or referee_id<>2
select p.firstName,p.lastName,a.city,a.state from person p left join address a on p.personId=a.personId
select e2.name as Employee from employee e1 inner join employee e2 on e1.id=e2.managerId where e2.salary>e1.salary