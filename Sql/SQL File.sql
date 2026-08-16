select * from customers;


-- 1. Customer Churn Rate

SELECT 
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS total_churn_customer,
    COUNT(*) AS total_customer,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS customer_churn_rate
FROM
    customers;

    
-- 2. Churn Rate by contract type

SELECT 
    Contract,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS total_churn_customer,
    COUNT(*) AS total_customer,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS customer_churn_rate
FROM
    customers
GROUP BY Contract
ORDER BY customer_churn_rate DESC;


-- 3. Churn Rate by tenure bucket

SELECT 
    CASE
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure > 6 AND tenure <= 12 THEN '6-12 months'
        WHEN tenure > 12 AND tenure <= 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_bucket,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS total_churn_customer,
    COUNT(*) AS total_customer,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS customer_churn_rate
FROM
    customers
GROUP BY tenure_bucket
ORDER BY customer_churn_rate DESC;


-- 4. Churn Rate by Payment Method;

SELECT 
    paymentmethod AS Payment_Method,
    COUNT(*) AS total_customers,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS Customer_Churn_Rate
FROM
    customers
GROUP BY paymentmethod
ORDER BY Customer_Churn_Rate DESC;


-- 5. Customer Churn Rate by Internet Service Type

SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS Customer_Churn_Rate
FROM
    customers
GROUP BY InternetService
ORDER BY Customer_Churn_Rate DESC;


-- 6. Monthly Revenue Lost to Churn Customers

SELECT 
    ROUND(SUM(MonthlyCharges), 2) AS Monthly_Revenue_lost
FROM
    customers
WHERE
    Churn = 'Yes';
    
    
-- 7. Average Tenure (Churn vs Retained)

SELECT 
    Churn, ROUND(AVG(tenure), 1) AS Avg_Tenure
FROM
    customers
GROUP BY Churn;


-- 8. Churn by tech support / online security (add-on services)

SELECT TechSupport,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM customers
GROUP BY TechSupport;