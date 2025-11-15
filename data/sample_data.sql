USE LittleLemonDB;

-- Customers
INSERT INTO Customers (FullName, PhoneNumber, Email) VALUES
('Aung Min', '0912345678', 'aung.min@example.com'),
('Thiri Hlaing', '0987654321', 'thiri.h@example.com'),
('Ko Ko', '0971112233', 'koko@example.com'),
('May Thin', '0945678901', 'may.thin@example.com'),
('Hnin Ei', '0922233344', 'hninei@example.com');

-- MenuItems
INSERT INTO MenuItems (MenuItemsID, CourseName, StarterName, DesertName) VALUES
(1, 'Seafood Platter', 'Garlic Bread', 'Lemon Tart'),
(2, 'Vegan Delight', 'Bruschetta', 'Fruit Salad'),
(3, 'Spicy Fusion', 'Spring Rolls', 'Coconut Jelly'),
(4, 'Classic Roast', 'Soup of the Day', 'Cheesecake'),
(5, 'Mediterranean Mix', 'Greek Salad', 'Baklava');

-- Menu
INSERT INTO Menu (MenuName, Cuisine, Price, MenuItemsID) VALUES
('Ocean Breeze', 'Seafood', 220.00, 1),
('Garden Fresh', 'Vegan', 95.00, 2),
('Firecracker', 'Asian Fusion', 150.00, 3),
('Hearty Comfort', 'Western', 180.00, 4),
('Sunny Isles', 'Mediterranean', 205.00, 5);

-- Staff
INSERT INTO Staff (FullName, Role, Salary, PhoneNumber) VALUES
('Nay Lin', 'Manager', 2600.00, '0991112222'),
('Su Su', 'Head Chef', 2400.00, '0975556666'),
('Myint Aye', 'Server', 1200.00, '0967778888'),
('Wai Yan', 'Bartender', 1300.00, '0953334444'),
('Ei Mon', 'Sous Chef', 1800.00, '0944445555');

-- Bookings
INSERT INTO Bookings (BookingDate, TableNumber, CustomerID) VALUES
('2025-11-01', 5, 1),
('2025-11-02', 2, 2),
('2025-11-03', 8, 3),
('2025-11-04', 4, 4),
('2025-11-05', 1, 5);

-- Orders
INSERT INTO Orders (OrderDate, Quantity, TotalCost, CustomerID, MenuID) VALUES
('2025-11-01', 3, 660.00, 1, 1),
('2025-11-02', 1, 95.00, 2, 2),
('2025-11-03', 4, 600.00, 3, 3),
('2025-11-04', 2, 360.00, 4, 4),
('2025-11-05', 5, 1025.00, 5, 5),
('2025-11-05', 3, 540.00, 1, 3);

-- OrderDeliveryStatus
INSERT INTO OrderDeliveryStatus (DeliveryDate, DeliveryStatus, OrderID) VALUES
('2025-11-02', 'Delivered', 1),
('2025-11-02', 'Pending', 2),
('2025-11-04', 'Delivered', 3),
('2025-11-05', 'Preparing', 4),
('2025-11-06', 'Delivered', 5),
('2025-11-06', 'Delivered', 6);
