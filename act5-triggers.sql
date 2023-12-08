CREATE SCHEMA gomezdb1;
USE gomezdb1;

CREATE TABLE customer_purchases (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(100)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE inventory (
    number_of_stock BIGINT
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

INSERT INTO inventory (`number_of_stock`) VALUES (5);

CREATE TRIGGER update_stock
AFTER INSERT ON customer_purchases
FOR EACH ROW
UPDATE `gomezdb1`.`inventory`
SET number_of_stock = number_of_stock - 1;

DELIMITER //
CREATE TRIGGER sales_bi 
BEFORE INSERT ON customer_purchases
FOR EACH ROW
BEGIN
	IF gomezdb1.inventory (`number_of_stock`) = 0 THEN
	SIGNAL SQLSTATE '45000' 
  SET MESSAGE_TEXT = 'Out of stock.';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER sales_bu BEFORE UPDATE
ON customer_purchases
FOR EACH ROW
BEGIN
	IF (`gomezdb1`.`inventory`(`number_of_stock`) = 0) THEN
	SIGNAL SQLSTATE '45000' 
  SET MESSAGE_TEXT = 'Out of stock.';
	END IF;
END //
DELIMITER ;

SHOW TRIGGERS;

