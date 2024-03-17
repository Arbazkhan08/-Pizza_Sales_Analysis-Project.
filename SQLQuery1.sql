select * from pizza_sales

Select sum(total_price) as Total_Revenue from pizza_sales


select sum(total_price) / Count(DISTINCT order_id) as Avg_Order_Value from pizza_sales

select sum(quantity) as Total_Pizzas_Sold from pizza_sales

select count(DISTINCT order_id) as Total_Orders from pizza_sales

select cast(sum(quantity)as Decimal (10, 2)) / 
cast(count(DISTINCT order_id) as Decimal(10,2)) AVG_Pizzas_Per_Order from pizza_sales

select Datename(DW, order_date) as order_day, Count(Distinct order_id) as Total_orders
from pizza_sales
group by Datename(DW, order_date)

select Datename(month, order_date) as Month_name, count(Distinct order_id) as Total_orders
from pizza_sales
group by Datename(month, Order_date) 
order by Total_orders DESC

select pizza_category,sum(total_price) as Total_sales, sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as Total_PER_sales from pizza_sales 
group by pizza_category

select pizza_category,sum(total_price) as Total_sales, sum(total_price) * 100 /
(select sum(total_price) from pizza_sales where month(order_date)=1) as Total_PER_sales from pizza_sales 
where month(order_date)=1
group by pizza_category

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales, cast(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales where datepart(quarter, order_date)=1
) as decimal(10,2)) as Total_PER_sales from pizza_sales
where datepart(quarter, order_date)=1
group by pizza_size
order by Total_PER_sales desc

select Top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc

select Top 5 pizza_name, count(Distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc
