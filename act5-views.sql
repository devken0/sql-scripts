CREATE SCHEMA gomezdb;
USE gomezdb;

-- Create user table
CREATE TABLE `gomezdb`.`people` (
	`user_id` VARCHAR (30) NOT NULL,
  `first_name` VARCHAR (45) NOT NULL,
  `last_name` VARCHAR (45) NOT NULL,
  `sex` VARCHAR (10) NOT NULL,
  `email` VARCHAR (80) NOT NULL,
  `phone` VARCHAR (30) NOT NULL,
  `birth_date` DATE NOT NULL,
  `job` VARCHAR (30) NOT NULL,
		PRIMARY KEY (`user_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Insert data in user table
INSERT INTO `gomezdb`.`people` (`user_id`, `first_name`, `last_name`, `sex`, `email`, `phone`, `birth_date`, `job`) 
VALUES 
('88F7B33d2bcf9f5','Shelby','Terrell','Male','elijah57@gmail.com','001-084-906-7849x73518','1945-10-26','Game Developer'),
('f90cD3E76f1A9b9','Paulene','Summers','Female','bethany14@gmail.com','214.112.6044x4913','1910-03-24','Phytotherapist'),
('DbeAb8CcdfeFC2c','Kristopher','Travis','Male','bthompson@gmail.com','277.609.7938','1992-07-02','Homeopath'),
('A31Bee3c201ef58','Yesenia','Martinez','Male','kaitlinkaiser@gmail.com','584.094.6111','2017-08-03','Market researcher'),
('1bA7A3dc874da3c','Luke','Todd','Male','buchananmanuel@gmail.com','689-207-3558x7233','1938-12-01','Veterinary surgeon'),
('bfDD7CDEF5D865B','Erin','Day','Male','tconner@gmail.com','001-171-649-9856x5553','2015-10-28','Waste management officer'),
('bE9EEf34cB72AF7','Katherine','Buck','Female','conniecowan@gmail.com','+1-773-151-6685x49162','1989-01-22','Intelligence analyst'),
('2EFC6A4e77FaEaC','Ricardo','Hinton','Male','wyattbishop@gmail.com','001-447-699-7998x88612','1924-03-26','Hydrogeologist'),
('baDcC4DeefD8dEB','Dave','Farrell','Male','nmccann@gmail.com','603-428-2429x27392','2018-10-06','Lawyer');

-- Create a view for listing of all male individuals 
CREATE VIEW men AS 
SELECT first_name, last_name, job
FROM people
WHERE sex = "Male";

SELECT * FROM men;


