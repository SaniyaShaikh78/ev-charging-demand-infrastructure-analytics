CREATE DATABASE ev_project;

USE ev_project;


select * from clean_ev_data;

--Peak Charging Hours
-- This query counts the number of charging sessions for each hour
-- It helps identify the peak hours when EV charging demand is highest
SELECT hour, COUNT(*) AS total_charges
FROM ev_data
GROUP BY hour
ORDER BY total_charges DESC;

--Revenue by Hour
-- This query calculates total revenue generated in each hour
-- It helps find which time of day generates the most revenue
SELECT hour, SUM(CAST(revenue AS FLOAT)) AS total_revenue
FROM ev_data
GROUP BY hour
ORDER BY total_revenue DESC;

--Top Performing Stations
-- This query sums the revenue for each charging station
-- It helps identify the top-performing stations based on revenue
SELECT station_id, SUM(CAST(revenue AS FLOAT)) AS revenue
FROM ev_data
GROUP BY station_id
ORDER BY revenue DESC;

--High Demand Locations
-- This query counts the number of charging sessions at each location
-- It helps identify locations with the highest demand
SELECT city, COUNT(*) AS demand
FROM ev_data
GROUP BY city
ORDER BY demand DESC;

--Utilization Analysis
-- This query calculates the average utilization of each station
-- It helps understand how efficiently each station is being used
SELECT station_id, AVG(CAST(utilization AS FLOAT)) AS avg_utilization
FROM ev_data
GROUP BY station_id
ORDER BY avg_utilization DESC;

--Total Revenue
-- This query calculates the total revenue from all charging sessions
-- It gives an overall view of business earnings
SELECT SUM(CAST(revenue AS FLOAT)) AS total_revenue
FROM ev_data;


--Peak Hour Revenue Comparison
-- This query compares revenue between peak and non-peak hours
-- It helps analyze performance during high-demand periods
--17–21 → 1 (Peak)
SELECT 
    CASE 
        WHEN hour BETWEEN 17 AND 21 THEN 1 
        ELSE 0 
    END AS peak_hour,
    SUM(CAST(revenue AS DECIMAL(10,2))) AS total_revenue
FROM ev_data
GROUP BY 
    CASE 
        WHEN hour BETWEEN 17 AND 21 THEN 1 
        ELSE 0 
    END;

SELECT TOP 10 station_id, revenue
FROM ev_data;