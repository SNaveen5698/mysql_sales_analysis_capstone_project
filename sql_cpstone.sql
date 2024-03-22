-- 1 what is the count of distinct cities in the dataset 
select count(distinct(city)) as city from amazon

-- 2 for each branch,what is corresponding city 
select branch,city from amazon group by branch,city 

-- 3 count of dstinct of prouduct line in the dataset 
select count(distinct(`product line`)) as product_line from amazon 

-- 4 which payment method used most occurly 
select payment,count(*) from amazon group by payment order by payment desc limit 1  

-- 5 which prodict line has most sales in the dataset
select count(*),`product line` from amazon group by `product line` order by `product line` limit 1 

-- 6 how much revenue generated for each month  
select monthname(date) as month,sum(total) from amazon group by month 

-- 7 in which month sales occur most  
select monthname(date)as month,max(total) total from amazon group by month order by total desc limit 1  

-- 8 which product line generated high revenue 
select `product line`,sum(total) from amazon group by `product line`  order by `product line` limit 1

-- 9 in which city has highest revenue 
select city,sum(total)as total  from amazon group by city order by total desc limit 1 

-- 10 Which product line incurred the highest Value Added Tax 
select `product line`,max(`tax 5%`) as tax from amazon group by `product line` order by `product line` limit 1 

-- 11 For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
select `product line`, case 
when sum(total) >(select avg(total) from amazon) then "good" 
else "bad" 
end as product_type from amazon group by `product line`;

-- 12 Identify the branch that exceeded the average number of products sold.
select branch from amazon where quantity>(select avg(quantity) from amazon) 

-- 13 Which product line is most frequently associated with each gender? 
SELECT gender, `product line`, COUNT(*) AS counts FROM amazon a1 GROUP BY gender, `product line` HAVING COUNT(*)= 
(SELECT COUNT(*) FROM amazon a2 WHERE a2.gender = a1.gender GROUP BY `product line` ORDER BY COUNT(*) DESC,gender asc  LIMIT 1);

-- 14 Calculate the average rating for each product line. 
select `product line`,avg(rating) as rating from amazon group by `product line`; 

-- 15 Count the sales occurrences for each time of day on every weekday.
select time(`time`) as `time`,dayname(date) as dayname,count(Quantity)as sales from amazon group by `time`,dayname;

-- 16 Identify the customer type contributing the highest revenue.
select `customer type`,sum(total) as total_revenue from amazon group by `customer type` order by sum(Total) desc limit 1;

-- 17 Determine the city with the highest VAT percentage
select city,max(`tax 5%`) as highest_VAT_percentage from amazon group by city order by highest_VAT_percentage desc limit 1;

-- 18 Identify the customer type with the highest VAT payments.
select `customer type`,sum(`tax 5%`) as highest_VAT_payments from amazon group by `customer type` 
order by sum(`tax 5%`) desc limit 1;

-- 19 What is the count of distinct customer types in the dataset 
select count(distinct(`customer type`)) from amazon;

-- 20 What is the count of distinct payment methods in the dataset 
select count(distinct(payment)) as payment_methods from amazon

-- 21 Which customer type occurs most frequently?
select `customer type`,count(*)as most_frequentl_customer_type from amazon group by `customer type` 
order by count(*) desc limit 1;

-- 22 Identify the customer type with the highest purchase frequency
select `customer type`,count(*)as most_frequentl_customer_type from amazon group by `customer type` 
order by count(*) desc limit 1;

-- 23 Determine the predominant gender among customers
select gender,count(*) from amazon group by gender order by gender limit 1

-- 24 Examine the distribution of genders within each branch. 
select gender,branch,count(*)as gender_count from amazon group by gender,branch order by gender,branch; 

-- 25 Identify the time of day when customers provide the most ratings. 
select time ,count(rating)as ratings from amazon group by time order by ratings desc limit 1; 

-- 26 Determine the time of day with the highest customer ratings for each branch. 
select time,branch ,count(rating) as ratings from amazon group by time,branch order by Ratings desc ; 

-- 27 Identify the day of the week with the highest average ratings. 
 select dayname(date) as dayname,avg(rating)as ratings from amazon group by dayname order by ratings desc limit 1; 
 
 -- 28 Determine the day of the week with the highest average ratings for each branch.
select dayname(date) as dayname,branch,avg(rating)as ratings from amazon group by dayname,branch order by ratings desc limit 1