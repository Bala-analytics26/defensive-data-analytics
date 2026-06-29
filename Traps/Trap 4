### TRAP 4: THE IMPOSTER TOP PERFORMERS & BROKEN SELECTION

### \================================================================================  
PART 1: SQL SERVER TRAP (The Order By Chaos)

\-- Symptom: Query runs perfectly but returns the wrong top-tier categories/customers. 

\-- ❌ THE VULNERABILITY (Sorts by individual raw transactions instead of cumulative totals)  
SELECT TOP 5 CustomerID, SUM(TotalAmount) AS TotalSpent  
FROM Orders  
GROUP BY CustomerID  
ORDER BY TotalAmount DESC; 

\-- ✅ THE REMEDIATION (Forces sorting on the evaluated aggregate calculation)  
SELECT TOP 5 CustomerID, SUM(TotalAmount) AS TotalSpent  
FROM Orders  
GROUP BY CustomerID  
ORDER BY SUM(TotalAmount) DESC; 

### \================================================================================  
PART 2: EXCEL TRAP (The Broken Selection)

\-- Symptom: Sorting values scrambles the dataset, detaching metrics from their true entity names. 

\-- ❌ THE VULNERABILITY (Clicking a single cell to sort stops at a blank row/column boundary, scrambling data)  
\[Standard Sort Largest to Smallest on disconnected ranges\] 

\-- ✅ THE REMEDIATION (Convert the dataset into a structural table to bind rows safely)  
\[Highlight entire data array -> Press Ctrl + T to instantiate an official Excel Table\]
