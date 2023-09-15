with cte as (
select request_at,id,status
 from trips 
where 
request_at='2013-10-01'  
and(
client_id in (
    select users_id from users where banned='No' and role='client'
)
and
driver_id in (
    select users_id from users where banned='No' and role='driver'
)
)
)
######
, cte2 as (
select request_at,id,status
 from trips 
where 
request_at='2013-10-02'  
and(
client_id in (
    select users_id from users where banned='No' and role='client'
)
and
driver_id in (
    select users_id from users where banned='No' and role='driver'
)
)
),
######
cte3 as (
select request_at,id,status
 from trips 
where 
request_at='2013-10-03'  
and(
client_id in (
    select users_id from users where banned='No' and role='client'
)
and
driver_id in (
    select users_id from users where banned='No' and role='driver'
)
)
),
######
final as(
select request_at as Day,round((select count(*)from cte where status like 'can%')/count(*),2) as "Cancellation Rate" from cte 
union
select request_at as Day,round((select count(*)from cte2 where status like 'can%')/count(*),2) as "Cancellation Rate" from cte2
union
select request_at as Day,round((select count(*)from cte3 where status like 'can%')/count(*),2) as "Cancellation Rate" from cte3
)
select * from final where Day is not null