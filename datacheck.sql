USE sales_analysis;

-- 零售销售数据分析项目
-- 数据表：retail_sales_clean

-- 1. 检查数据总量
SELECT COUNT(*) AS total_records
FROM retail_sales_clean;

-- 2.检查异常值和空值
SELECT
    COUNT(*) AS total_records,
    SUM(Date IS NULL) AS missing_date,
    SUM(Category IS NULL) AS missing_category,
    SUM(Sales IS NULL) AS missing_sales,
    SUM(Quantity IS NULL) AS missing_quantity,
    SUM(Profit IS NULL) AS missing_profit,
    SUM(Region IS NULL) AS missing_region
FROM retail_sales_clean;


