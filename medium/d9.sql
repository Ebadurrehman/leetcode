select  person_name from (
SELECT 
          person_name, 
          turn,
          SUM(weight) OVER (ORDER BY turn) AS "tweight" 
        FROM queue
        ) t1
        where tweight<=1000 order by turn desc limit 1