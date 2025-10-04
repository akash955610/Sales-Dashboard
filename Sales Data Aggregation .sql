CREATE DATABASE Finance_Data;
USE Finance_Data;

CREATE TABLE sales (
Shop_Name varchar(50),
Month_Name varchar(50),
EMI INT,
Cash INT,
EMI_Not_Available int
);


## Total sales (EMI + Cash) by shop and month

SELECT Shop_Name, Month_Name, (EMI + Cash) AS Total_Sales
FROM sales;

## Total sales per shop per month

SELECT
  Shop_Name,
  Month_Name,
  SUM(EMI + Cash) AS Total_Sales
FROM sales
GROUP BY Shop_Name, Month_Name
ORDER BY Shop_Name, 

## Order months in calendar order assuming Month column has Jan, Feb, Mar, etc.
  
  CASE Month_Name
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
    WHEN 'Mar' THEN 3
    WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5
    WHEN 'Jun' THEN 6
    ELSE 7
  END;
  
## Average EMI and Cash sales by shop
SELECT
  Shop_Name,
  AVG(EMI) AS Avg_EMI,
  AVG(Cash) AS Avg_Cash
FROM sales
GROUP BY Shop_Name;

## Sales trend across all shops by month 

SELECT Month_Name,
  SUM(EMI + Cash) AS Total_Sales
FROM sales
GROUP BY Month_Name
ORDER BY CASE Month_Name
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
    WHEN 'Mar' THEN 3
    WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5
    WHEN 'Jun' THEN 6
    ELSE 7
  END;

