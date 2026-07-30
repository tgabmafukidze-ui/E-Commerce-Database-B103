USE EcommerceDB;


INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City) VALUES
('Tawana',  'Gabriel',   'tawana.gabriel@email.com',  '+491577663322', 'Friedrichstraße 20, 10117 Berlin, Germany',           'Berlin'),
('Yuki',    'Tanaka',    'yuki.tanaka@email.com',     '+491521112233', 'Ludwigstraße 14, 80539 Munich, Germany',              'Munich'),
('Amira',   'Hassan',    'amira.hassan@email.com',    '+491763334455', 'Königsallee 52, 40212 Düsseldorf, Germany',           'Düsseldorf'),
('Luis',    'Fernandez', 'luis.fernandez@email.com',  '+491764445566', 'Hauptstraße 8, 69117 Heidelberg, Germany',            'Heidelberg'),
('Sofia',   'Rossi',     'sofia.rossi@email.com',     '+491765556677', 'Reeperbahn 45, 20359 Hamburg, Germany',               'Hamburg');


INSERT INTO Products (ProductName, Category, Description, Price, StockQuantity) VALUES
('Wireless Mouse',      'Electronics', 'USB wireless mouse',              199.99,  50),
('Laptop Bag',          'Accessories', '15-inch padded laptop bag',       349.50,  30),
('USB-C Cable',         'Electronics', '1.5m fast charging cable',         89.00, 100),
('Notebook A5',         'Stationery',  'Ruled A5 notebook',               45.00, 200),
('Bluetooth Headphones','Electronics', 'Over-ear wireless headphones',   799.00,  25),
('Desk Lamp',           'Home',        'LED desk lamp with USB port',     259.99,  40),
('Water Bottle',        'Lifestyle',   '750ml stainless steel bottle',    149.00,  60),
('Keyboard',            'Electronics', 'Quiet membrane keyboard',        449.00,  35);


INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2026-01-10', 'Delivered'),
(2, '2026-01-15', 'Shipped'),
(3, '2026-02-01', 'Processing'),
(1, '2026-02-10', 'Pending'),
(4, '2026-02-20', 'Delivered'),
(5, '2026-03-01', 'Cancelled');


INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 199.99),
(1, 3, 1,  89.00),
(2, 5, 1, 799.00),
(2, 2, 1, 349.50),
(3, 8, 1, 449.00),
(3, 6, 2, 259.99),
(4, 4, 5,  45.00),
(5, 7, 2, 149.00),
(5, 1, 1, 199.99),
(6, 3, 3,  89.00);


INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod, Status) VALUES
(1, '2026-01-10', 488.98, 'Card',   'Completed'),
(2, '2026-01-15', 1148.50,'PayPal', 'Completed'),
(3, '2026-02-01', 968.98, 'EFT',    'Completed'),
(4, '2026-02-10', 225.00, 'Card',   'Pending'),
(5, '2026-02-20', 497.99, 'Cash',   'Completed'),
(6, '2026-03-01', 267.00, 'Card',   'Refunded');
