

USE EcommerceDB;


SELECT * FROM Customers;


SELECT ProductName, Category, Price, StockQuantity
FROM Products
WHERE Price > 200
ORDER BY Price DESC;


SELECT OrderID, CustomerID, OrderDate, Status
FROM Orders
WHERE Status IN ('Pending', 'Processing');




INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City)
VALUES ('Chen', 'Wei', 'chen.wei@email.com', '+491766667788', 'Unter den Linden 12, 10117 Berlin, Germany', 'Berlin');


INSERT INTO Products (ProductName, Category, Description, Price, StockQuantity)
VALUES ('Phone Stand', 'Accessories', 'Adjustable desk phone stand', 129.00, 80);



UPDATE Products
SET StockQuantity = StockQuantity - 3
WHERE ProductName = 'USB-C Cable';


UPDATE Orders
SET Status = 'Processing'
WHERE OrderID = 4;


UPDATE Customers
SET Phone = '0829998877'
WHERE Email = 'amira.hassan@email.com';



DELETE FROM Products
WHERE ProductName = 'Phone Stand';





SELECT
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.Status
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate;


SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    p.ProductName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) AS LineTotal
FROM Orders o
INNER JOIN Customers c   ON o.CustomerID = c.CustomerID
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID
INNER JOIN Products p    ON oi.ProductID = p.ProductID
ORDER BY o.OrderID;


SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.Status AS OrderStatus,
    p.Amount,
    p.PaymentMethod,
    p.Status AS PaymentStatus
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Payments p  ON o.OrderID = p.OrderID;



SELECT
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalOrders DESC;


SELECT
    SUM(Amount) AS TotalRevenue
FROM Payments
WHERE Status = 'Completed';


SELECT
    Category,
    COUNT(*) AS ProductCount,
    AVG(Price) AS AveragePrice,
    MIN(Price) AS Cheapest,
    MAX(Price) AS MostExpensive
FROM Products
GROUP BY Category;


SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
FROM Orders o
INNER JOIN Customers c   ON o.CustomerID = c.CustomerID
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID
GROUP BY o.OrderID, c.FirstName, c.LastName
ORDER BY OrderTotal DESC;


SELECT
    PaymentMethod,
    COUNT(*) AS NumberOfPayments,
    SUM(Amount) AS TotalAmount
FROM Payments
GROUP BY PaymentMethod;



SELECT ProductName, StockQuantity
FROM Products
WHERE StockQuantity < 40
ORDER BY StockQuantity ASC;


SELECT c.FirstName, c.LastName, c.Email
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
