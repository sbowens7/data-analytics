SELECT *
FROM management
-- id 3, Northeast Region, RD Michael Jarvis, Maryland, Shruti Reddy
 
 -- -- Total revenue overall for sales in Maryland
 SELECT concat('$', Format(SUM(SalesTotal), 2)) AS O_Maryland_Sales
 FROM online_sales
 WHERE ShiptoState = 'Maryland'
	-- $1,420,500.63 Online Sales to Maryland
 SELECT Transaction_Date, concat('$', Format(Sale_Amount, 2)) as Sale_Amount
 FROM store_sales
 WHERE Store_ID BETWEEN '731' AND '739'
 ORDER BY Transaction_Date ASC
	-- 2022-01-01 - 2025-12-31
 -- Store Sales
 SELECT concat('$', format (SUM(Sale_Amount), 2)) AS Maryland_Sales
 FROM store_sales
 WHERE Store_ID BETWEEN '731' AND '739'
 -- $11,451,615.09
 -- $12,872,115.72 overall revenue in Maryland from 2022-01-01 - 2025-12-31
 
 SELECT *
 FROM store_locations
 WHERE State LIKE '%Maryland%'
 -- 731-739 Maryland store ids
 
-- What is the month by month revenue breakdown for the sales territory?

SELECT Year(Date) as Year_Sale, Month(Date) as Month_Sale, concat('$', format(SUM(SalesTotal),2)) AS Total_Sales
FROM online_sales
WHERE ShiptoState = 'Maryland'
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year_Sale ASC, Month_Sale ASC
-- Sales per month from online_sales; 2022-02 - 2025-11

SELECT Year(Transaction_Date) as Year_Sale, Month(Transaction_Date) as Month_Sale, concat('$', format(SUM(Sale_Amount), 2)) AS Total_Sales
FROM store_sales
WHERE Store_ID BETWEEN '731' AND '739'
GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date)
ORDER BY Year_Sale ASC, Month_Sale ASC
-- Sales per month from store_sales;  2022-01 - 2025-12

(SELECT Year(Date) as Year_Sale, Month(Date) as Month_Sale, concat('$', format(SUM(SalesTotal), 2)) AS Total_Sales, 
'Online' AS Sales_Type
FROM online_sales
WHERE ShiptoState = 'Maryland'
GROUP BY YEAR(Date), MONTH(Date))
UNION ALL
(SELECT Year(Transaction_Date) as Year_Sale, Month(Transaction_Date) as Month_Sale, concat('$', format(SUM(Sale_Amount), 2)) AS Total_Sales,
'Store' AS Sales_Type
FROM store_sales
WHERE Store_ID BETWEEN '731' AND '739'
GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date))
ORDER BY Year_Sale ASC, Month_Sale ASC, Sales_Type
-- Sales per month from Maryland Online & Store sales separate; 2022-01 - 2025-12
-- ------------------------------------------------------------------------------------ 

SELECT Year_Sale, Month_Sale, CONCAT('$', FORMAT(SUM(Total_Sales), 2)) AS Combined_Monthly_Sales
FROM ( 
-- Online sales
    SELECT 
        YEAR(Date) AS Year_Sale,
        MONTH(Date) AS Month_Sale,
        SUM(SalesTotal) AS Total_Sales
    FROM online_sales
    WHERE ShipToState = 'Maryland'
    GROUP BY YEAR(Date), MONTH(Date)
UNION ALL
-- Store Sales
    SELECT 
        YEAR(Transaction_Date) AS Year_Sale,
        MONTH(Transaction_Date) AS Month_Sale,
        SUM(Sale_Amount) AS Total_Sales
    FROM store_sales
    WHERE Store_ID BETWEEN 731 AND 739
    GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date)
) AS combined
GROUP BY Year_Sale, Month_Sale
ORDER BY Year_Sale ASC, Month_Sale ASC
-- Total Sales each month of Maryland; 2022-01 - 2025-12
------------------------------------------------
-- Provide a comparison of total revenue for the specific sales territory and the region it belongs to  
SELECT State, Region
FROM management
WHERE Region = 'Northeast'
-- Maryland, Massachusetts, Maine, New Jersey

SELECT concat('$', FORMAT(SUM(total_sales), 2)) as combined_sales
FROM(
SELECT SUM(SalesTotal) as total_sales
 FROM online_sales
 WHERE ShiptoState = 'Maryland' 
 union all
SELECT SUM(Sale_Amount) AS total_sales
FROM store_sales
WHERE Store_ID BETWEEN '731' AND '739')
as combined_sales
-- $12,872,115.72 Maryland Sales

select concat('$', format (sum(SalesTotal), 2)) as NE_Online_Sales
from online_sales
where ShiptoState = 'Maryland'
or ShiptoState = 'Massachusetts' 
or ShiptoState = 'Maine'
or ShiptoState = 'New Jersey'
-- $8,609,433.67 NE Region Online Sales

select  State as NE_Region, Sum(Sale_Amount) as Sale_per_state
from store_locations
join store_sales on StoreId = Store_ID
where State = 'Maryland'
or State = 'Massachusetts' 
or State = 'Maine'
or State = 'New Jersey'
group by 1
-- store sales per state in region

(select Sum(Sale_Amount) as Region_Sales
from store_locations
join store_sales on StoreId = Store_ID
where State = 'Maryland'
or State = 'Massachusetts' 
or State = 'Maine'
or State = 'New Jersey')
-- $24,237,526.98 in NE Region Store Sales

-- $32,846,960.65 total region sales
-- -----------------------------------------------------------------


  
  
 
  