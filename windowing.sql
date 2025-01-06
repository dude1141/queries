cumulative revenue
   SUM(revenue) OVER (ORDER BY revenue_date) AS cumulative_revenue
   

we can easily calculate the daily change in stock price with the following query:

SELECT date, 
	price,
	LAG(price) OVER(ORDER BY date) AS one_day_before,
	price - LAG(price) OVER(ORDER BY date) AS daily_change
FROM stock_price; 
