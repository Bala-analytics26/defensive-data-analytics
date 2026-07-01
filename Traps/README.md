### 🛡️ Defensive Data Analytics Playbook

Welcome to my active defense data registry. While standard data focus centers purely on writing functional code, this repository targets **data integrity, risk mitigation, and defensive engineering** within SQL Server (T-SQL) and Microsoft Excel.

### 🎯 The Philosophy

A query or formula that executes without throwing error messages can still be dangerously wrong. Silent traps—such as unhandled `NULL` values, data type mismatches, and hidden filtration artifacts—silently corrupt dashboards and skew critical corporate metrics. This playbook tracks my live inventory of discovered data traps and structural patches.

* * *

### 🛠️ Core Competencies

*   **Defensive Database Engineering:** Advanced join mechanics, logical `NULL` processing, dynamic aggregation isolation, and structural query optimization.
*   **Excel Data Integrity:** Data type casting, resilient formula architecture, and hidden filtration overrides.

* * *

### 🗂️ Active Defensive Registry

### 🪤 Trap 1: The Ghost Match & Date Type Mismatch

*   **SQL Vulnerability:** Evaluating `NULL` records with equality operators (`=`) silently drops transactional records from production views.
*   **Excel Correlation:** Data type mismatches (Text strings vs. true numeric Date Serial Numbers) trigger false `#N/A` breaks on visible lookups.
*   **Structural Patch:** Explicitly isolate missing attributes with `IS NULL` filters and cast text structures with `=DATEVALUE()`.

***

### 🪤 Trap 2: The Poisoned Total & The Broken Chain

*   **SQL Vulnerability:** Running standard math operations against columns containing `NULL` spaces converts the entire result to `NULL`, skewing transactional volumes.
*   **Excel Correlation:** Standard `=SUM` arrays collapse completely and return an overarching `#VALUE!` error if a single cell in the range contains a text typo.
*   **Structural Patch:** Leverage mid-flight `ISNULL(Column, 0)` replacements and implement robust `=AGGREGATE(9, 6, Range)` error skips.

***

### 🪤 Trap 3: The Join Filter Trap & Invisible Rows

*   **SQL Vulnerability:** Placing filtration criteria for the right-hand table inside a `WHERE` clause silently strips out rows, forcing a `LEFT JOIN` to execute as an `INNER JOIN`.
*   **Excel Correlation:** Standard filters mask rows visually, but backend calculation tools like `=AGGREGATE(code 6)` continue counting hidden data, inflating dashboard results.
*   **Structural Patch:** Shift right-hand constraints entirely into the initial `ON` match clause, and switch Excel engines to `=AGGREGATE(9, 7, Range)` to ignore hidden rows.

***

### 🪤 Trap 4: The Imposter Top Performers & Broken Selection

*   **SQL Vulnerability:** Sorting by a raw column attribute instead of its aggregated counterpart ranks records by single transaction values instead of cumulative totals.
*   **Excel Correlation:** Sorting a single column near blank row or column boundaries breaks the selection array, scrambling data values away from their correct rows.
*   **Structural Patch:** Pass explicit `SUM()` parameters into the `ORDER BY` clause, and instantiate structural tables via `Ctrl + T` to permanently bind Excel data columns.

* * *

### 🪤 Trap 5: The Aggregation Horizon Collapse

*   **SQL Vulnerability**: Attempting to pass group aggregation expressions like `SUM()`, `COUNT()`, or `AVG()` directly inside a standard row-level `WHERE` clause crashes the engine, because raw transaction records are filtered sequentially before any mathematical summary buckets exist. 
*   **Excel Correlation**: Nesting secondary summary formulas like `SUM()` or `AVERAGE()` inside the criteria parameters of `=SUMIFS()` or `=COUNTIFS()` triggers a functional collapse, returning a `#VALUE!` error because the engine cannot compute a group-level matrix while executing a raw row-level filter. 
*   **Structural Patch**: Pivot single-layer group queries to use a `HAVING` clause entirely, or deploy a robust Stacking CTE Layer (SQL) / Table Helper Column (Excel) to fully calculate and isolate metrics before referencing them inside outer execution criteria.

***

