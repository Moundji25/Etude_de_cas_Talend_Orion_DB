CREATE DATABASE IF NOT EXISTS Orion_db;
CREATE USER 'ETLUser'@'localhost' IDENTIFIED BY 'groupesix';
GRANT SELECT, INSERT, UPDATE ON Orion_db.* TO 'ETLUser'@'localhost';
USE Orion_db;
/****** Object: Table dbo.Customer_Dim Script Date: 10/11/2018 17:48:08 ******/

DROP TABLE if exists Orion_db.Customer_Dim;
CREATE TABLE `Customer_Dim` (
`Customer_ID` int NOT NULL,
`Customer_Country` varchar(2) DEFAULT NULL,
`Customer_Group` varchar(40) DEFAULT NULL,
`Customer_Type` varchar(40) DEFAULT NULL,
`Customer_Gender` varchar(1) DEFAULT NULL,
`Customer_Age_Group` varchar(12) DEFAULT NULL,
`Customer_Age` smallint DEFAULT NULL,
`Customer_Name` varchar(40) DEFAULT NULL,
`Customer_Fisrtname` varchar(20) DEFAULT NULL,
`Customer_Lastname` varchar(30) DEFAULT NULL,
`Customer_Birth_Date` date DEFAULT NULL,
PRIMARY KEY (Customer_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
DROP TABLE if exists Orion_db.Product_Dim;
CREATE TABLE `Product_Dim` (
`Product_ID` bigint NOT NULL,
`Product_Line` varchar(20) DEFAULT NULL,
`Product_Category` varchar(25) DEFAULT NULL,
`Product_Group` varchar(25) DEFAULT NULL,
`Product_Name` varchar(45) DEFAULT NULL,
`Supplier_Country` varchar(2) DEFAULT NULL,
`Supplier_Name` varchar(30) DEFAULT NULL,
`Supplier_ID` int DEFAULT NULL,
PRIMARY KEY (Product_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE if exists Orion_db.Organization_Dim;
CREATE TABLE Organization_Dim (
Employee_ID INTEGER NOT NULL,
Employee_Country VARCHAR(3),
Company VARCHAR(40),
Department VARCHAR(40),
Section VARCHAR(40),
Org_Group VARCHAR(40),
Job_Title VARCHAR(25),
Employee_Name VARCHAR(40),
Employee_Gender CHARACTER(1),
Salary DECIMAL(13),
Employee_Birth_Date DATE,
Employee_Hire_Date DATE,
Employee_Term_Date DATE,
PRIMARY KEY (Employee_ID)
);

DROP TABLE if exists Orion_db.Geography_Dim;
CREATE TABLE Geography_Dim (
Street_ID bigint NOT NULL,
Continent VARCHAR(30),
Country VARCHAR(2),
State_Code VARCHAR(2),
State VARCHAR(25),
Region VARCHAR(30),
Province VARCHAR(30),
County VARCHAR(60),
City VARCHAR(30),
Postal_Code VARCHAR(10),
Street_Name VARCHAR(45),
PRIMARY KEY (Street_ID)
);

DROP TABLE if exists Orion_db.Order_Fact;
CREATE TABLE Order_Fact (
Customer_ID INTEGER,
Employee_ID INTEGER,
Street_ID bigint,
Product_ID bigint,
Order_Date DATE,
Order_ID INTEGER,
Order_Type SMALLINT,
Delivery_Date DATE,
Quantity SMALLINT,
Total_Retail_Price DECIMAL(13,2),
Costprice_Per_Unit DECIMAL(13,2),
Discount DECIMAL(5,2),
PRIMARY KEY (Order_ID)
);

DROP TABLE if exists Orion_db.Time_Dim;
CREATE TABLE Time_Dim (
Date_ID DATE NOT NULL,
Year_ID CHARACTER(4),
Quarter CHARACTER(6),
Month_Name VARCHAR(20),
Weekday_Name VARCHAR(20),
Month_Num SMALLINT,
Weekday_Num SMALLINT,
PRIMARY KEY (Date_ID)
);

DELIMITER $$

CREATE PROCEDURE FillTimeDim()
BEGIN
    DECLARE currentDate DATE;
    DECLARE endDate DATE;
    SET currentDate = '1978-01-01';
    SET endDate = '2005-01-01';
    
    WHILE currentDate <= endDate DO
        INSERT INTO Time_Dim (
            Date_ID,
            Year_ID,
            Quarter,
            Month_Name,
            Weekday_Name,
            Month_Num,
            Weekday_Num
        )
        VALUES (
            currentDate,
            YEAR(currentDate),
            CONCAT('Q', QUARTER(currentDate)),
            MONTHNAME(currentDate),
            DAYNAME(currentDate),
            MONTH(currentDate),
            DAYOFWEEK(currentDate)
        );
        SET currentDate = DATE_ADD(currentDate, INTERVAL 1 DAY);
    END WHILE;
END$$

DELIMITER ;

CALL FillTimeDim();

DROP PROCEDURE IF EXISTS FillTimeDim;



