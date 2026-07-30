

CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;


DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;


CREATE TABLE Customers (
    CustomerID   INT AUTO_INCREMENT PRIMARY KEY,
    FirstName    VARCHAR(50)  NOT NULL,
    LastName     VARCHAR(50)  NOT NULL,
    Email        VARCHAR(100) NOT NULL UNIQUE,
    Phone        VARCHAR(20),
    Address      VARCHAR(200),
    City         VARCHAR(50),
    CreatedAt    DATE NOT NULL DEFAULT (CURRENT_DATE)
);


CREATE TABLE Products (
    ProductID    INT AUTO_INCREMENT PRIMARY KEY,
    ProductName  VARCHAR(100) NOT NULL,
    Category     VARCHAR(50)  NOT NULL,
    Description  VARCHAR(255),
    Price        DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0)
);


CREATE TABLE Orders (
    OrderID      INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID   INT NOT NULL,
    OrderDate    DATE NOT NULL DEFAULT (CURRENT_DATE),
    Status       VARCHAR(20) NOT NULL DEFAULT 'Pending'
                 CHECK (Status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderItems (
    OrderItemID  INT AUTO_INCREMENT PRIMARY KEY,
    OrderID      INT NOT NULL,
    ProductID    INT NOT NULL,
    Quantity     INT NOT NULL CHECK (Quantity > 0),
    UnitPrice    DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Payments (
    PaymentID     INT AUTO_INCREMENT PRIMARY KEY,
    OrderID       INT NOT NULL,
    PaymentDate   DATE NOT NULL DEFAULT (CURRENT_DATE),
    Amount        DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    PaymentMethod VARCHAR(30) NOT NULL
                  CHECK (PaymentMethod IN ('Card', 'Cash', 'EFT', 'PayPal')),
    Status        VARCHAR(20) NOT NULL DEFAULT 'Completed'
                  CHECK (Status IN ('Pending', 'Completed', 'Failed', 'Refunded')),
    CONSTRAINT fk_payments_order
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
