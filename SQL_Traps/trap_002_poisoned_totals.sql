-- TRAP 002: 
-- SQL - The Poisoned Total Vulnerability
-- Symptom: Mathematical operations against NULL columns turn the entire result into NULL, skewing sales volume metrics.

-- ❌ WRONG (Math logic breaks; returns NULL if price is blank)
SELECT Category, SUM(Price * Quantity) AS TotalSales 
FROM Products 
GROUP BY Category;

-- ✅ CORRECT (Safely substitutes NULL with 0 before multiplication occurs)
SELECT Category, SUM(ISNULL(Price, 0) * Quantity) AS TotalSales 
FROM Products 
GROUP BY Category;

-- EXCEL - The Broken Chain Vulnerability (Excel)
-- Symptom: Standard aggregate functions break and return #VALUE! errors when hitting a single rogue text string or cell error.

-- ❌ THE VULNERABILITY (Grand total panics and fails if any cell in the range contains a text anomaly)
=SUM(B2:B6)

-- ✅ THE REMEDIATION (Instructs Excel to compute a sum while explicitly ignoring any background error values)
=AGGREGATE(9, 6, B2:B6)

