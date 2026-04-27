--  1. Create a single query to list the product id, product name, unit price and category
-- name of all products. Order by category name and within that, by product name.
SELECT ProductID, ProductName, UnitPrice, CategoryName
FROM products
INNER JOIN categories ON categories.CategoryID = products.CategoryID
ORDER BY CategoryName ASC,
	ProductName ASC
    
-- 2. Create a single query to list the product id, product name, unit price and supplier
-- name of all products that cost more than $75. Order by product name.

 SELECT ProductID, ProductName, UnitPrice, CompanyName AS Supplier
 FROM products
 INNER JOIN suppliers
 ON products.SupplierID = suppliers.SupplierID
 WHERE UnitPrice > 75
 ORDER BY ProductName ASC

-- 3. Create a single query to list the product id, product name, unit price, category name,
-- and supplier name of every product. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName AS Supplier_Name
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
INNER JOIN suppliers ON products.SupplierID = suppliers.SupplierID
ORDER BY ProductName ASC

-- 4. Create a single query to list the order id, ship name, ship address, and shipping
-- company name of every order that shipped to Germany. Assign the shipping company
-- name the alias ‘Shipper.’ Order by the name of the shipper, then the name of who it
-- shipped to.


-- 5. Start from the same query as above (#4), but omit OrderID and add logic to group by
-- ship name, with a count of how many orders were shipped for that ship name.


-- 6. Create a single query to list the order id, order date, ship name, ship address of all
-- orders that included Sasquatch Ale. Hint: You will need to join on three tables to accomplish this. (One of these tables
-- has a sneaky space in the name, so you will need to surround it with backticks, like
-- this: `table name`)



