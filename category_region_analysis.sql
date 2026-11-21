USE sales_analysis;

-- 1.品类销售情况
SELECT
    Category,
    COUNT(*) AS sales_records,
    SUM(Quantity) AS total_quantity,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM retail_sales_clean
WHERE Category IS NOT NULL
GROUP BY Category
ORDER BY total_sales DESC;

-- 2.地区销售情况
SELECT
    Region,
    COUNT(*) AS sales_records,
    SUM(Quantity) AS total_quantity,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM retail_sales_clean
WHERE Region IS NOT NULL
GROUP BY Region
ORDER BY total_sales DESC;

-- 3.地区、品类销售额情况
SELECT
    Region,
    Category,
    SUM(Sales) AS total_sales
FROM retail_sales_clean
WHERE Region IS NOT NULL
  AND Category IS NOT NULL
GROUP BY Region, Category
ORDER BY Region, total_sales DESC;

-- 4.地区、品类利润率情况
SELECT
    Region,
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM retail_sales_clean
WHERE Region IS NOT NULL
  AND Category IS NOT NULL
GROUP BY Region, Category
ORDER BY Region, profit_margin DESC;