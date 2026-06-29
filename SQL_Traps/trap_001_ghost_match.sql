-- TRAP 001: 
-- SQL - The Ghost Match
-- Symptom: COALESCE drops NULL rows silently when paired with an equals sign.

-- ❌ THE VULNERABILITY
SELECT * FROM Orders O WHERE O.OrderDate = COALESCE(O.OrderDate, '2026-05-10');

-- ✅ THE REMEDIATION (The Defensive Fix)
SELECT * FROM Orders O WHERE O.OrderDate = '2026-05-10' OR O.OrderDate IS NULL;


-- EXCEL - The Visual Mask Vulnerability (Excel)
-- Symptom: VLOOKUP formulas return false #N/A errors on matching dates due to underlying data type conflicts.

-- ❌ THE VULNERABILITY (Fails to match because the reference cell is stored as a literal text string instead of a number)
=VLOOKUP(C2, 'HolidayCalendar'!A:B, 2, FALSE)

-- ✅ THE REMEDIATION (Converts the text string into a true numeric serial date background value before execution)
=VLOOKUP(DATEVALUE(C2), 'HolidayCalendar'!A:B, 2, FALSE)
