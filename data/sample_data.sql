USE LittleLemonDB;

-- Customers
INSERT INTO Customers (CustomerID, FullName, PhoneNumber, Email, City, Country, PostalCode) VALUES
(1, 'John Smith', '555-0101', 'john.smith@email.com', 'New York', 'United States', '10001'),
(2, 'Maria Garcia', '555-0102', 'maria.g@email.com', 'Los Angeles', 'United States', '90001'),
(3, 'James Johnson', '555-0103', 'james.j@email.com', 'Chicago', 'United States', '60601'),
(4, 'Emily Davis', '555-0104', 'emily.d@email.com', 'Houston', 'United States', '77001'),
(5, 'Michael Brown', '555-0105', 'michael.b@email.com', 'Phoenix', 'United States', '85001'),
(6, 'Sarah Wilson', '555-0106', 'sarah.w@email.com', 'Miami', 'United States', '33101'),
(7, 'David Martinez', '555-0107', 'david.m@email.com', 'Seattle', 'United States', '98101'),
(8, 'Lisa Anderson', '555-0108', 'lisa.a@email.com', 'Boston', 'United States', '02101'),
(9, 'Robert Taylor', '555-0109', 'robert.t@email.com', 'Denver', 'United States', '80201'),
(10, 'Jennifer Lee', '555-0110', 'jennifer.l@email.com', 'Atlanta', 'United States', '30301');

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
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES
(1, '2019-01-15', 5, 1),
(2, '2019-02-20', 3, 2),
(3, '2019-03-10', 8, 3),
(4, '2020-04-16', 2, 4),
(5, '2020-06-11', 7, 6),
(6, '2021-05-16', 4, 5),
(7, '2021-08-13', 6, 8),
(8, '2022-07-20', 9, 7),
(9, '2022-09-12', 1, 9),
(10, '2023-06-19', 10, 6);

-- Orders
INSERT INTO Orders (OrderID, OrderDate, Quantity, Cost, TotalCost, CustomerID, MenuID) VALUES
(1, '2019-01-15', 3, 450.00, 660.00, 1, 1),
(2, '2019-02-20', 2, 140.00, 190.00, 2, 2),
(3, '2019-03-10', 5, 600.00, 750.00, 3, 3),
(4, '2019-04-05', 4, 560.00, 720.00, 4, 4),
(5, '2019-05-12', 3, 480.00, 615.00, 5, 5),
(6, '2019-06-18', 2, 320.00, 440.00, 6, 1),
(7, '2019-07-22', 6, 420.00, 570.00, 7, 2),
(8, '2019-08-30', 4, 480.00, 600.00, 8, 3),
(9, '2019-09-14', 3, 420.00, 540.00, 9, 4),
(10, '2019-10-25', 5, 750.00, 1025.00, 10, 5),
(11, '2020-01-08', 2, 300.00, 440.00, 1, 1),
(12, '2020-02-14', 4, 280.00, 380.00, 2, 2),
(13, '2020-03-20', 3, 360.00, 450.00, 3, 3),
(14, '2020-04-16', 5, 700.00, 900.00, 4, 4),
(15, '2020-05-23', 2, 320.00, 410.00, 5, 5),
(16, '2020-06-11', 6, 960.00, 1320.00, 6, 1),
(17, '2020-07-07', 3, 210.00, 285.00, 7, 2),
(18, '2020-08-19', 4, 480.00, 600.00, 8, 3),
(19, '2020-09-25', 2, 280.00, 360.00, 9, 4),
(20, '2020-10-30', 5, 750.00, 1025.00, 10, 5),
(21, '2021-01-12', 3, 450.00, 660.00, 1, 1),
(22, '2021-02-18', 2, 140.00, 190.00, 2, 2),
(23, '2021-03-24', 4, 480.00, 600.00, 3, 3),
(24, '2021-04-10', 3, 420.00, 540.00, 4, 4),
(25, '2021-05-16', 6, 900.00, 1230.00, 5, 5),
(26, '2021-06-22', 2, 320.00, 440.00, 6, 1),
(27, '2021-07-28', 5, 350.00, 475.00, 7, 2),
(28, '2021-08-13', 3, 360.00, 450.00, 8, 3),
(29, '2021-09-19', 4, 560.00, 720.00, 9, 4),
(30, '2021-10-26', 2, 320.00, 410.00, 10, 5),
(31, '2022-01-05', 4, 640.00, 880.00, 1, 1),
(32, '2022-02-11', 3, 210.00, 285.00, 2, 2),
(33, '2022-03-17', 5, 600.00, 750.00, 3, 3),
(34, '2022-04-23', 2, 280.00, 360.00, 4, 4),
(35, '2022-05-29', 4, 640.00, 820.00, 5, 5),
(36, '2022-06-14', 3, 480.00, 660.00, 6, 1),
(37, '2022-07-20', 6, 420.00, 570.00, 7, 2),
(38, '2022-08-26', 2, 240.00, 300.00, 8, 3),
(39, '2022-09-12', 5, 700.00, 900.00, 9, 4),
(40, '2022-10-18', 3, 480.00, 615.00, 10, 5),
(41, '2023-01-09', 2, 320.00, 440.00, 1, 1),
(42, '2023-02-15', 4, 280.00, 380.00, 2, 2),
(43, '2023-03-21', 3, 360.00, 450.00, 3, 3),
(44, '2023-04-27', 5, 700.00, 900.00, 4, 4),
(45, '2023-05-13', 2, 320.00, 410.00, 5, 5),
(46, '2023-06-19', 6, 960.00, 1320.00, 6, 1),
(47, '2023-07-25', 3, 210.00, 285.00, 7, 2),
(48, '2023-08-31', 4, 480.00, 600.00, 8, 3),
(49, '2023-09-16', 2, 280.00, 360.00, 9, 4),
(50, '2023-10-22', 5, 750.00, 1025.00, 10, 5);

-- OrderDeliveryStatus
INSERT INTO OrderDeliveryStatus (DeliveryID, DeliveryDate, DeliveryStatus, OrderID) VALUES
(1, '2019-01-17', 'Delivered', 1),
(2, '2019-02-22', 'Delivered', 2),
(3, '2020-04-18', 'Delivered', 14),
(4, '2020-06-13', 'Delivered', 16),
(5, '2021-05-18', 'Delivered', 25),
(6, '2021-08-15', 'Delivered', 28),
(7, '2022-07-22', 'Delivered', 37),
(8, '2022-09-14', 'Delivered', 39),
(9, '2023-06-21', 'Delivered', 46),
(10, '2023-10-24', 'Delivered', 50);
