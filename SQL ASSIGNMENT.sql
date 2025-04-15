-- Database Creation
DROP DATABASE IF EXISTS SalesDB;
CREATE DATABASE SalesDB;
USE SalesDB;

-- Table Creation
CREATE TABLE Supplier (	SUPP_ID INT NOT NULL PRIMARY KEY, SUPP_NAME VARCHAR(50) NOT NULL,
						SUPP_CITY VARCHAR(50) NOT NULL, SUPP_PHONE VARCHAR(50) NOT NULL
                        );
                        
CREATE TABLE Customer (	CUS_ID INT NOT NULL PRIMARY KEY, CUS_NAME VARCHAR(20) NOT NULL,
						CUS_PHONE VARCHAR(10) NOT NULL, CUS_CITY VARCHAR(30) NOT NULL,
                        CUS_GENDER CHAR
                        );
                        
CREATE TABLE Category (	CAT_ID INT NOT NULL PRIMARY KEY, CAT_NAME VARCHAR(20) NOT NULL
						);
                        
CREATE TABLE Product (	PRO_ID INT NOT NULL PRIMARY KEY, `PRO_NAME V` VARCHAR(20) NOT NULL DEFAULT "Dummy",
						PRO_DESC VARCHAR(60), CAT_ID INT,
                        FOREIGN KEY (CAT_ID) REFERENCES Category(CAT_ID)
                        );
                        
CREATE TABLE Supplier_pricing (	PRICING_ID INT NOT NULL PRIMARY KEY, PRO_ID INT,
								SUPP_ID INT, SUPP_PRICE INT DEFAULT 0,
                                FOREIGN KEY (PRO_ID) REFERENCES Product(PRO_ID),
                                FOREIGN KEY (SUPP_ID) REFERENCES Supplier(SUPP_ID)
								);
                                
CREATE TABLE `Order` (	ORD_ID INT NOT NULL PRIMARY KEY, ORD_AMOUNT INT NOT NULL,
						ORD_DATE DATE NOT NULL, CUS_ID INT, PRICING_ID INT,
                        FOREIGN KEY (CUS_ID) REFERENCES Customer(CUS_ID),
                        FOREIGN KEY (PRICING_ID) REFERENCES Supplier_pricing(PRICING_ID)
                        );
                        
CREATE TABLE Rating (	RAT_ID INT NOT NULL PRIMARY KEY, ORD_ID INT,
						RAT_RATSTARS INT NOT NULL,
                        FOREIGN KEY (ORD_ID) REFERENCES `Order` (ORD_ID)
                        );
   
-- Insert data into the tables
INSERT INTO Supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
	VALUES	(1, 'Rajesh Retails', 'Delhi', '1234567890'), (2, 'Appario Ltd', 'Mumbai', '2589631470'),
            (3, 'Knome products', 'Banglore', '9785462315'), (4, 'Bansal Retails', 'Kochi', '8975463285'),
            (5, 'Mittal Ltd.', 'Luvknow', '7898456532');
            
INSERT INTO Customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
	VALUES	(1, 'AAKASH', '9999999999', 'DELHI', 'M'), (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
			(3, 'NEHA', '9999999999', 'MUMBAI', 'F'), (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
            (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');
            
INSERT INTO Category (CAT_ID, CAT_NAME)
	VALUES	(1, 'BOOKS'), (2, 'GAMES'), (3, 'GROCERIES'), (4, 'ELECTRONICS'), (5, 'CLOTHES');
    
INSERT INTO Product (PRO_ID, `PRO_NAME V`, PRO_DESC, CAT_ID)
	VALUES	(1,	'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
			(2,	'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
			(3,	'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
			(4,	'OATS', 'Highly Nutritious from Nestle', 3),
			(5,	'HARRY POTTER','Best Collection of all time by J.K Rowling', 1),
			(6,	'MILK', '1L Toned MIlk', 3),
			(7,	'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
			(8,	'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
			(9,	'Project IGI', 'compatible with windows 7 and above', 2),
			(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
			(12, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
			(13, 'Train Your Brain', 'By Shireen Stephen', 1);

INSERT INTO Supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
	VALUES 	(1, 1, 2, 1500), (2, 3, 5, 30000), (3, 5, 1, 3000), (4, 2, 3, 2500), (5, 4, 1, 1000);

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `Order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
	VALUES 	(101, 1500,'2021-10-06', 2, 1), (102, 1000, '2021-10-12', 3, 5), (103, 30000, '2021-09-16', 5, 2),
			(104, 1500, '2021-10-05', 1, 1), (105, 3000, '2021-08-16', 4, 3), (106, 1450, '2021-08-18', 1, 9),
			(107, 789, '2021-09-01', 3, 7), (108, 780, '2021-09-07', 5, 6), (109, 3000, '2021-00-10', 5, 3),
			(110, 2500, '2021-09-10', 2, 4), (111, 1000, '2021-09-15', 4, 5), (112, 789, '2021-09-16', 4, 7),
			(113, 31000, '2021-09-16', 1, 8), (114, 1000, '2021-09-16', 3, 5), (115, 3000, '2021-09-16', 5, 3),
			(116, 99, '2021-09-17', 2, 14);
SET FOREIGN_KEY_CHECKS=1;
            
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO Rating (RAT_ID, ORD_ID, RAT_RATSTARS)
	VALUES 	(1, 101, 4), (2, 102, 3), (3, 103, 1), (4, 104, 2), (5, 105, 4),
			(6, 106, 3), (7, 107, 4), (8, 108, 4), (9, 109, 3), (10, 110, 5),
			(11, 111, 3), (12, 112, 4), (13, 113, 2), (14, 114, 1), (15, 115, 1),
			(16, 116, 0);
SET FOREIGN_KEY_CHECKS=1;


-- QUESTION 3: Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
SELECT CUS_GENDER AS `Gender`, COUNT(CUS_GENDER) AS `no_of_customers` FROM Customer
	LEFT JOIN `Order` ON Customer.CUS_ID = `Order`.CUS_ID
    WHERE ORD_AMOUNT >= 3000
    GROUP BY CUS_GENDER;
    
-- Question 4: Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT ORD_ID AS `Order Id`, `PRO_NAME V` AS `Product Name` FROM `Order`
	LEFT JOIN Supplier_pricing ON `Order`.PRICING_ID = Supplier_pricing.PRICING_ID
    LEFT JOIN Product ON Supplier_pricing.PRO_ID = Product.PRO_ID
    WHERE CUS_ID = 2;
    
-- Question 5:  Display the Supplier details who can supply more than one product. 
SELECT * FROM Supplier
	WHERE SUPP_ID IN (	SELECT SUPP_ID FROM Supplier_pricing
							GROUP BY SUPP_ID
							HAVING COUNT(DISTINCT PRO_ID) > 1
					 );
                     
-- Question 6: Find the least expensive product from each category and print the table with category id,
-- name, product name and price of the product 
SELECT Category.CAT_ID, Category.CAT_NAME, `PRO_NAME V` AS `Product Name`, MIN(SUPP_PRICE) AS `Product Price` FROM Supplier_pricing
	LEFT JOIN Product ON Supplier_pricing.PRO_ID = Product.PRO_ID
    LEFT JOIN Category ON Product.CAT_ID = Category.CAT_ID
    GROUP BY Category.CAT_ID, Category.CAT_NAME;
    
-- Question 7: Display the Id and Name of the Product ordered after "2021-10-05".
SELECT Product.PRO_ID, `PRO_NAME V` AS `PRODUCT NAME` FROM PRODUCT
	LEFT JOIN Supplier_pricing ON Product.PRO_ID = Supplier_pricing.PRO_ID
    LEFT JOIN `Order` ON Supplier_pricing.PRICING_ID = `Order`.PRICING_ID
    WHERE ORD_DATE > '2021-10-05';
    
-- Question 8: Display customer name and gender whose names start or end with character 'A'.
SELECT CUS_NAME, CUS_GENDER FROM Customer
	WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
    
-- Question 9: Create a stored procedure to display supplier id, name, rating and Type_of_Service.
-- For Type_of_Service, If rating =5, print "Excellent Service",If rating >4 print "Good Service", 
-- If rating >2 print "Average Service" else print "Poor Service".

DROP PROCEDURE IF EXISTS RatingPro;
DELIMITER $$
CREATE PROCEDURE Supplier_ratings()
	BEGIN
    SELECT Supplier.SUPP_ID, SUPP_NAME, RAT_RATSTARS,
		CASE
			WHEN RAT_RATSTARS = 5 THEN 'Excellent Service'
			WHEN RAT_RATSTARS > 4 THEN 'Good Service'
			WHEN RAT_RATSTARS > 2 THEN 'Average Service'
			ELSE 'Poor Service'
		END AS Type_of_Service
		FROM Rating INNER JOIN `Order` ON Rating.ORD_ID = `Order`.ORD_ID
		INNER JOIN Supplier_pricing ON `Order`.PRICING_ID = Supplier_pricing.PRICING_ID
		INNER JOIN Supplier ON Supplier_pricing.SUPP_ID = Supplier.SUPP_ID;
    END $$
DELIMITER ;

-- Lets call the Storedprocedure
CALL Supplier_ratings();