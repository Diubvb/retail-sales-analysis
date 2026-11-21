USE sales_analysis;

SELECT
    COUNT(*) AS total_records,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin,
    ROUND(AVG(Sales), 2) AS avg_sales_per_record,
    ROUND(AVG(Profit), 2) AS avg_profit_per_record
FROM retail_sales_clean;