-- num of rows--
select count(*) as total_rows
from [Telco-Customer-Churn_Analysis] ;

--check data types and coloumns--

SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Telco-Customer-Churn_Analysis';

---- sample data----
select top 10 *
from [Telco-Customer-Churn_Analysis];

--data quality check---
select customerID , count(*) as count_rows
from [Telco-Customer-Churn_Analysis]
group by customerID
having count(*) < 1;

--- null values---

SELECT COUNT(*) AS BlankTotalCharges
FROM [Telco-Customer-Churn_Analysis]
WHERE TotalCharges IS NULL
   OR LTRIM(RTRIM(TotalCharges)) = '';

   SELECT *
FROM [Telco-Customer-Churn_Analysis]
WHERE TotalCharges IS NULL
   OR LTRIM(RTRIM(TotalCharges)) = '';

--they are new new customer so we cant blindly delete that rows so we will replace with 0--

   UPDATE [Telco-Customer-Churn_Analysis]
SET TotalCharges = 0
WHERE TotalCharges IS NULL
  AND Tenure = 0;

   --QA analysis---

SELECT DISTINCT Gender
FROM [Telco-Customer-Churn_Analysis];

SELECT DISTINCT Contract
FROM [Telco-Customer-Churn_Analysis];

SELECT DISTINCT Churn
FROM [Telco-Customer-Churn_Analysis];

SELECT DISTINCT InternetService
FROM [Telco-Customer-Churn_Analysis];

SELECT DISTINCT PaymentMethod
FROM [Telco-Customer-Churn_Analysis];

SELECT
    MIN(Tenure) AS MinTenure,
    MAX(Tenure) AS MaxTenure,
    MIN(MonthlyCharges) AS MinMonthlyCharges,
    MAX(MonthlyCharges) AS MaxMonthlyCharges,
    MIN(TotalCharges) AS MinTotalCharges,
    MAX(TotalCharges) AS MaxTotalCharges
FROM [Telco-Customer-Churn_Analysis];

SELECT Churn, COUNT(*) AS Customers
FROM [Telco-Customer-Churn_Analysis]
GROUP BY Churn;

SELECT TOP 20
    CustomerID,
    Tenure,
    MonthlyCharges,
    TotalCharges,
    (MonthlyCharges * Tenure) AS ExpectedCharges
FROM [Telco-Customer-Churn_Analysis]
WHERE Tenure > 0;

--round the values for better understanding----
SELECT
    ROUND(MonthlyCharges, 2) AS MonthlyCharges,
    ROUND(TotalCharges, 2) AS TotalCharges
FROM [Telco-Customer-Churn_Analysis];

SELECT *
FROM [Telco-Customer-Churn_Analysis];
