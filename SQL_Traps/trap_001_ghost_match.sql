-- TRAP 001: The Ghost Match
-- Symptom: COALESCE drops NULL rows silently when paired with an equals sign.

-- ❌ THE VULNERABILITY
SELECT * FROM Orders O WHERE O.OrderDate = COALESCE(O.OrderDate, '2026-05-10');

-- ✅ THE REMEDIATION (The Defensive Fix)
SELECT * FROM Orders O WHERE O.OrderDate = '2026-05-10' OR O.OrderDate IS NULL;
