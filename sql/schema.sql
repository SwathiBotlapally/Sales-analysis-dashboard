-- schema.sql
CREATE TABLE stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    StoreRegion VARCHAR(50)
);

CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(200),
    Category VARCHAR(100)
);

CREATE TABLE sales (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    StoreID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Cost DECIMAL(10,2),
    Sales DECIMAL(10,2),
    Profit DECIMAL(10,2),
    FOREIGN KEY (StoreID) REFERENCES stores(StoreID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);
