-- 1. Write a query to find the price of the cheapest item that Northwind sells. Then write a
-- second query to find the name of the product that has that price.

SELECT MIN(UnitPrice) AS Cheapest_item
FROM products

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = 2.500
ORDER BY ProductName
-- Geitost

-- 2. Write a query to find the average price of all items that Northwind sells.
-- (Bonus: Once you have written a working query, try asking Claude or ChatGPT for help
-- using the ROUND function to round the average price to the nearest cent.)
SELECT Round(AVG(UnitPrice), 2) AS Average_Price
FROM products
-- 28.87

-- 3. Write a query to find the price of the most expensive item that Northwind sells. Then
-- write a second query to find the name of the product with that price, plus the name of
-- the supplier for that product.

SELECT ROUND(MAX(UnitPrice), 2) AS Expensive_item -- 263.50
FROM products

SELECT ProductName, ROUND (UnitPrice, 2)
FROM products
WHERE UnitPrice = 263.50
ORDER BY ProductName
-- Cte de Blaye

-- 4. Write a query to find total monthly payroll (the sum of all the employees’ monthly
-- salaries).


-- 5. Write a query to identify the highest salary and the lowest salary amounts which any
-- employee makes. (Just the amounts, not the specific employees!)


-- 6. Write a query to find the name and supplier ID of each supplier and the number of
-- items they supply. Hint: Join is your friend here.


-- 7. Write a query to find the list of all category names and the average price for items in
-- each category.


-- 8. Write a query to find, for all suppliers that provide at least 5 items to Northwind, what
-- is the name of each supplier and the number of items they supply.

-- 9. Write a query to list products currently in inventory by the product id, product name,
-- and inventory value (calculated by multiplying unit price by the number of units on
-- hand). Sort the results in descending order by value. If two or more have the same
-- value, order by product name. If a product is not in stock, leave it off the list.