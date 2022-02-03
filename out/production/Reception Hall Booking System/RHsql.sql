sudo mysql -u root -h localhost -p1234

DROP DATABASE IF EXISTS Reception_Hall;
CREATE DATABASE IF NOT EXISTS Reception_Hall;
USE Reception_Hall;
#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
DROP TABLE IF EXISTS `Customer`;

CREATE TABLE IF NOT EXISTS `Customer`(
    Customer_Id VARCHAR(15) NOT NULL,
    Customer_Name VARCHAR(45) NOT NULL DEFAULT 'UnKnown',
    Customer_Address TEXT,
    Customer_Email VARCHAR(45) NOT NULL DEFAULT 'No-Email',
    Customer_Telephone VARCHAR(15) NOT NULL DEFAULT 'No-Contact',
    CONSTRAINT PRIMARY KEY (Customer_Id));

SHOW TABLES;
DESC `Customer`;
#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
DROP TABLE IF EXISTS `Package`;

CREATE TABLE IF NOT EXISTS `Package`(
    Package_Id VARCHAR(15) NOT NULL,
    Package_Name VARCHAR(45) NOT NULL DEFAULT 'UnKnown Package',
    Package_Cost DOUBLE,
    Package_Description TEXT,
    CONSTRAINT PRIMARY KEY (Package_Id));

SHOW TABLES;
DESC `Package`;
SELECT * FROM `Package`;
#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#

DROP TABLE IF EXISTS `Book`;

CREATE TABLE IF NOT EXISTS `Book`(
    Book_Id VARCHAR(15) NOT NULL,
    Book_Date DATE,
    Reservation_Date DATE,
    Full_Cost DOUBLE,
    Cust_Id VARCHAR(15),
    Pack_Id VARCHAR(15),
    CONSTRAINT PRIMARY KEY (Book_Id),
    CONSTRAINT FOREIGN KEY (Cust_Id) REFERENCES Customer(Customer_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (Pack_Id) REFERENCES Package(Package_Id) ON DELETE CASCADE ON UPDATE CASCADE);

SHOW TABLES;
DESC `Book`;
SELECT * FROM `Book`;

#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#

DROP TABLE IF EXISTS `Hall`;

CREATE TABLE IF NOT EXISTS `Hall`(
    Hall_Id VARCHAR(15) NOT NULL,
    Hall_Name VARCHAR(45) NOT NULL DEFAULT 'UnKnown Hall',
    Hall_Description TEXT,
    CONSTRAINT PRIMARY KEY (Hall_Id));

SHOW TABLES;
DESC `Hall`;
SELECT * FROM `Hall`;

#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#

DROP TABLE IF EXISTS `Band`;

CREATE TABLE IF NOT EXISTS `Band`(
    Band_Id VARCHAR(15) NOT NULL,
    Band_Package_Id VARCHAR(15) NOT NULL,
    Band_Name VARCHAR(45) NOT NULL DEFAULT 'UnKnown',
    Band_Cost DOUBLE,
    CONSTRAINT PRIMARY KEY (Band_Id),
    CONSTRAINT FOREIGN KEY (Band_Package_Id) REFERENCES Package (Package_Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

SHOW TABLES;
DESC `Hall`;
SELECT * FROM `Hall`;
#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#

DROP TABLE IF EXISTS `Hall_Reservation`;

CREATE TABLE IF NOT EXISTS `Hall_Reservation`(
    H_Hall_Id VARCHAR(15) NOT NULL,
    H_Package_Id VARCHAR(15) NOT NULL,
    CONSTRAINT FOREIGN KEY (H_Hall_Id) REFERENCES Hall(Hall_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (H_Package_Id) REFERENCES Package(Package_Id) ON DELETE CASCADE ON UPDATE CASCADE);

#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
DROP TABLE IF EXISTS `Payment`;

CREATE TABLE IF NOT EXISTS `Payment`(
    Payment_Id VARCHAR(15) NOT NULL,
    P_Payment_Id VARCHAR(15) NOT NULL,
    Payment_Description TEXT,
    Total_Cost DOUBLE,
    Amount_Paid DOUBLE,
    To_be_Paid DOUBLE,
    CONSTRAINT PRIMARY KEY (Payment_Id),
    CONSTRAINT FOREIGN KEY (P_Payment_Id) REFERENCES Package (Package_Id) ON DELETE CASCADE ON UPDATE CASCADE);

SHOW TABLES;
DESC `Payment`;
SELECT * FROM `Payment`;

#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#

DROP TABLE IF EXISTS `Photographer`;

CREATE TABLE IF NOT EXISTS `Photographer`(
    Photographer_Id VARCHAR(15) NOT NULL,
    Ph_Payment_Id VARCHAR(15) NOT NULL,
    Photographer_Name VARCHAR(45) NOT NULL DEFAULT 'UnKnown',
    Photographer_Cost DOUBLE,
    CONSTRAINT PRIMARY KEY (Photographer_Id),
    CONSTRAINT FOREIGN KEY (Ph_Payment_Id) REFERENCES Package (Package_Id) ON DELETE CASCADE ON UPDATE CASCADE);

SHOW TABLES;
DESC `Photographer`;
SELECT * FROM `Photographer`;


#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
DROP TABLE IF EXISTS `Car`;

CREATE TABLE IF NOT EXISTS `Car`(
    Car_Id VARCHAR(15) NOT NULL,
    Car_Package_Id VARCHAR(15) NOT NULL,
    Car_Name VARCHAR(45) NOT NULL DEFAULT 'UnKnown',
    Car_Cost DOUBLE,
    CONSTRAINT PRIMARY KEY (Car_Id),
    CONSTRAINT FOREIGN KEY (Car_Package_Id) REFERENCES Package (Package_Id) ON DELETE CASCADE ON UPDATE CASCADE);

SHOW TABLES;
DESC `Car`;
SELECT * FROM `Car`;

#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
DROP TABLE IF EXISTS `User`;

CREATE TABLE IF NOT EXISTS `User`(
    Account_Id INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    UsrName VARCHAR(45) NOT NULL,
    Password VARCHAR(45) NOT NULL,
    CONSTRAINT PRIMARY KEY (Account_Id),
    UNIQUE INDEX `Account_Id_UNIQUE`(`Account_Id` ASC) VISIBLE,
    UNIQUE INDEX `UsrName_UNIQUE`(`UsrName` ASC) VISIBLE);

INSERT INTO User (FirstName, LastName, UsrName, Password) VALUES ('Isuru','Lakmal','Isuru9924','12345678');

SELECT * FROM User;
#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#