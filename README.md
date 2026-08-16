# Telco Customer Churn Analysis

An end-to-end churn analysis project built on the Telco Customer Churn dataset, combining SQL for core metrics, Python for exploratory analysis, and an interactive two-page Power BI dashboard for stakeholder reporting.

## Business Problem

A subscription-based telecom company was losing customers with no structured way to answer:
- How many customers are churning, and how severe is the problem?
- Which customer segments (contract type, tenure, payment method, services subscribed) are highest-risk?
- How much revenue is this actually costing, in terms leadership can act on?

## Dataset

[Telco Customer Churn — Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn/data)
7,043 customer records (7,032 after cleaning) with demographics, account details, subscribed services, billing information, and churn status.

## Tools Used

- **SQL (MySQL)** — core churn metrics and revenue calculations
- **Python (pandas, matplotlib, seaborn)** — data cleaning and exploratory analysis
- **Power BI** — two-page interactive dashboard

## Dashboard

### Page 1 — Overview
- **KPI cards:** Total Customers (7,032), Revenue Lost Monthly (₹139.13K), Churn Rate % (26.58%), Annualized Risk (₹1.67M)
- **Insight callout:** Month-to-month contracts churn 15x higher than 2-year contracts (42.71% vs. 2.85%) — the single biggest churn driver
- **Churn % by Tech Support, Multiple Lines, Paperless Billing, and Gender** — donut breakdowns by service and demographic attributes
- **Tenure Bucket, Contract Type, Payment Type, and Internet Service** — bar-chart breakdowns of the core churn drivers
- **Filters (synced across both pages):** Partner, Senior Citizen

### Page 2 — Risk Segments & Revenue Impact
- **Churned Customers card:** 1,869 total, 26.58% churn rate
- **Insight callout:** Month-to-month, first-6-month customers paying by electronic check represent the highest-risk segment — together driving the majority of the ₹1.67M annual revenue at risk
- **Churn by Payment Method** — combo chart of churn rate % against total monthly charges per payment type
- **Customers by Type of Contract** — combo chart of churn rate % against total customers per contract
- **Revenue Lost Monthly by Tenure** — customer count and revenue-lost trend across tenure buckets
- **Churn Rate % by Add-on Count** — churn rate across number of subscribed add-on services (0–6)
- **Churn by Internet Service** and **Monthly Charges by Internet Service** — churn rate and revenue split across Fiber, DSL, and No internet service
- **Top Revenue at Risk** (Matrix) — Contract → Payment Method drill-down ranked by revenue lost, isolating the highest-impact segments
- **Filter:** Tenure range slider (1–72 months)

## Key Findings

| Finding | Detail |
|---|---|
| Overall churn rate | 26.58% (1,869 of 7,032 customers) |
| Contract type impact | Month-to-month customers churn at 42.71% vs. 2.85% for two-year contracts (~15x higher) |
| Tenure impact | 0–6 month customers churn at 53.33% vs. 14.04% for 24+ month customers |
| Payment method impact | Electronic check users churn at 45.29% vs. 15.25–19.20% for other payment methods |
| Tech support impact | No tech support: 31.23% churn vs. 15.20% with tech support |
| Internet service impact | Fiber optic customers churn at 41.89% vs. 19.00% for DSL and 7.43% for no internet service |
| Add-on services (Python + Power BI finding) | Churn peaks at exactly 1 add-on service (45.76%) and drops steadily to 5.28% at 6 add-ons |
| Revenue by internet service | Fiber optic customers account for the largest share of monthly billing (₹283.3K), vs. ₹140.3K for DSL and ₹32.0K for no internet |
| Highest revenue-at-risk segment | Month-to-month + Electronic check customers alone account for ₹77,315.60 of the ₹1,20,847.10 lost from all month-to-month customers |
| Revenue impact | ₹1,39,130.85 lost per month (~₹1.67M annualized) to churned customers |

## Business Impact

- **Quantified the problem in financial terms:** converted "we're losing customers" into a concrete ₹1.67M annual revenue-at-risk figure — the kind of number that gets a retention budget approved.
- **Identified where risk concentrates:** the Top Revenue at Risk table shows month-to-month contracts alone account for ₹1,20,847.10 of the ₹1,39,130.85 total monthly loss (~87%), with electronic-check payers within that group representing the single largest sub-segment (₹77,315.60) — meaning retention spend can be targeted at a specific, identifiable group rather than applied uniformly across all 7,032 customers.
- **Surfaced a low-cost intervention lever:** tech support adoption roughly halves churn (31.23% → 15.20%), pointing to a cheap bundling opportunity at signup.
- **Uncovered a non-obvious cross-sell insight:** churn is highest at exactly 1 add-on service and falls steadily as customers adopt more — suggesting bundled service packages, not single upsells, reduce churn risk more effectively.
- **Delivered a self-serve reporting tool:** stakeholders can filter by tenure, partner status, and senior citizen status — synced across both pages — to explore churn drivers without requesting a new ad-hoc report each time.

## Recommendations

1. Offer a contract-upgrade incentive targeted at month-to-month, electronic-check customers in their first 6 months — the single highest-risk, highest-revenue-impact segment identified in the Top Revenue at Risk table.
2. Encourage electronic-check users toward automatic payment methods, where churn is roughly 2.5–3x lower.
3. Bundle tech support and multi-service packages (3+ add-ons) into new sign-ups rather than offering single add-ons individually.
4. Investigate fiber optic service quality or pricing, given its churn rate is more than double that of DSL despite generating the highest revenue share.


## Author

Nishchay Patel — [LinkedIn](https://www.linkedin.com/in/nishchaypatel231) | [GitHub](https://github.com/Nishchay231)
