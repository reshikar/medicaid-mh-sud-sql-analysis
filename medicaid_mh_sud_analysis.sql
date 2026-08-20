-- Medicaid & CHIP Mental Health and SUD Analysis
-- 2020-2022
-- SQLite / DBeaver

-- =========================================================
-- 1. Check the table and data
-- =========================================================

PRAGMA table_info(medicaid_mh_sud_services);

SELECT *
FROM medicaid_mh_sud_services
LIMIT 10;


-- =========================================================
-- 2. Clean enrollment count fields
-- Remove commas so the values can be used numerically.
-- =========================================================

UPDATE medicaid_mh_sud_services
SET
    "Count of enrollees" =
        REPLACE("Count of enrollees", ',', ''),
    "Denominator count of enrollees" =
        REPLACE("Denominator count of enrollees", ',', '');


-- =========================================================
-- 3. Explore the data
-- =========================================================

SELECT DISTINCT
    Year,
    Category
FROM medicaid_mh_sud_services
ORDER BY Year, Category;

SELECT DISTINCT
    "Subpopulation topic"
FROM medicaid_mh_sud_services
ORDER BY "Subpopulation topic";


-- =========================================================
-- 4. Overall utilization by year
-- Using Total enrollees avoids adding overlapping
-- demographic groups together.
-- =========================================================

SELECT
    Year,
    Category,
    "Count of enrollees",
    "Denominator count of enrollees",
    "Percentage of enrollees"
FROM medicaid_mh_sud_services
WHERE "Subpopulation topic" = 'Total enrollees'
ORDER BY Year, Category;


-- =========================================================
-- 5. Change in overall utilization: 2020 vs 2022
-- =========================================================

SELECT
    Category,

    MAX(CASE
        WHEN Year = 2020
        THEN "Percentage of enrollees"
    END) AS pct_2020,

    MAX(CASE
        WHEN Year = 2022
        THEN "Percentage of enrollees"
    END) AS pct_2022,

    ROUND(
        MAX(CASE
            WHEN Year = 2022
            THEN "Percentage of enrollees"
        END)
        -
        MAX(CASE
            WHEN Year = 2020
            THEN "Percentage of enrollees"
        END),
        1
    ) AS change_pp

FROM medicaid_mh_sud_services
WHERE "Subpopulation topic" = 'Total enrollees'
GROUP BY Category
ORDER BY Category;


-- =========================================================
-- 6. Mental health utilization by subgroup in 2022
-- =========================================================

SELECT
    "Subpopulation topic",
    Subpopulation,
    "Percentage of enrollees",

    RANK() OVER (
        PARTITION BY "Subpopulation topic"
        ORDER BY "Percentage of enrollees" DESC
    ) AS utilization_rank

FROM medicaid_mh_sud_services
WHERE Year = 2022
  AND Category = 'Received MH services'
  AND "Subpopulation topic" <> 'Total enrollees'
ORDER BY
    "Subpopulation topic",
    utilization_rank;


-- =========================================================
-- 7. Change in mental health utilization by subgroup
-- =========================================================

SELECT
    "Subpopulation topic",
    Subpopulation,

    MAX(CASE
        WHEN Year = 2020
        THEN "Percentage of enrollees"
    END) AS pct_2020,

    MAX(CASE
        WHEN Year = 2022
        THEN "Percentage of enrollees"
    END) AS pct_2022,

    ROUND(
        MAX(CASE
            WHEN Year = 2022
            THEN "Percentage of enrollees"
        END)
        -
        MAX(CASE
            WHEN Year = 2020
            THEN "Percentage of enrollees"
        END),
        1
    ) AS change_pp

FROM medicaid_mh_sud_services
WHERE Category = 'Received MH services'
  AND "Subpopulation topic" <> 'Total enrollees'
GROUP BY
    "Subpopulation topic",
    Subpopulation
ORDER BY change_pp DESC;


-- =========================================================
-- 8. Substance use disorder utilization by subgroup in 2022
-- =========================================================

SELECT
    "Subpopulation topic",
    Subpopulation,
    "Percentage of enrollees",

    RANK() OVER (
        PARTITION BY "Subpopulation topic"
        ORDER BY "Percentage of enrollees" DESC
    ) AS utilization_rank

FROM medicaid_mh_sud_services
WHERE Year = 2022
  AND Category = 'Received SUD services'
  AND "Subpopulation topic" <> 'Total enrollees'
ORDER BY
    "Subpopulation topic",
    utilization_rank;


-- =========================================================
-- 9. Change in SUD utilization by subgroup
-- =========================================================

SELECT
    "Subpopulation topic",
    Subpopulation,

    MAX(CASE
        WHEN Year = 2020
        THEN "Percentage of enrollees"
    END) AS pct_2020,

    MAX(CASE
        WHEN Year = 2022
        THEN "Percentage of enrollees"
    END) AS pct_2022,

    ROUND(
        MAX(CASE
            WHEN Year = 2022
            THEN "Percentage of enrollees"
        END)
        -
        MAX(CASE
            WHEN Year = 2020
            THEN "Percentage of enrollees"
        END),
        1
    ) AS change_pp

FROM medicaid_mh_sud_services
WHERE Category = 'Received SUD services'
  AND "Subpopulation topic" <> 'Total enrollees'
GROUP BY
    "Subpopulation topic",
    Subpopulation
ORDER BY change_pp DESC;


-- =========================================================
-- 10. Data used for the overall trend chart
-- =========================================================

SELECT
    Year,
    Category,
    "Percentage of enrollees"
FROM medicaid_mh_sud_services
WHERE "Subpopulation topic" = 'Total enrollees'
ORDER BY Year, Category;
