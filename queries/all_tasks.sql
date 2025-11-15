
-- Little Lemon Database

USE LittleLemonDB;

-- 1: OrdersView

CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;

-- 2: Expensive Orders Report

SELECT 
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost,
    m.MenuName,
    mi.CourseName,
    mi.StarterName
FROM Customers AS c
INNER JOIN Orders AS o       ON c.CustomerID = o.CustomerID
INNER JOIN Menu AS m         ON o.MenuID = m.MenuID
INNER JOIN MenuItems AS mi   ON m.MenuItemsID = mi.MenuItemsID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;

-- 3: Popular Menu Items

SELECT MenuName, Cuisine, Price
FROM Menu
WHERE MenuID = ANY (
    SELECT MenuID FROM Orders WHERE Quantity > 2
);
