### TRAP 3: THE JOIN FILTER TRAP & INVISIBLE ROWS

### \================================================================================  
PART 1: SQL SERVER TRAP (The Disappearing Act)

\-- Symptom: Placing right-hand table filters in the WHERE clause silently forces a LEFT JOIN to behave like an INNER JOIN. 

\-- ❌ THE VULNERABILITY (Drops customers who didn't place an order)  
SELECT C.CustomerID, C.CustomerName, O.OrderID, O.OrderDate  
FROM Customers C  
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID  
WHERE O.OrderDate >= '2026-06-01'; 

\-- ✅ THE REMEDIATION (Filter inside the ON clause to keep all customer rows intact)  
SELECT C.CustomerID, C.CustomerName, O.OrderID, O.OrderDate  
FROM Customers C  
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID AND O.OrderDate >= '2026-06-01'; 

### \================================================================================  
PART 2: EXCEL TRAP (The Invisible Rows)

\-- Symptom: Standard aggregations calculate hidden or filtered out data, creating massive metric inflation on dashboards. 

\-- ❌ THE VULNERABILITY (Calculates hidden categories in the background when filters are active)  
\=AGGREGATE(9, 6, B2:B5000) 

\-- ✅ THE REMEDIATION (Code 7 instructs Excel to ignore BOTH filtered-out hidden rows and formula errors)  
\=AGGREGATE(9, 7, B2:B5000)
