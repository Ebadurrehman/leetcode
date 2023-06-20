SELECT P1.product_id, P1.product_name
FROM Product AS P1
WHERE P1.product_id NOT IN
(SELECT S1.product_id
FROM Sales AS S1 right join product p on S1.product_id=p.product_id
WHERE S1.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
and P1.product_id in (select product_id from sales)