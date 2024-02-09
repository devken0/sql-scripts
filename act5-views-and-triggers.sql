-- A. Views

CREATE SCHEMA gomezdb;
USE gomezdb;

-- Import website_sessions csv files
-- 14.website_sessions_2014_Jan
-- 15.website_sessions_2014_Feb

-- summarizing performance for January and February: Displays the number of sessions sliced by year, month, utm_source, and utm_campaign.
CREATE VIEW monthly_sessions AS
SELECT 
    YEAR(visit_date) AS VisitYear,
    MONTH(visit_date) AS VisitMonth,
    utm_source,
    utm_campaign,
    COUNT(*) AS SessionCount
FROM 
    sessions
WHERE 
    (YEAR(visit_date) = YEAR(CURRENT_DATE()) AND MONTH(visit_date) = 1) 
    OR 
    (YEAR(visit_date) = YEAR(CURRENT_DATE()) AND MONTH(visit_date) = 2)
GROUP BY 
    VisitYear,
    VisitMonth,
    utm_source,
    utm_campaign;

-- display view
SELECT * FROM monthly_sessions;

-- B. Triggers

CREATE SCHEMA gomezdb1;
USE gomezdb1;

-- Create tables

-- For customer purchases
CREATE TABLE customer_purchases (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(100)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

-- For stocks/inventory
CREATE TABLE inventory (
    number_of_stock BIGINT
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

INSERT INTO inventory (`number_of_stock`) VALUES (5);

-- Create triggers

-- After a customer purchase, update or decrement stock/inventory.
CREATE TRIGGER update_stock
AFTER INSERT ON customer_purchases
FOR EACH ROW
UPDATE `gomezdb1`.`inventory`
SET number_of_stock = number_of_stock - 1;

-- Before a customer purchase is placed, check stock availability
DELIMITER //
CREATE TRIGGER sales_bi 
BEFORE INSERT ON customer_purchases
FOR EACH ROW
BEGIN
	IF gomezdb1.inventory (`number_of_stock`) = 0 THEN
	SIGNAL SQLSTATE '45000' 
	-- If number_of_stock is 0, send error and message "Out of stock"
  SET MESSAGE_TEXT = 'Out of stock.';
	END IF;
END //
DELIMITER ;

-- Before a customer purchase is updated, check stock availability
DELIMITER //
CREATE TRIGGER sales_bu BEFORE UPDATE
ON customer_purchases
FOR EACH ROW
BEGIN
	IF (`gomezdb1`.`inventory`(`number_of_stock`) = 0) THEN
	SIGNAL SQLSTATE '45000' 
	-- If number_of_stock is 0, send error and message "Out of stock"
  SET MESSAGE_TEXT = 'Out of stock.';
	END IF;
END //
DELIMITER ;

-- Display triggers
SHOW TRIGGERS;
