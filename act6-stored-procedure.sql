-- create database
CREATE SCHEMA gomezact6;
USE gomezact6;

-- stored procedure for getting total orders from given date and time range
DELIMITER //
CREATE PROCEDURE `get_total_orders` (
IN start_date DATETIME, IN end_date DATETIME, OUT total_orders int)
BEGIN
SELECT COUNT(*) INTO total_orders FROM gomezact6.orders WHERE created_at BETWEEN start_date and end_date;
END// 
DELIMITER ;

-- calling the procedure
CALL get_total_orders('2012-03-19 00:00:00', '2012-12-02 00:00:00', @total_orders);
-- displaying the output (total_orders)
SELECT @total_orders;