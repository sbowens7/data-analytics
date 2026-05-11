-- MD vs Northeast Summary
SELECT 
    CASE 
        WHEN sl.State = 'Maryland' THEN 'Maryland'
        ELSE 'Rest of Northeast'
    END AS Area,
    COUNT(*) AS transactions,
    ROUND(SUM(ss.Sale_Amount), 2) AS total_sales,
    ROUND(AVG(ss.Sale_Amount), 2) AS avg_sale,
    COUNT(DISTINCT ss.Store_ID) AS active_stores
FROM Store_Sales ss
JOIN Store_Locations sl ON ss.Store_ID = sl.StoreId
JOIN Management m ON sl.State = m.State
WHERE m.Region = 'Northeast'
GROUP BY Area
ORDER BY total_sales DESC;
select * from inventory_categories
