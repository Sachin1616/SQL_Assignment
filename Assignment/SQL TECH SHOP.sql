------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                    --TASK-1  Database Design (Normalization)
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q1.1
CREATE DATABASE TechShop;
USE TechShop;

-- Q1.2
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
); 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Q1.3
-- The Customers table is in 1NF, 2NF, and 3NF.
-- The Products table is in 1NF, 2NF, and 3NF.
-- The Orders table is in 1NF, 2NF, and 3NF.
-- The OrderDetails table is in 1NF, 2NF, and 3NF.
-- The Inventory table is in 1NF, 2NF, and 3NF.

-- Q1.4 (This task is done in MS Paints)

--Q1.5 
-- This is created in Q1.2 by default.

------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                           --TASK-2  Data Definition Language (DDL):
------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q2.1 
-- Creating Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Creating Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Creating Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Creating OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Creating Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                     --TASK-3 Data Manipulation Language (DML)
------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q3.a
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) 
VALUES 
(1, 'John', 'Doe', 'john@example.com', '123-456-7890', '123 Main St'),
(2, 'Jane', 'Smith', 'jane@example.com', '987-654-3210', '456 Elm St'),
(3, 'Alice', 'Johnson', 'alice@example.com', '111-222-3333', '789 Oak Ave'),
(4, 'Bob', 'Williams', 'bob@example.com', '444-555-6666', '101 Pine St'),
(5, 'Emily', 'Brown', 'emily@example.com', '777-888-9999', '210 Cedar St'),
(6, 'Michael', 'Davis', 'michael@example.com', '222-333-4444', '55 Birch Ln'),
(7, 'Sophia', 'Martinez', 'sophia@example.com', '999-888-7777', '890 Walnut St'),
(8, 'Olivia', 'Garcia', 'olivia@example.com', '666-555-4444', '345 Maple Ave'),
(9, 'William', 'Rodriguez', 'william@example.com', '333-222-1111', '678 Oak St'),
(10, 'Ethan', 'Lopez', 'ethan@example.com', '555-444-3333', '432 Pine Ave');

INSERT INTO Products (ProductID, ProductName, Description, Price) 
VALUES 
(1, 'Laptop', 'High-performance laptop with SSD', 1200.00),
(2, 'Smartphone', 'Latest smartphone model with advanced camera', 800.00),
(3, 'Tablet', '10-inch tablet with long battery life', 500.00),
(4, 'Headphones', 'Wireless noise-canceling headphones', 150.00),
(5, 'Smartwatch', 'Fitness tracking smartwatch', 200.00),
(6, 'Bluetooth Speaker', 'Portable Bluetooth speaker with excellent sound', 100.00),
(7, 'Gaming Console', 'Powerful gaming console for immersive gaming', 400.00),
(8, 'Camera', 'Digital camera with high-resolution sensor', 700.00),
(9, 'Drone', 'Quadcopter drone with HD camera', 1000.00),
(10, 'External Hard Drive', 'Portable external hard drive for data storage', 80.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES 
(1, 3, '2023-11-01', 1500.00),
(2, 6, '2023-11-03', 900.00),
(3, 1, '2023-11-05', 300.00),
(4, 8, '2023-11-07', 600.00),
(5, 5, '2023-11-10', 400.00),
(6, 10, '2023-11-12', 1100.00),
(7, 2, '2023-11-15', 2000.00),
(8, 7, '2023-11-18', 700.00),
(9, 9, '2023-11-20', 250.00),
(10, 4, '2023-11-22', 1000.00);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) 
VALUES 
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 2, 5, 3),
(5, 3, 4, 4),
(6, 4, 6, 2),
(7, 5, 8, 1),
(8, 6, 9, 1),
(9, 6, 10, 3),
(10, 7, 7, 1);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) 
VALUES 
(1, 1, 15, '2023-11-01'),
(2, 2, 20, '2023-11-01'),
(3, 3, 10, '2023-11-01'),
(4, 4, 30, '2023-11-01'),
(5, 5, 25, '2023-11-01'),
(6, 6, 18, '2023-11-01'),
(7, 7, 12, '2023-11-01'),
(8, 8, 8, '2023-11-01'),
(9, 9, 5, '2023-11-01'),
(10, 10, 22, '2023-11-01');

SELECT*FROM Inventory 

------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                      --TASK-3 Data Manipulation Language (DML)
-------------------------------------------------------------------------------------------------------------------------------------------------------------


--Q3.b.1
SELECT FirstName, LastName, Email FROM Customers;

--Q3.b.2
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName FROM Orders JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

--Q3.b.3
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES ('11', 'Anish', 'kolapudi', 'Anish@gmail.com', '123-456-7890', '433 Pine Ave');

--Q3.b.4
UPDATE Products SET Price=Price*1.1
WHERE Description LIKE '%High-performance laptop with SSD%'

--Q3.b.5
DECLARE @OrderIDToDelete INT; 
SET @OrderIDToDelete = 1; 


DELETE FROM OrderDetails
WHERE OrderID = @OrderIDToDelete;


DELETE FROM Orders
WHERE OrderID = @OrderIDToDelete;

--Q3.b.6
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES (1, 3, '2023-11-01', 1500.00);

--Q3.b.7
UPDATE Customers
SET Email = 'Deo@example.com', Address = '124 Main St'
WHERE CustomerID = '1'; 

--Q3.b.8
UPDATE Orders
SET TotalAmount=(
	SELECT SUM(P.Price * OD.Quantity)
	From OrderDetails AS OD
	INNER JOIN Products AS P ON OD.ProductId = P.ProductId
	WHERE OD.OrderId = Orders.OrderId
);


--Q3.b.9
DECLARE @CustomerIDToDelete INT; 
SET @CustomerIDToDelete = '3'; 
DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID FROM Orders
    WHERE CustomerID = @CustomerIDToDelete
);
DELETE FROM Orders
WHERE CustomerID = @CustomerIDToDelete;

--Q3.b.10
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES ('11', 'Earphones', 'Description of the new gadget', 399.99);

--Q3.b.11
ALTER TABLE Orders
ADD Status VARCHAR(20);

DECLARE @OrderIdToUpdate INT;
DECLARE @newStatus VARCHAR(20);

SET @OrderIdToUpdate = 5;
SET @newStatus = 'Shipped';

UPDATE Orders
SET Status = @newStatus
Where OrderId = @OrderIdToUpdate;

--Q3.b.12
DECLARE @NumberOfOrders INT
UPDATE Customers
SET @NumberOfOrders = (
    SELECT COUNT(OrderID) FROM Orders
    WHERE Customers.CustomerID = Orders.CustomerID);

------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                           --TASK-4 JOINS
------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q4.1
SELECT Orders.OrderID, Orders.OrderDate, Orders.TotalAmount, Customers.FirstName , Customers.LastName FROM Orders JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

--Q4.2
SELECT Products.ProductID, Products.ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Products.ProductID, Products.ProductName
ORDER BY TotalRevenue DESC;

--Q4.3
SELECT DISTINCT C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID;

--Q4.4
SELECT P.ProductName, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products AS P
JOIN OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName 
ORDER BY TotalQuantityOrdered DESC LIMIT 1;

--Q4.5
SELECT ProductName AS electronic_gadget, Category FROM Products
WHERE Category IS NOT NULL;


--Q4.6
SELECT C.FirstName, C.LastName, AVG(OD.Quantity * P.Price) AS AverageOrderValue
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

--Q4.7
SELECT TOP 1 O.OrderID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address, SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY O.OrderID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
ORDER BY TotalRevenue DESC;


--Q4.8
SELECT P.ProductID, P.ProductName, COUNT(OD.OrderDetailID) AS TimesOrdered
FROM Products AS P
LEFT JOIN OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TimesOrdered DESC;

--Q4.9
SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Headphones';

--Q4.10
SELECT SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Orders AS O
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE O.OrderDate >= '2023-11-01' AND O.OrderDate <= '2023-11-03';

------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- TASK-5 Aggregate Functions 
------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q5.1
SELECT C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;

--Q5.2
SELECT COUNT(*) AS TotalProducts
FROM Products;

--Q5.3
SELECT SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Orders AS O
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID;

--Q5.4
-- THIS CANNOT BE SOLVED BECAUSE WE DON'T HAVE CATEGORY IN THE PROVIDED INPUT TABLE. BUT WE CAN USE ALTER AND ADD CATEGORY TABLE IN PRODUCTS.
ALTER TABLE Products
ADD Category VARCHAR(30);
UPDATE Products
SET Category = 'Electronics'
WHERE ProductId IN(10,20,40,50,80)
UPDATE Products
SET Category = 'General'
WHERE ProductId IN(30,60,70,80,100)
DECLARE @InputCategoryName VARCHAR(255) = 'YourCategoryName';
SELECT AVG(OD.Quantity) AS average_quantity_ordered FROM OrderDetails AS OD
JOIN Products AS P ON OD.ProductId = P.ProductId 
WHERE P.Category = @InputCategoryName;

--Q5.5
SELECT SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Orders AS O
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE O.CustomerID = '5';

--Q5.6
SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY NumberOfOrders DESC;

--Q5.7
-- THIS CANNOT BE SLOVED BECAUSE WE DON'T HAVE INPUT CATEGORY.BUT WE CAN DO THIS IN THE BELOW STEPS.
SELECT TOP 1 P.Category, SUM(OD.Quantity) AS total_quantity_ordered FROM OrderDetails AS OD
JOIN Products AS P ON OD.ProductId = P.ProductId  
GROUP BY P.Category
ORDER BY total_quantity_ordered DESC;

-- Q5.8
SELECT C.FirstName, C.LastName, SUM(OD.Quantity * P.Price) AS TotalSpending
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE P.Description = 'Wireless noise-canceling headphones'
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalSpending DESC;

--Q5.9
SELECT DISTINCT C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Headphones';


--Q5.10
SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS OrderCount
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY OrderCount DESC;

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------












