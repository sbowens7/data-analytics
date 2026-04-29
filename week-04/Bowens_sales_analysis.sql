SELECT *
FROM management
-- id 3, Northeast Region, RD Michael Jarvis, Maryland, Shruti Reddy
 
 -- Total revenue overall for sales in Maryland
 -- $12,872,115.72 overall revenue in Maryland from 2022-01-01 - 2025-12-31
 SELECT SUM(SalesTotal) AS O_Maryland_Sales
 FROM online_sales
 WHERE ShiptoState = 'Maryland'
	-- $1,420,500.63 Online Sales to Maryland
 SELECT Transaction_Date, Sale_Amount
 FROM store_sales
 WHERE Store_ID BETWEEN '731' AND '739'
 ORDER BY Transaction_Date DESC
	-- 2022-01-01 - 2025-12-31
 -- Store Sales
 SELECT SUM(Sale_Amount) AS Maryland_Sales
 FROM store_sales
 WHERE Store_ID BETWEEN '731' AND '739'
 -- $11,451,615.09
 SELECT *
 FROM store_locations
 WHERE State LIKE '%Maryland%'
 -- 731-739 Maryland store ids
 SELECT SUM(Sale_Amount) 
 
-- What is the month by month revenue breakdown for the sales territory?

SELECT *
FROM online_sales
WHERE ShiptoState = 'Maryland'
ORDER BY Date ASC
