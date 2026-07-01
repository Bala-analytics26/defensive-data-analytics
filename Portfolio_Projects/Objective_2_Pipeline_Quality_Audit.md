-- ================================================================================
-- PORTFOLIO PROJECT: OBJECTIVE 2 - DATA PIPELINE INTEGRITY & QUALITY AUDIT
-- TARGET: Track missing chronological anchors to map structural data entry corruption.
-- STRUCTURAL LOCKS: Text Extractions, Case Flags, Integer Division Traps Evaded
-- ================================================================================

WITH CleanedPipeline AS (
    -- Step 1: Isolate chronological blocks and translate structural NULL values to safe binary flags
    SELECT 
        Order_Date, 
        CASE 
            WHEN Order_Date IS NULL THEN 'Unknown Year' 
            ELSE CAST(YEAR(Order_Date) AS VARCHAR(10)) 
        END AS Calendar_Year,
        CASE 
            WHEN Order_Date IS NULL THEN 1 
            ELSE 0 
        END AS Missing_Date_Flag 
    FROM dbo.Orders
)

-- Step 2: Sum operational binary flags and execute floating-point division timelines
SELECT 
    Calendar_Year, 
    COUNT(*) AS Total_Orders, 
    SUM(Missing_Date_Flag) AS Corrupted_Orders_Count, 
    
    -- Disarming Integer Division: Multiplying by 100.0 forces float evaluation
    CAST((SUM(Missing_Date_Flag) * 100.0 / COUNT(*)) AS DECIMAL(5,2)) AS Data_Corruption_Percentage 

FROM CleanedPipeline 
GROUP BY Calendar_Year
ORDER BY Calendar_Year ASC;
