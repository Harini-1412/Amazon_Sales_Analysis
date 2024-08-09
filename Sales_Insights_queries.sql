use amazon_db;

use amazon_db;
-- Feature Engineering:timeofday
select *,
case
	when time between '06:00:00' and '11:59:59' then 'Morning'
	when time between '12:00:00' and '17:59:59' then 'Afternoon'
	when time between '18:00:00' and '21:59:59' then 'Evening'
end as time_of_day
from amazon

-- dayname 
select *, dayname(str_to_date(date,'%d-%m-%Y')) as day_name
from amazon

-- monthname
select *, monthname(str_to_date(date,'%d-%m-%Y')) as month_name
from amazon
=================================================================
select * from amazon

-- 1.What is the count of distinct cities in the dataset?
select count(distinct city) as count_of_distinct_city 
from amazon

-- 2.For each branch, what is the corresponding city?
select branch, city 
from amazon
group by branch,city
order by branch

-- 3.What is the count of distinct product lines in the dataset?
select count(distinct product_line) as count_of_distinct_product
from amazon

-- 4.Which payment method occurs most frequently?
select payment_method,count(payment_method) as count
from amazon
group by payment_method
order by count desc
limit 1

-- 5.Which product line has the highest sales?
select product_line, round(sum(quantity*unit_price),2) as sum_of_sales
from amazon
group by product_line
order by sum_of_sales desc
limit 1

-- 6.How much revenue is generated each month?
select monthname(str_to_date(date,'%d-%m-%Y')) as month_name,sum(total) as total_sum
from amazon
group by month_name
order by total_sum desc
limit 1

-- 7.In which month did the cost of goods sold reach its peak?
select monthname(str_to_date(date,'%d-%m-%Y')) as month_name,sum(cogs) as total_cost_of_goods
from amazon
group by month_name
order by total_cost_of_goods desc
limit 1

-- 8.Which product line generated the highest revenue?
select product_line,sum(total) as total_revenue
from amazon
group by product_line
order by total_revenue desc
limit 1

-- 9.In which city was the highest revenue recorded?
select city,sum(total) as total_sum
from amazon
group by city
order by total_sum desc
limit 1

-- 10.Which product line incurred the highest Value Added Tax?
select product_line,sum(VAT) as sum_of_VAT
from amazon
group by product_line
order by sum_of_VAT desc
limit 1

-- 11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
with average_sale as
(
select avg(unit_price*quantity) as avg_sale from amazon
),
sales_per_product_line as
(
select product_line,sum(quantity*unit_price) as total_sales
from amazon
group by product_line
)
select S.product_line,S.total_sales,
case when S.total_sales > A.avg_sale  then 'Good'
else 'Bad'
end as sales_performance
from sales_per_product_line S,average_sale A;

-- OR

select product_line,sum(unit_price*quantity),
case when sum(unit_price*quantity) > (select Avg(unit_price*quantity) from amazon)  then 'Good'
else 'Bad'
end as sales_performance
from amazon
group by product_line

-- 12.Identify the branch that exceeded the average number of products sold.
select branch,sum(quantity) as quantity_sum
from amazon
group by branch
having sum(quantity) > (select avg(quantity) from amazon)

-- 13.Which product line is most frequently associated with each gender?
select gender,product_line,count_of_each_product from
(select gender,product_line,count(product_line) as count_of_each_product,
row_number() over (partition by gender order by count(product_line) desc) as row_num
from amazon
group by gender,product_line
order by gender,count_of_each_product desc)T
where row_num=1
 
-- OR
 
with cte as
(select gender,product_line,count(product_line) as count_of_each_product,
row_number() over (partition by gender order by count(product_line) desc) as row_num
from amazon
group by gender,product_line
order by gender,count_of_each_product desc)

select gender,product_line,count_of_each_product from cte 
where row_num=1

-- 14.Calculate the average rating for each product line.
select product_line,avg(rating) as average_rating
from amazon
group by product_line
order by average_rating desc

-- 15.Count the sales occurrences for each time of day on every weekday.
with count_of_occurrances as
(
select dayname(str_to_date(date,'%d-%m-%Y')) as day_name,count(total) as count_of_sales
from amazon
group by dayname(str_to_date(date,'%d-%m-%Y'))
),
every_weekday as
(
select *,
case 
	when day_name in ('Monday','Tuesday','Wednesday','Thursday','Friday') then 'weekday' 
	else 'weekend'
end as week_div
from count_of_occurrances
)
select * from every_weekday
where week_div='weekday'
order by count_of_sales desc

-- 16.Identify the customer type contributing the highest revenue.
select customer_type, sum(total) as total_sum from amazon
group by customer_type
order by total_sum desc

-- 17.Determine the city with the highest VAT percentage.
select city, (VAT/total)*100 as VAT_percent
from amazon
order by VAT_percent desc
limit 1

-- 18. Identify the customer type with the highest VAT payments.
select customer_type,VAT
from amazon
order by VAT desc
limit 1

-- 19.What is the count of distinct customer types in the dataset?
select count(distinct customer_type) as count_of_distinct_customertype 
from amazon

-- 20.What is the count of distinct payment methods in the dataset?
select count(distinct payment_method) as count_of_distinct_paymentmethod
from amazon

-- 21.Which customer type occurs most frequently?
select customer_type,count(customer_type) as count_of_customer_type 
from amazon
group by customer_type
order by count_of_customer_type desc
limit 1

-- 22.Identify the customer type with the highest purchase frequency.
select customer_type,count(*) as purchase_freq from amazon
group by customer_type
order by purchase_freq desc
limit 1

-- 23.Determine the predominant gender among customers.
select gender, count(*)
from amazon 
group by gender

-- 24.Examine the distribution of genders within each branch.
select branch,count(gender) as distribution_of_gender
from amazon 
group by branch
order by distribution_of_gender desc

-- 25.Identify the time of day when customers provide the most ratings.
with cte as
(
select rating,
case
	when time between '06:00:00' and '11:59:59' then 'Morning'
	when time between '12:00:00' and '17:59:59' then 'Afternoon'
	when time between '18:00:00' and '21:59:59' then 'Evening'
end as time_of_day
from amazon
)
select time_of_day,count(rating) as count_of_rating 
from cte
group by time_of_day
order by count_of_rating desc
limit 1

-- 26.Determine the time of day with the highest customer ratings for each branch.
with cte as
(
select rating,branch,
case
	when time between '06:00:00' and '11:59:59' then 'Morning'
	when time between '12:00:00' and '17:59:59' then 'Afternoon'
	when time between '18:00:00' and '21:59:59' then 'Evening'
end as time_of_day
from amazon
),
cte1 as
(
select branch,time_of_day,max(rating) as max_rating
from cte
group by branch,time_of_day
order by branch,time_of_day,max_rating
),
cte2 as 
(
select *,
row_number() over (partition by branch order by max_rating desc) as row_no
from cte1
)
select * from cte2
where row_no=1

-- 27.Identify the day of the week with the highest average ratings.
select dayname(str_to_date(date,'%d-%m-%Y')) as day_name, avg(rating) as average_rating
from amazon
group by dayname(str_to_date(date,'%d-%m-%Y')) 
order by average_rating desc
limit 1

-- 28.Determine the day of the week with the highest average ratings for each branch.
with cte as
(
select *, dayname(str_to_date(date,'%d-%m-%Y')) as day_name
from amazon
),
cte1 as
(
select branch,day_name,avg(rating) as average_rating
from cte
group by branch,day_name
order by average_rating desc
),
cte2 as 
(
select *,
row_number() over (partition by branch order by average_rating desc) as row_no
from cte1
)
select * from cte2
where row_no=1




