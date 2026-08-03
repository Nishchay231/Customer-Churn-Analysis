# Telco Customer Churn Analysis

## Business Problem

A subscription-based telecom company was losing customers at a significant rate but had no structured way to answer three critical questions:
- How many customers are actually churning, and is it a minor issue or a major one?
- Who is churning — are certain contract types, tenure stages, or payment methods disproportionately at risk?
- How much revenue is this costing, in real dollar terms leadership can act on?

Without this visibility, retention efforts (if any) were generic rather than targeted at the customers most likely to leave.

## Dataset

[Telco Customer Churn dataset (Kaggle/IBM)](https://www.kaggle.com/datasets/blastchar/telco-customer-churn) — 7,043 customer records with demographics, account information, subscribed services, and churn status.

## Tools Used

- **SQL (MySQL)** — data querying and core business metrics
- **Python (pandas, matplotlib, seaborn)** — exploratory data analysis and distribution checks
- **Power BI** — interactive dashboard for stakeholder self-service reporting

## Approach

### 1. SQL — Core Metrics
Queried the cleaned dataset (7,032 valid rows after removing blank `TotalCharges` entries) to calculate:
- Overall churn rate
- Churn rate by contract type, tenure bucket, payment method, and internet service type
- Revenue lost to churned customers

### 2. Python — Exploratory Analysis
Used pandas for data cleaning (`TotalCharges` type conversion, null handling) and matplotlib/seaborn for:
- Tenure distribution split by churn status
- Monthly charges distribution (box plot) by churn status
- Churn rate by number of add-on services subscribed — a finding not surfaced by the SQL analysis

### 3. Power BI — Dashboard
Built a 2-page interactive dashboard:
- **Page 1 (Overview):** KPI cards (Total Customers, Churn Rate %, Revenue Lost Monthly, Annualized Risk) plus churn-rate breakdowns by contract, tenure, payment method, tech support, and internet service
- **Page 2 (Risk Segments):** Revenue-at-risk table combining contract + payment + tenure, monthly charges distribution, and the add-on services churn pattern

## Key Findings

| Finding | Detail |
|---|---|
| Overall churn rate | 26.58% (1,869 of 7,032 customers) |
| Contract type impact | Month-to-month customers churn at 42.71% vs. 2.85% for two-year contracts (~15x higher) |
| Tenure impact | First 6 months: 53.33% churn vs. 14.04% for 24+ month customers |
| Payment method impact | Electronic check users churn at 45.29% vs. ~15–19% for automatic payment methods |
| Revenue impact | $139,130.85/month lost to churn (~$1.67M annualized) |
| Tech support impact | No tech support: 41.65% churn vs. 15.20% with tech support |
| Add-on services (Python finding) | Churn peaks at exactly 1 add-on service (45.76%) and drops to 5.28% at 6 add-ons |

## Business Impact

- **Quantified the problem in dollar terms:** converted a vague "we're losing customers" concern into a board-level figure — $1.67M in annual revenue at risk.
- **Identified where ~85% of revenue risk is concentrated:** month-to-month contract holders account for roughly $118,400 of the $139,130.85 monthly revenue lost, meaning retention spend can be targeted at ~3,875 customers instead of the full base of 7,032.
- **Enabled proactive timing:** since churn is heavily front-loaded (53.33% in months 0–6), retention outreach can be scheduled specifically for new customers rather than applied uniformly across all tenures.
- **Surfaced a low-cost intervention lever:** tech support adoption nearly cuts churn in half (41.65% → 15.20%), suggesting a low-cost bundling opportunity at signup.
- **Delivered a self-serve reporting tool:** the Power BI dashboard lets stakeholders filter and explore churn by segment on their own, removing the need for repeated ad-hoc analysis requests.

## Recommendations

1. Offer a contract-upgrade incentive (e.g., discount for switching month-to-month → 1-year), targeted at customers in their first 6 months — the highest-risk window.
2. Encourage electronic-check users toward autopay methods (bank transfer/credit card), where churn is roughly 3x lower.
3. Bundle free or discounted tech support for new sign-ups, given its strong association with reduced churn.
4. Promote 3+ service bundles rather than single add-on upsells, since customers with only 1 add-on churn at nearly 9x the rate of those with all 6.

## Repository Structure

```
/sql        - churn analysis queries
/notebook   - Python EDA notebook
/dashboard  - Power BI file and screenshots
README.md   - project overview (this file)
```

## Author

Nishchay Patel — [LinkedIn](#) | [GitHub](#)
