-- MySQL Workbench Synchronization
-- Generated: 2026-03-13 22:28
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: HP

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `simple_banking_system`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `simple_banking_system`.`account` 
DROP FOREIGN KEY `fk_account_customer`;

ALTER TABLE `simple_banking_system`.`transaction` 
DROP FOREIGN KEY `fk_transaction_account1`,
DROP FOREIGN KEY `fk_transaction_customer1`;

ALTER TABLE `simple_banking_system`.`customer` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `simple_banking_system`.`account` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `transaction_ID` INT(11) NULL DEFAULT NULL AFTER `Customer_ID`,
CHANGE COLUMN `account_ID` `account_ID` INT(11) NOT NULL FIRST,
CHANGE COLUMN `Customer_ID` `Customer_ID` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `Created_At` `Created_At` DATETIME NULL DEFAULT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`account_ID`, `customer_Customer_ID`),
ADD INDEX `fk_account_customer_idx` (`customer_Customer_ID` ASC) VISIBLE,
DROP INDEX `fk_account_customer_idx` ;
;

ALTER TABLE `simple_banking_system`.`transaction` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `customer_Customer_ID`,
DROP COLUMN `account_Customer_ID`,
ADD COLUMN `transaction_ID` INT(11) NOT NULL FIRST,
ADD COLUMN `account_account_ID` INT(11) NOT NULL AFTER `Description`,
ADD COLUMN `account_customer_Customer_ID` INT(11) NOT NULL AFTER `account_account_ID`,
CHANGE COLUMN `Account_ID` `Account_ID` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `Amount` `Amount` DECIMAL NULL DEFAULT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`transaction_ID`, `account_account_ID`, `account_customer_Customer_ID`),
ADD INDEX `fk_transaction_account1_idx` (`account_account_ID` ASC, `account_customer_Customer_ID` ASC) VISIBLE,
DROP INDEX `fk_transaction_customer1_idx` ,
DROP INDEX `fk_transaction_account1_idx` ;
;

ALTER TABLE `simple_banking_system`.`account` 
ADD CONSTRAINT `fk_account_customer`
  FOREIGN KEY (`customer_Customer_ID`)
  REFERENCES `simple_banking_system`.`customer` (`Customer_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `simple_banking_system`.`transaction` 
ADD CONSTRAINT `fk_transaction_account1`
  FOREIGN KEY (`account_account_ID` , `account_customer_Customer_ID`)
  REFERENCES `simple_banking_system`.`account` (`account_ID` , `customer_Customer_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- PHASE 1  Getting Started with SQL and Databases
CREATE DATABASE banking;
USE banking;
SHOW databases;
SHOW tables;


-- PHASE 2 Database Tables and Schemas
DESCRIBE customer_table;
DESCRIBE account_table;
DESCRIBE transaction_table;


-- PHASE 3 Writing Your First SQL Queries
SELECT * FROM customer_table; -- selecting all the customers in the customer_table with the use of *
SELECT first_name, last_name, email FROM customer_table; -- this only brings out the first name of the customers.
SELECT * FROM customer_table
WHERE City = 'Lagos'; -- This is a condition where only customers in lagos are searched for.
SELECT * FROM customer_table
WHERE Created_At > 3/2/2024; -- this is a condition used to bring out customers who created their accounts after 3/2/2024

SELECT * FROM transaction_table
WHERE transaction_type = 'Deposit'; -- this only brings out the types of transactions done in the transaction table.

SELECT first_name, last_name 
FROM customer_table
WHERE city = 'Abuja'; -- this is a condition that returns customers that lives in Abuja with the comination of different operators.


-- PHASE 4  Comparison and Logical Operators 
SELECT * FROM account_table;
SELECT balance FROM account_table
WHERE balance > 100000; -- these are customers who has more than a hundred thousand in their account.alter

SELECT * FROM customer_table
WHERE city = 'Abuja' OR city = 'Lagos'; -- this shows customers in Abuja and Lagos

SELECT * FROM account_table
WHERE Status <> 'Active'; -- This shows account that isn't active any longer.

SELECT * FROM transaction_table -- This shows customers that has from 1000 to 10000 in their accounts
WHERE amount BETWEEN 1000 AND 10000;

SELECT * FROM customer_table
WHERE city = 'Lagos' AND country = 'Nigeria'; -- this retrieve customers in Lagos, Nigeria.


-- PHASE 5
SELECT * FROM customer_table
ORDER BY First_Name ASC; -- This arranges the customers name in aphabeltical orderfrom A to Z

SELECT * FROM account_table
ORDER BY balance DESC; -- This pulls out accounts with the highest balance first to the lowest

SELECT DISTINCT city FROM customer_table; -- this retrieves the each city the bank works with

SELECT * FROM transaction_table
ORDER BY amount DESC
LIMIT 5; -- this shows the top five largest transaction done by the customers in this bank

SELECT * FROM transaction_table
ORDER BY amount DESC
LIMIT 5 OFFSET 2; -- this shows the next five transaction aside the top first five transactions done

