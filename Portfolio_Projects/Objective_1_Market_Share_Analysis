-- ================================================================================
-- PORTFOLIO PROJECT: OBJECTIVE 1 - ENTERPRISE COHORT REVENUE & MARKET SHARE ANALYSIS
-- TARGET: Segment transaction value brackets and evaluate global revenue concentration.
-- STRUCTURAL LOCKS: Multi-Layered CTEs, Cross Joins, Dynamic Aggregation Ratios
-- ================================================================================

WITH OrderMetrics AS (
    -- Step 1: Compute core transaction totals by executing relational joins
    SELECT 
        o.Order_ID,
        COUNT(DISTINCT o.Product_ID) AS Total_Unique_Products,
        SUM(o.Quantity) AS Total_Units_Sold,
        SUM(p.Unit_Price * o.Quantity) AS Total_Order_Value
    FROM dbo.Orders o
    INNER JOIN dbo.Products p ON o.Product_ID = p.Product_ID
    GROUP BY o.Order_ID
),

RevenueSummary AS (
    -- Step 2: Establish a dynamic baseline of total corporate revenue
    SELECT SUM(Total_Order_Value) AS Global_Corporate_Revenue
    FROM OrderMetrics
)

-- Step 3: Instantiate strategic cohorts and calculate macro business performance ratios
SELECT 
    CASE 
        WHEN om.Total_Order_Value >= 300000 THEN '1. Mega-Wholesale Bracket (>=$300k)'
        WHEN om.Total_Order_Value >= 100000 AND om.Total_Order_Value < 300000 THEN '2. Tier-2 Bulk Purchase ($100k-$300k)'
        ELSE '3. Standard Commercial Bracket (<$100k)'
    END AS [Customer_Market_Segment],
    COUNT(om.Order_ID) AS [Total_Transaction_Count],
    SUM(om.Total_Units_Sold) AS [Total_Physical_Units_Liquidated],
    CAST(SUM(om.Total_Order_Value) AS DECIMAL(18,2)) AS [Segment_Gross_Revenue],
    
    -- High-Utility Ratio: Percentage Contribution to Total Company Revenue
    CAST((SUM(om.Total_Order_Value) / MAX(rs.Global_Corporate_Revenue)) * 100 AS DECIMAL(5,2)) AS [Percentage_Revenue_Contribution]

FROM OrderMetrics om
CROSS JOIN RevenueSummary rs
GROUP BY 
    CASE 
        WHEN om.Total_Order_Value >= 300000 THEN '1. Mega-Wholesale Bracket (>=$300k)'
        WHEN om.Total_Order_Value >= 100000 AND om.Total_Order_Value < 300000 THEN '2. Tier-2 Bulk Purchase ($100k-$300k)'
        ELSE '3. Standard Commercial Bracket (<$100k)'
    END
ORDER BY [Customer_Market_Segment] ASC;
