### 🛡️ Defensive Data Analytics Playbook

Welcome to my active defense data registry. While most standard development focus centers purely on executing syntax, this repository focuses entirely on **data integrity, risk mitigation, and defensive engineering** within SQL Server (T-SQL) and Microsoft Excel.

### 🎯 The Philosophy

A query that executes without errors can still be dangerously wrong. Silent bugs—such as data type mismatches, data truncation, and unhandled `NULL` values—corrupt executive dashboards and skew critical business metrics. This repository serves as my professional playbook for hunting, isolating, and patching these invisible data leaks.

* * *

### 🛠️ Core Competencies & Core Engine

*   **SQL Server Architecture:** Advanced relational joins, dynamic CTE filters, `NULL` logic processing, and transactional validation.
*   **Excel Engineering:** Data type normalization, robust conditional logic, and bulletproof lookup structures.

* * *

### 🗂️ Active Traps Index

### 🪤 Trap 001: The Ghost Match & Date Type Mismatch

*   **The Vulnerability:** Using equality operators on nullable fields drops transactional rows silently.
*   **The Excel Correlation:** Text-to-Serial date type mismatches trigger standard `#N/A` errors on visible matches.
*   **The Remediation:** Explicit `IS NULL` isolation and `DATEVALUE()` data type casting.
