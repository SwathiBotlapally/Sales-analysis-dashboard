-- Total sales by month
SELECT DATE_TRUNC('month', OrderDate) AS month,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit,
       COUNT(DISTINCT OrderID) AS orders
FROM sales
GROUP BY 1
ORDER BY 1;

-- Top 10 products by sales
SELECT p.ProductID, p.ProductName, p.Category, SUM(s.Sales) as sales
FROM sales s
JOIN products p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category
ORDER BY sales DESC
LIMIT 10;

-- Sales by region
SELECT st.StoreRegion, SUM(s.Sales) as sales, SUM(s.Profit) as profit
FROM sales s
JOIN stores st ON s.StoreID = st.StoreID
GROUP BY st.StoreRegion
ORDER BY sales DESC;
