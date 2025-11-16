
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

-- 4: GetMaxQuantity

DELIMITER //
DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxOrderedQuantity FROM Orders;
END //
DELIMITER ;

-- 5: GetOrderDetail Prepared Statement

PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';

-- 6: CancelOrder

DELIMITER //
DROP PROCEDURE IF EXISTS CancelOrder;
CREATE PROCEDURE CancelOrder(IN p_order_id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = p_order_id;
END //
DELIMITER ;

-- 7: CheckBooking Stored Procedure

DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE table_status VARCHAR(100);
    
    SELECT COUNT(*) INTO @count
    FROM Bookings
    WHERE BookingDate = booking_date 
    AND TableNumber = table_number;
    
    IF @count > 0 THEN
		SET table_status = 'Table is already booked';
    ELSE
		SET table_status = 'Table is available';
    END IF;
    
    SELECT table_status AS 'Booking Status';
END //

DELIMITER ;

-- 8: AddValidBooking Procedure

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
	DECLARE table_status INT DEFAULT 0;
    
    START TRANSACTION;
    
    SELECT COUNT(*) INTO table_status
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    
    INSERT INTO Bookings(BookingDate, TableNumber, CustomerID) 
    VALUES (booking_date, table_number, customer_id);
    
    IF table_status > 0 THEN
		ROLLBACK;
        SELECT CONCAT('Table ', table_number, ' is already booked - booking cancelled') AS 'Booking Status';
    ELSE
		COMMIT;
        SELECT CONCAT('Table ', table_number, ' is now booked') AS 'Booking Status';
    END IF;
    
END //
DELIMITER ;

-- 9: AddBooking Procedure

DELIMITER //

CREATE PROCEDURE AddBooking(
	IN booking_id INT,
    IN customer_id INT,
    IN booking_date DATE,
    IN table_number INT
)

BEGIN

	DECLARE customer_exists INT DEFAULT 0;
	DECLARE booking_exists INT DEFAULT 0;
	DECLARE table_booked INT DEFAULT 0;
	DECLARE customer_name VARCHAR(255) DEFAULT '';

	SELECT COUNT(*) INTO customer_exists
	FROM Customers
	WHERE CustomerID = customer_id;
    
    IF customer_exists > 0 THEN
		SELECT FullName INTO customer_name
        FROM Customers
        WHERE CustomerID = customer_id;
    END IF;

	SELECT COUNT(*) INTO booking_exists
	FROM Bookings
	WHERE BookingID = booking_id;

	SELECT COUNT(*) INTO table_booked
	FROM Bookings
	WHERE BookingDate = booking_date 
	AND TableNumber = table_number;

	IF customer_exists = 0 THEN
		SELECT CONCAT('Error: CustomerID ', customer_id, ' dose not exist!') AS 'Status',
        'Please register the customer first' AS 'Action Required';
    ELSEIF booking_exists > 0 THEN
		SELECT CONCAT('Error: BookingID ', booking_id, ' already exists!') AS 'Status',
        'Please use a different booking ID' AS 'Action Required';
    ELSEIF table_booked > 0 THEN
		SELECT CONCAT('Error: Table ', table_number, ' is already booked on ', booking_date) AS 'Status', 
        'Please choose a different table or date' AS 'Action Required';
    ELSE
		INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
        VALUES (booking_id, booking_date, table_number, customer_id);
        
        SELECT 'Booking Successfully Added!' AS 'Status';
        
        SELECT booking_id AS 'Booking ID',
			customer_id AS 'Customer ID',
            customer_name AS 'Customer Name',
            booking_date AS 'Booking Date',
            table_number AS 'Table Number',
            NOW() AS 'Created At';
				
    END IF;

END //
DELIMITER ;

-- 9: UpdateBooking Procedure

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN booking_date DATE
)
BEGIN
    DECLARE booking_exists INT DEFAULT 0;
    DECLARE old_date DATE;
    DECLARE customer_name VARCHAR(255);
    DECLARE customer_id_val INT; 
    DECLARE table_num INT;
    
    SELECT COUNT(*) INTO booking_exists
    FROM Bookings
    WHERE BookingID = booking_id;
    
    IF booking_exists > 0 THEN
        SELECT BookingDate, TableNumber, CustomerID
        INTO old_date, table_num, customer_id_val  
        FROM Bookings
        WHERE BookingID = booking_id;
        
        
        SELECT FullName INTO customer_name
        FROM Customers
        WHERE CustomerID = customer_id_val;
    END IF;
    
    
    IF booking_exists = 0 THEN  
       
        SELECT CONCAT('Booking ', booking_id, ' does not exist') AS 'Confirmation';
    ELSE
        UPDATE Bookings
        SET BookingDate = booking_date
        WHERE BookingID = booking_id;
        
        SELECT CONCAT('Booking ', booking_id, ' updated') AS 'Confirmation';
        
        SELECT booking_id AS 'Booking ID',
            customer_name AS 'Customer Name',
            table_num AS 'Table Number',
            old_date AS 'Old Date',
            booking_date AS 'New Date',
            NOW() AS 'Updated At';
    END IF;
END //

DELIMITER ;

-- 10: CancelBooking Procedure

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)

BEGIN
	
    DECLARE booking_exists INT DEFAULT 0;
    DECLARE booking_date DATE;
    DECLARE customer_name VARCHAR(255);
    DECLARE customer_id_val INT;
    DECLARE table_num INT;
    DECLARE rows_deleted INT DEFAULT 0;
    
    SELECT COUNT(*) INTO booking_exists
    FROM Bookings
    WHERE BookingID = booking_id;
    
    IF booking_exists > 0 THEN
		SELECT BookingDate, TableNumber, CustomerID
        INTO booking_date, table_num, customer_id_val
        FROM Bookings
        WHERE BookingID = booking_id;
        
        SELECT FullName INTO customer_name
        FROM Customers
        WHERE CustomerID = customer_id_val;
    END IF;
    
    IF booking_exists = 0 THEN
		SELECT CONCAT('Error: Booking ID ', booking_id, ' does not exist!') AS 'Status',
        'Cannot cancel a non-existent booking' AS 'Action Required';
    ELSE
		DELETE FROM Bookings
        WHERE BookingID = booking_id;
        
        SET rows_deleted = ROW_COUNT();
        
        SELECT 'Booking Successful Cancelled!' AS Status;
        
        SELECT booking_id AS 'Cancelled Booking ID',
        customer_id_val AS 'Customer ID',
        customer_name AS 'Customer Name',
        booking_date AS 'Booking Date',
        table_num AS 'Table Number',
        rows_deleted AS 'Rows Deleted',
        NOW() AS 'Cancelled At';
    END IF;
END //
DELIMITER ;




