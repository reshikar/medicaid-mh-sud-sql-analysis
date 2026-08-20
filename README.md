# medicaid-mh-sud-sql-analysis
SQL analysis of Medicaid and CHIP mental health and substance use disorder service utilization, 2020–2022.
# Medicaid & CHIP Mental Health and Substance Use Disorder Service Utilization, 2020–2022

## Project Overview

This project uses SQL to analyze national Medicaid and CHIP mental health (MH) and substance use disorder (SUD) service utilization from 2020 through 2022.
The analysis examines overall utilization trends and differences across demographic and eligibility subgroups, including age, eligibility category, race and ethnicity, primary language, sex or gender identity, and urban/rural residence.


## Project Snapshot
- **Study period:** 2020–2022
- *Dataset size:** 217 records
- **Population:** 51.5 million Medicaid and CHIP enrollees in 2022
- **Geographic scope:** National
- **Focus:** Mental health (MH) and substance use disorder (SUD) service utilization
- **Population characteristics analyzed:** Age, eligibility, race/ethnicity, primary language, sex/gender, and urban/rural residence
- **Analysis:** Utilization trends, subgroup comparisons, and population rankings
- **Tools:** SQL, SQLite, and DBeaver

- 
## Research Questions
1. How did overall Mental Health and Substance Use Disorder service utilization change from 2020 to 2022?
2. Which population groups had the highest MH service utilization in 2022?
3. Which population groups had the highest SUD service utilization in 2022?
4. How did MH and SUD utilization change across population subgroups between 2020 and 2022?

## Tools & SQL Skills

- SQLite
- DBeaver
- Data cleaning and type handling
- `CASE WHEN`
- `GROUP BY`
- Aggregate functions
- Window functions
- `RANK() OVER (PARTITION BY ...)`
- Conditional aggregation
- Trend and subgroup analysis

## Key Findings

### Overall Trends

Overall service utilization percentages declined between 2020 and 2022:
| Service | 2020 | 2022 | Change |
|---|---:|---:|---:|
| MH or SUD services | 22.2% | 19.8% | -2.4 pp |
| MH services | 17.6% | 16.0% | -1.6 pp |
| SUD services | 8.8% | 7.3% | -1.5 pp |

Although utilization percentages declined, the number of enrollees receiving services increased as the overall enrollee denominator grew.

### Mental Health Services

In 2022:

- Disability eligibility had the highest MH utilization among eligibility categories (34.8%).
- Rural utilization was 20.0%, compared with 15.2% among urban enrollees.
- Female utilization was 18.2%, compared with 13.2% among male enrollees.
- Ages 40–64 had the highest utilization among the age groups analyzed (16.7%).

### Substance Use Disorder Services

In 2022:

- Disability eligibility had the highest SUD utilization among eligibility categories (15.3%).
- Ages 40–64 had the highest utilization among age groups (12.1%).
- American Indian and Alaska Native, non-Hispanic enrollees had the highest utilization among the race/ethnicity groups analyzed (12.8%).
- Rural utilization was 9.3%, compared with 6.9% among urban enrollees.

## Interpretation

The analysis demonstrates that changes in service utilization were not uniform across Medicaid and CHIP population groups. Differences by eligibility, age, race/ethnicity, language, sex/gender, and rurality highlight the importance of stratified analysis when evaluating behavioral health service utilization.

These findings are descriptive and should not be interpreted as evidence that demographic characteristics caused differences in service utilization.

## Repository Contents

- `medicaid_mh_sud_analysis.sql` — SQL queries used for data exploration, trend analysis, subgroup comparisons, and ranking.
- `README.md` — Project overview, methods, and key findings.


## Data Visualization

### Overall Utilization Trends


*Figure 1. National Medicaid and CHIP mental health and substance use disorder service utilization percentages, 2020–2022.*

## Next Steps

Future extensions could include data visualization, additional trend measures, and state-level analyses if geographic detail is available.
