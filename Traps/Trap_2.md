### TRAP 2: THE POISONED TOTAL & THE BROKEN CHAIN

### \================================================================================  
PART 1: SQL SERVER TRAP (The Blank Space Infection)

\-- Symptom: Mathematical operations against NULL columns turn the entire result into NULL, skewing sales volume metrics. 

\-- ❌ THE VULNERABILITY (Drops revenue calculation on free/promo items)  
SELECT Category, SUM(Price \* Quantity) AS TotalSales FROM Products GROUP BY Category; 

\-- ✅ THE REMEDIATION (Converts NULL to 0 mid-flight to preserve aggregation integrity)  
SELECT Category, SUM(ISNULL(Price, 0) \* Quantity) AS TotalSales FROM Products GROUP BY Category; 

### \================================================================================  
PART 2: EXCEL TRAP (The Broken Chain)

\-- Symptom: Standard aggregate functions break and return #VALUE! errors when hitting a single rogue text string or cell error. 

\-- ❌ THE VULNERABILITY (Grand total panics and fails if any cell in the range contains a text anomaly)  
\=SUM(B2:B6) 

\-- ✅ THE REMEDIATION (Instructs Excel to compute a sum while explicitly ignoring any background error values)  
\=AGGREGATE(9, 6, B2:B6)
