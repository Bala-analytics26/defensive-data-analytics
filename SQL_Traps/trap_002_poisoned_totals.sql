-- TRAP 002: The Poisoned Total Vulnerability
-- Symptom: Mathematical operations against NULL columns turn the entire result into NULL, skewing sales volume metrics.

-- ❌ THE VULNERABILITY (Drops revenue calculation on free/promo items)
SELECT Category, SUM(Price * Quantity) AS TotalSales FROM Products GROUP BY Category;

-- ✅ THE REMEDIATION (Converts NULL to 0 mid-flight to preserve aggregation integrity)
SELECT Category, SUM(ISNULL(Price, 0) * Quantity) AS TotalSales FROM Products GROUP BY Category;
