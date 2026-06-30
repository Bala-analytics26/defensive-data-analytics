-- ================================================================================
-- PORTFOLIO PROJECT: OBJECTIVE 3 - BASKET DENSITY & VOLUMETRIC VELOCITY ANALYSIS
-- TARGET: Evaluate checkout density habits by summarizing transactional item volumes.
-- STRUCTURAL LOCKS: Independent Scripting, Nested CTE Aggregations, Entity Counting
-- ================================================================================

WITH sum_orders AS (
    -- Step 1: Consolidate individual fragmented row items by their unique transaction container
    SELECT 
        Order_ID, 
        SUM(Quantity) AS Total_Quantity 
    FROM dbo.Orders 
    GROUP BY Order_ID
)

-- Step 2: Label transaction slips dynamically and execute frequency distribution checks
SELECT 
    CASE 
        WHEN Total_Quantity = 1 THEN 'Single Item' 
        WHEN Total_Quantity = 2 THEN 'Dual Item'
        ELSE 'Multiple Item' 
    END AS Order_Category, 
    
    -- Functional Metric: Counting physical transaction slips, not underlying units
    COUNT(Order_ID) AS Total_Transaction_Volume 

FROM sum_orders 
GROUP BY 
    CASE 
        WHEN Total_Quantity = 1 THEN 'Single Item' 
        WHEN Total_Quantity = 2 THEN 'Dual Item'
        ELSE 'Multiple Item' 
    END
ORDER BY Total_Transaction_Volume DESC;
