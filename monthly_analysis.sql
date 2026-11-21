USE sales_analysis;

SELECT
    MONTH(Date) AS month_number,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM retail_sales_clean
WHERE Date IS NOT NULL
GROUP BY month_number
ORDER BY month_number;

WITH monthly_sales AS (
    SELECT
        MONTH(Date) AS month_number,
        SUM(Sales) AS total_sales
    FROM retail_sales_clean
    WHERE Date IS NOT NULL
    GROUP BY MONTH(Date)
),
sales_with_previous AS (
    SELECT
        month_number,
        total_sales,
        LAG(total_sales) OVER (ORDER BY month_number) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    month_number,
    total_sales,
    previous_month_sales,
    ROUND((total_sales - previous_month_sales)/ previous_month_sales * 100,2) AS month_growth_rate
FROM sales_with_previous
ORDER BY month_number;

SELECT
    MONTH(Date) AS month_number,
    SUM(SUM(Sales)) OVER (
        ORDER BY MONTH(Date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM retail_sales_clean
WHERE Date IS NOT NULL
GROUP BY month_number
ORDER BY month_number;