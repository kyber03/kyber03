USE Bikestores

SELECT * FROM SALES.customers--- CUSTOMER_ID
SELECT * FROM SALES.orders---- ORDER_ID
SELECT * FROM SALES.order_items
SELECT * FROM production.brands
SELECT * FROM production.categories
SELECT * FROM production.products

SELECT * FROM SALES.orders
order by order_id desc


SELECT PRODUCT_NAME, LIST_PRICE FROM production.products P1 
WHERE PRODUCT_ID (

-------- joins for 3 4 tables-------------
SELECT FIRST_NAME,order_date, sc.customer_id, so.ORDER_ID, soi.PRODUCT_ID,product_name FROM SALES.customers AS sc
INNER JOIN SALES.orders AS so ON
Sc.customer_id = so.customer_id
INNER JOIN SALES.order_items as soi ON
so.ORDER_ID = soi.ORDER_ID
INNER JOIN production.products as Pp ON
pp.product_id = soi.product_id;



------------joins 4 tables using group by, order by---------------

SELECT FIRST_NAME, so.ORDER_ID, sum(PP.list_price) FROM SALES.customers AS sc
INNER JOIN SALES.orders AS so ON
Sc.customer_id = so.customer_id
INNER JOIN SALES.order_items as soi ON
so.ORDER_ID = soi.ORDER_ID
INNER JOIN production.products as Pp ON
pp.product_id = soi.product_id
group by first_name, so.order_id
order by order_id;

-------------- joins for overall stock(4 tables)-------

select product_name,category_name,brand_name,list_price, pro.product_id, store_id, quantity from production.products as pro
inner join production.categories as item on
pro.category_id = item.category_id
inner join production.brands as brand on
pro.brand_id = brand.brand_id
inner join production.stocks as stock on
pro.product_id = stock.product_id;


--------------NOT AVAILABLE STOCKS---

select product_name, product_id from production.products 
where product_id NOT IN (
select PRODUCT_ID from production.stocks
WHERE store_id = 2);

