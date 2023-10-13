CREATE SCHEMA gomezdb;

USE gomezdb;

/* Problem 1
Introduce a new product named The Forever Love Bear as a complementary addition to The Original Mr. Fuzzy. Design and 
implement a table for storing product information within the database. The launch dates of the products, namely 2022-03-09 
at 9am and 2023-01-06 at 1pm, together with their respective product names, need to be recorded and assigned unique 
identifiers for future cross-referencing with other tables.
*/

CREATE TABLE `gomezdb`.`product` (
    `product_id` INT UNSIGNED NOT NULL,
    `product_name` VARCHAR(45) NOT NULL,
    `launch_date` DATE NOT NULL,
    `launch_time` TIME NOT NULL,
	PRIMARY KEY (`product_id`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

INSERT INTO `gomezdb`.`product` (`product_id`, `product_name`, `launch_date`, `launch_time`) VALUES ('1', 'The Original Mr. Fuzzy Design', '2022-03-09', '9:00');
INSERT INTO `gomezdb`.`product` (`product_id`, `product_name`, `launch_date`, `launch_time`) VALUES ('2', 'The Forever Love Bear', '2023-01-06', '13:00');

SELECT * FROM gomezdb.product;

/* Problem 2
There is a wide variety of products available for sale in the current market. 
The Chief Executive Officer (CEO) intends to establish a connection between 
the order_items record and the corresponding product that was sold. Kindly 
incorporate the product_id attribute into the preexisting order_items table. 
*/

CREATE TABLE `gomezdb`.`order_items` (
    `order_id` INT UNSIGNED NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`order_id`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

SELECT * FROM gomezdb.order_items;

/* Problem 3
The Chief Executive Officer (CEO) saw that all entries within the order_items 
database table have a NULL value for the product_id attribute. The user made 
a request to apply the reflection of product 1 to all existing records inside 
the database, with the intention of preparing the table for future utilization. 
*/

ALTER TABLE gomezdb.order_items ALTER COLUMN product_id SET DEFAULT 1;

INSERT INTO gomezdb.`order_items` (`order_id`) VALUES ('5');
INSERT INTO gomezdb.`order_items` (`order_id`) VALUES ('4');
INSERT INTO gomezdb.`order_items` (`order_id`) VALUES ('3');
INSERT INTO gomezdb.`order_items` (`order_id`) VALUES ('2');
INSERT INTO gomezdb.`order_items` (`order_id`) VALUES ('1');

SELECT * FROM gomezdb.order_items;

