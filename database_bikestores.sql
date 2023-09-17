select * from sales.staffs;

select * from sales.order_items;

select * from sales.order_items where order_id = 2;

select order_id, sum(list_price) as total_price 
from sales.order_items
group by order_id;

create view order_price 
As
select order_id, sum(list_price) as total_price 
from sales.order_items
group by order_id;

select * from order_price;

select * from sales.customers 
order by city;

create procedure Bycities(@location nvarchar(30))
As
begin
select * from sales.customers
where city = @location;
end;

execute Bycities @location = 'Amsterdam';