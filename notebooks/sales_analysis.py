# sales_analysis.py (or notebook cells)
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# 1. Load
sales = pd.read_csv('data/store_sales_sample.csv', parse_dates=['OrderDate'])
products = pd.read_csv('data/products.csv')

# 2. Data cleaning basics
sales['Quantity'] = sales['Quantity'].astype(int)
sales['UnitPrice'] = sales['UnitPrice'].astype(float)
sales['Sales'] = sales['Sales'].astype(float)
sales['Profit'] = sales['Profit'].astype(float)

# 3. Feature engineering
sales['YearMonth'] = sales['OrderDate'].dt.to_period('M').astype(str)
sales['Month'] = sales['OrderDate'].dt.month_name()

# 4. KPIs
total_sales = sales['Sales'].sum()
total_profit = sales['Profit'].sum()
total_orders = sales['OrderID'].nunique()

print(f'Total Sales: {total_sales}, Total Profit: {total_profit}, Orders: {total_orders}')

# 5. Monthly trend
monthly = sales.groupby('YearMonth').agg({'Sales':'sum','Profit':'sum'}).reset_index()
monthly.plot(x='YearMonth', y='Sales', marker='o', figsize=(10,4))
plt.title('Monthly Sales Trend')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# 6. Top products
top_products = (sales.groupby('ProductName')['Sales'].sum()
                       .sort_values(ascending=False).reset_index())
print(top_products.head(10))
