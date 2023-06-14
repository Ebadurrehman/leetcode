# Write your MySQL query statement beup
update salary set sex=
case when sex='f' then 'm' 
when sex='m' then 'f' end
# Write your MySQL query statement below
Select actor_id,director_id
From ActorDirector
GROUP BY actor_id,director_id
having count(timestamp)>=3