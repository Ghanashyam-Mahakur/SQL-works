use boat_database;
/*ALTER TABLE sales_table
RENAME COLUMN `Year Built` TO `year_built`  ;

ALTER TABLE sales_table
RENAME COLUMN `Boat Type` TO `Boat_Type`  ;

ALTER TABLE sales_table
RENAME COLUMN `Number of views last 7 days` TO `Number_of_views_last_7_days`  ; */

/*Which boat is the best selling boats*/
SELECT Boat_Type, COUNT(Price) AS Total_Sales
FROM sales_table
GROUP BY Boat_Type
ORDER BY Total_Sales DESC
LIMIT 1;

/*What is the average price of a boat by manufacturer*/
SELECT Manufacturer, AVG(Price) AS Average_Price
FROM sales_table
GROUP BY Manufacturer
ORDER BY Average_Price DESC;

/*What is the most popular boat type in each location*/
SELECT Location, Boat_Type, COUNT(*) AS Total_Sales
FROM sales_table
GROUP BY Location, Boat_Type
ORDER BY Total_Sales DESC;

/*What is the average number of views for boats by type*/
SELECT Type, AVG(Number_of_views_last_7_days) AS Average_Views
FROM sales_table
GROUP BY Type
ORDER BY Average_Views DESC;

/*Percentage of Boats sold in each location*/
SELECT Location, COUNT(*) / (SELECT COUNT(*) FROM sales_table) * 100 AS Percentage_of_Sales
FROM sales_table
GROUP BY Location
ORDER BY Percentage_of_Sales DESC;

/*Oldest Boat sold in the dataset*/
select Boat_Type,Year_Built from sales_table
order by Year_Built asc
limit 1;

/*Most Popular boat material*/
SELECT Material, COUNT(*) AS Total_Sales
FROM sales_table
GROUP BY Material
ORDER BY Total_Sales DESC
LIMIT 1;

/*Top 5 Manufacturer and boat type that use the most GRP material from 2020-2021*/
SELECT Manufacturer,Boat_Type,COUNT(Price) AS Total_GRP_Sales
FROM sales_table
WHERE Year_Built BETWEEN 2020 AND 2021
AND Material = 'GRP'
GROUP BY Manufacturer, Boat_Type
ORDER BY Total_GRP_Sales DESC
LIMIT 5;

/*Most Popular type in each year*/
SELECT Year_Built,Type,COUNT(*) AS Total_Sales
FROM sales_table
GROUP BY Year_Built, Type
ORDER BY Total_Sales DESC;

/*Avearge price with boat type that is higher than the overall average price*/
SELECT Boat_Type,AVG(Price) AS Average_Price
FROM sales_table
GROUP BY Boat_Type
HAVING Average_Price > (SELECT AVG(Price) FROM sales_table)
order by Average_Price desc;

/*Boat Type with maximum length and width*/
SELECT Boat_Type,MAX(Length) AS Maximum_Length,MAX(Width) AS Maximum_Width
FROM sales_table
GROUP BY Boat_Type
ORDER BY Maximum_Length DESC, Maximum_Width DESC
LIMIT 3;  

/*From the year 2018 to 2020 which material used less*/
SELECT Manufacturer,Material,COUNT(*) AS Total_Sales
FROM sales_table
WHERE Year_Built BETWEEN 2018 AND 2020
GROUP BY Manufacturer, Material
ORDER BY Total_Sales ASC
LIMIT 1; 

/*Boat Type with plastic material having maximum price*/
SELECT Boat_Type,MAX(Price) AS Highest_Price
FROM sales_table
WHERE Material = 'Plastic'
GROUP BY Boat_Type
ORDER BY Highest_Price DESC
LIMIT 1;


select * from sales_table;

