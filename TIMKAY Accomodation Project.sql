-- This is a single line comment
/* This is a multiline comment
*/
DROP DATABASE IF EXISTS TIMKAY;
CREATE DATABASE TIMKAY;
USE TIMKAY;

/* drop all tables */
-- DROP TABLE IF EXISTS INVOICE_LINE;
-- DROP TABLE IF EXISTS ITEM;
-- DROP TABLE IF EXISTS INVOICES;
-- DROP TABLE IF EXISTS CUSTOMER;
-- DROP TABLE IF EXISTS SALES_REP;

/* create table SALES_REP */
CREATE TABLE SALES_REP
(REP_ID    CHAR(2)     PRIMARY KEY,
 FIRST_NAME  VARCHAR(30) NOT NULL,
 LAST_NAME   VARCHAR(30) NOT NULL,
 ADDRESS     VARCHAR(50),
 CITY        VARCHAR(20),
 STATE       CHAR(2),
 POSTAL      CHAR(5),
 CELL_PHONE  CHAR(12),
 COMMISSION  DECIMAL(7,2),   -- 99,999.99
 RATE        DECIMAL(3,2)    -- 9.99
);

/* insert data into the SALES_REP table */
-- INSERT INTO SALES_REP(REP_ID, FIRST_NAME, LAST_NAME) VALUES ('11','John','Smith');
-- INSERT INTO SALES_REP VALUES ('12','John','Smith', null, null, null, null, null, null, null);

insert into sales_rep values('05','Susan','Garcia',  '42 Mountain Ln','Cody',     'WY', '82414', '307-824-1245', 12743.16,	0.04);      
insert into sales_rep values('10','Richard','Miller','87 Pikes Dr',   'Ralston',  'WY', '82440', '307-406-4321', 20872.11,	0.06);     
insert into sales_rep values('15','Donna','Smith',   '312 Oak Rd',    'Powell',	  'WY', '82440', '307-982-8401', 14912.92,	0.04);          
insert into sales_rep values('20','Daniel','Jackson','19 Lookout Dr', 'Elk Butte','WY', '82433', '307-883-9481', 0.00,     	0.04);

-- selecting data from SALES_REP 
-- SELECT * FROM SALES_REP;

/* Create table customer */
CREATE TABLE CUSTOMER
 ( CUST_ID       CHAR(3) PRIMARY KEY,
   FIRST_NAME    VARCHAR(20),
   LAST_NAME     VARCHAR(20),
   ADDRESS       VARCHAR(20),
   CITY          VARCHAR(15),
   STATE         CHAR(2),
   POSTAL        CHAR(5),
   EMAIL         VARCHAR(30),
   BALANCE       DECIMAL(7,2),
   CREDIT_LIMIT  DECIMAL (7,2),
   REP_ID        CHAR(2),
   FOREIGN KEY (REP_ID) REFERENCES SALES_REP(REP_ID)
);

/*Insert data into CUSTOMER table */
INSERT INTO CUSTOMER VALUES('125','Joey'    ,'Smith',     '17 Fourth St',      'Cody',     'WY','82414','jsmith17@example.com',    80.68 ,500.00   ,'05');              
INSERT INTO CUSTOMER VALUES('182','Billy'   ,'Rufton',    '21 Simple Cir',     'Garland',  'WY','82435','billyruff@example.com',   43.13 ,750.00   ,'10');              
INSERT INTO CUSTOMER VALUES('227','Sandra'  ,'Pincher',   '53 Verde Ln',       'Powell',   'WY','82440','spinch2@example.com',     156.38,500.00   ,'15');              
INSERT INTO CUSTOMER VALUES('294','Samantha','Smith',     '14 Rock Ln',        'Ralston',  'WY','82440','ssmith5@example.com',     58.60 ,500.00   ,'10');              
INSERT INTO CUSTOMER VALUES('314','Tom'     ,'Rascal',    '1 Rascal Farm Rd',  'Cody',     'WY','82414','trascal3@example.com',    17.25 ,250.00   ,'15');              
INSERT INTO CUSTOMER VALUES('375','Melanie' ,'Jackson',   '42 Blackwater Way', 'Elk Butte','WY','82433','mjackson5@example.com',   252.25,250.00   ,'05');              
INSERT INTO CUSTOMER VALUES('435','James'   ,'Gonzalez',  '16 Rockway Rd',     'Wapiti',   'WY','82450','jgonzo@example.com',      230.40,1000.00  ,'15');              
INSERT INTO CUSTOMER VALUES('492','Elmer'   ,'Jackson',   '22 Jackson Farm Rd','Garland',  'WY','82435','ejackson4@example.com',   45.20 ,500.00   ,'10');              
INSERT INTO CUSTOMER VALUES('543','Angie'   ,'Hendricks', '27 Locklear Ln',    'Powell',   'WY','82440','ahendricks7@example.com', 315.00,750.00   ,'05');              
INSERT INTO CUSTOMER VALUES('616','Sally'   ,'Cruz',      '199 18th Ave',      'Ralston',  'WY','82440','scruz5@example.com',      8.33  ,500.00   ,'15');              
INSERT INTO CUSTOMER VALUES('721','Leslie'  ,'Smith',     '123 Sheepland Rd',  'Elk Butte','WY','82433','lsmith12@example.com',    166.65,1000.00  ,'10');              
INSERT INTO CUSTOMER VALUES('795','Randy'   ,'Blacksmith','75 Stream Rd',      'Cody',     'WY','82414','rblacksmith6@example.com',61.50 ,500.00   ,'05');  

-- SELECT * FROM CUSTOMER;

/* Create table INVOICES */
CREATE TABLE INVOICES
(INVOICE_NUM   CHAR(5) PRIMARY KEY,
 INVOICE_DATE  DATE,
 CUST_ID       CHAR(3),
 FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID)
);

/* Insert data into INVOICE table */
INSERT INTO INVOICES VALUES('14216','2021-11-15','125');      
INSERT INTO INVOICES VALUES('14219','2021-11-15','227');      
INSERT INTO INVOICES VALUES('14222','2021-11-16','294');      
INSERT INTO INVOICES VALUES('14224','2021-11-16','182');      
INSERT INTO INVOICES VALUES('14228','2021-11-18','435');      
INSERT INTO INVOICES VALUES('14231','2021-11-18','125');      
INSERT INTO INVOICES VALUES('14233','2021-11-18','435');      
INSERT INTO INVOICES VALUES('14237','2021-11-19','616'); 

/* Create table ITEM */
CREATE TABLE ITEM
(  ITEM_ID         CHAR(4)   PRIMARY KEY,
   DESCRIPTION     VARCHAR(30),
   ON_HAND         INT,
   CATEGORY        CHAR(3),
   LOCATION        CHAR(1),
   PRICE           DECIMAL(7,2)
);

/* Interserting data into ITEM table */
INSERT INTO ITEM VALUES('AD72','Dog Feeding Station'           ,'12','DOG','B',79.99 );
INSERT INTO ITEM VALUES('BC33','Feathers Bird Cage (12x24x18)' ,'10','BRD','B',79.99 );
INSERT INTO ITEM VALUES('CA75','Enclosed Cat Litter Station'   ,'15','CAT','C',39.99 );
INSERT INTO ITEM VALUES('DT12','Dog Toy Gift Set'              ,'27','DOG','B',39.99 );
INSERT INTO ITEM VALUES('FM23','Fly Mask with Ears'            ,'41','HOR','C',24.95 );
INSERT INTO ITEM VALUES('FS39','Folding Saddle Stand'          ,'12','HOR','C',39.99 );
INSERT INTO ITEM VALUES('FS42','Aquarium (55 Gallon)'          ,'5','FSH','A',124.99);
INSERT INTO ITEM VALUES('KH81','Wild Bird Food (25 lb)'        ,'24','BRD','C',19.99 );
INSERT INTO ITEM VALUES('LD14','Locking Small Dog Door'        ,'14','DOG','A',49.99 );
INSERT INTO ITEM VALUES('LP73','Large Pet Carrier'             ,'23','DOG','B',59.99 );
INSERT INTO ITEM VALUES('PF19','Pump & Filter Kit'             ,'5','FSH','A',74.99 );
INSERT INTO ITEM VALUES('QB92','Quilted Stable Blanket'        ,'32','HOR','C',119.99);
INSERT INTO ITEM VALUES('SP91','Small Pet Carrier'             ,'18','CAT','B',39.99 );
INSERT INTO ITEM VALUES('UF39','Underground Fence System'      ,'7','DOG','A',199.99);
INSERT INTO ITEM VALUES('WB49','Insulated Water Bucket'        ,'34','HOR','C',79.99 );

-- SELECT * FROM ITEM;

/* Create table INVOICE LINE */
CREATE TABLE INVOICE_LINE
(  INVOICE_NUM       CHAR(5),
   ITEM_ID           CHAR(4),
   QUANTITY          INT,
   QUOTED_PRICE      DECIMAL(7,2),
   PRIMARY KEY (INVOICE_NUM, ITEM_ID),
   FOREIGN KEY (INVOICE_NUM) REFERENCES INVOICES(INVOICE_NUM),
   FOREIGN KEY (ITEM_ID) REFERENCES ITEM(ITEM_ID)
);

/*Inserting data into INVOICE_LINE */
INSERT INTO INVOICE_LINE VALUES('14216','CA75',3,37.99 );               
INSERT INTO INVOICE_LINE VALUES('14219','AD72',2,79.99 );               
INSERT INTO INVOICE_LINE VALUES('14219','DT12',4,39.99 );               
INSERT INTO INVOICE_LINE VALUES('14222','LD14',1,47.99 );               
INSERT INTO INVOICE_LINE VALUES('14224','KH81',4,18.99 );               
INSERT INTO INVOICE_LINE VALUES('14228','FS42',1,124.99);               
INSERT INTO INVOICE_LINE VALUES('14228','PF19',1,74.99 );               
INSERT INTO INVOICE_LINE VALUES('14231','UF39',2,189.99);               
INSERT INTO INVOICE_LINE VALUES('14233','KH81',1,19.99 );               
INSERT INTO INVOICE_LINE VALUES('14233','QB92',4,109.95);               
INSERT INTO INVOICE_LINE VALUES('14233','WB49',4,74.95 );               
INSERT INTO INVOICE_LINE VALUES('14237','LP73',3,54.95 ); 

-- SELECT * FROM INVOICE_LINE;
COMMIT;    

/* continuation with multiple table diagram */ 

use timkay;


-- Joining two tables
-- 1) List the ID, first name, last name of each customer, together with the ID, first name, and last name of the sales rep who represents the customer

SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, SR.REP_ID, SR.FIRST_NAME, SR.LAST_NAME
FROM SALES_REP SR, CUSTOMER C 
WHERE SR.REP_ID = C.REP_ID;

/* another of writing the above code */
SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, SR.REP_ID, SR.FIRST_NAME, SR.LAST_NAME
FROM SALES_REP SR INNER JOIN CUSTOMER C ON (SR.REP_ID = C.REP_ID);


SELECT * FROM CUSTOMER;

-- 2) List the ID, first name, and last name of each customer whose credit limit is $500, together with the ID, first name, and last name of the sales rep who represents the customer.
SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, SR.REP_ID, SR.FIRST_NAME, SR.LAST_NAME, C.CREDIT_LIMIT
FROM SALES_REP SR, CUSTOMER C 
WHERE SR.REP_ID = C.REP_ID
AND C.CREDIT_LIMIT = 500;

SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, SR.REP_ID, SR.FIRST_NAME, SR.LAST_NAME, C.CREDIT_LIMIT
FROM SALES_REP SR INNER JOIN CUSTOMER C ON (SR.REP_ID = C.REP_ID)
WHERE C.CREDIT_LIMIT = 500;

-- 3) For every item on an invoice, list the invoice number, item ID, description, quantity ordered, quoted prices and unit price. 
DESCRIBE INVOICE_LINE;
DESCRIBE ITEM;

SELECT IL.INVOICE_NUM, IL.ITEM_ID, I.DESCRIPTION, IL.QUANTITY, IL.QUOTED_PRICE, I.PRICE
FROM ITEM I, INVOICE_LINE IL
WHERE I.ITEM_ID = IL.ITEM_ID;

SELECT IL.INVOICE_NUM, IL.ITEM_ID, I.DESCRIPTION, IL.QUANTITY, IL.QUOTED_PRICE, I.PRICE
FROM ITEM I INNER JOIN INVOICE_LINE IL ON (I.ITEM_ID = IL.ITEM_ID); 

-- Comparing Joins, IN, and Exists operators
-- Write following query using Join and IN operators
-- 4) Find the description of each item included in invoice number 14233.
SELECT I. DESCRIPTION
FROM ITEM I, INVOICE_LINE IL
WHERE I.ITEM_ID = IL.ITEM_ID
AND IL.INVOICE_NUM = '14233' ;

-- Using the EXISTS operator
-- 5) Find the invoice number and invoice date for each invoice that contains item ID KH81.
SELECT I.INVOICE_NUM, I.INVOICE_DATE
FROM INVOICES I, INVOICE_LINE IL
WHERE I.INVOICE_NUM = IL.INVOICE_NUM
AND IL.ITEM_ID = 'KH81';

SELECT I.INVOICE_NUM, I.INVOICE_DATE
FROM INVOICES I
WHERE EXISTS (SELECT *
                FROM INVOICE_LINE IL
                WHERE (I.INVOICE_NUM = IL.INVOICE_NUM)
                AND (IL.ITEM_ID = 'KH81'));
                

SELECT I.INVOICE_NUM, I.INVOICE_DATE
FROM INVOICES I
WHERE I.INVOICE_NUM IN (SELECT IL.INVOICE_NUM
                FROM INVOICE_LINE IL
                WHERE (I.INVOICE_NUM = IL.INVOICE_NUM)
                AND (IL.ITEM_ID = 'KH81'));

-- Using a Subquery Within a Subquery
-- 6) Find the invoice number and invoice date for each invoice that includes an item stored in location C.
SELECT INVOICE_NUM, INVOICE_DATE
FROM INVOICES
WHERE INVOICE_NUM IN (SELECT DISTINCT INVOICE_NUM
							FROM INVOICE_LINE
							WHERE ITEM_ID IN (SELECT ITEM_ID
												FROM ITEM
												WHERE LOCATION = 'C'));

-- A comprehensive Example with all the major clauses
-- 7) List the customer ID, invoice number, invoice date, invoice total for each invoice 
-- with a total that exceeds $250. Assign the column name INVOICE_TOTAL to the column 
-- that displays invoice totals. Order the results by invoice number.
SELECT I.CUST_ID, I.INVOICE_NUM, I.INVOICE_DATE, SUM(IL.QUANTITY * IL.QUOTED_PRICE)
FROM INVOICES I, INVOICE_LINE IL
WHERE I.INVOICE_NUM = IL.INVOICE_NUM
GROUP BY I.CUST_ID, I.INVOICE_NUM, I.INVOICE_DATE
HAVING SUM(IL.QUANTITY * IL.QUOTED_PRICE) > 250
ORDER BY INVOICE_NUM;

-- Using an Alias
-- 8) List the ID, first name, and last name for each sales rep together with the ID,
-- first, and last name for each customer the sales rep represents. 
SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, SR.REP_ID, SR.FIRST_NAME, SR.LAST_NAME
FROM SALES_REP SR, CUSTOMER C 
WHERE SR.REP_ID = C.REP_ID;

-- Self Join
-- 9) For each pair of customers located in the same city, display the customer ID, first name, last name, and city.
SELECT F.CUST_ID, F.FIRST_NAME, F.LAST_NAME, S.CUST_ID, S.FIRST_NAME, S.LAST_NAME, F.CITY
FROM CUSTOMER F, CUSTOMER S 
WHERE F.CITY = S.CITY
AND F.CUST_ID < S.CUST_ID
ORDER BY F.CUST_ID;

-- Joining Several Tables
-- 10) For each item on an invoice, list the item ID, quantity ordered, invoice number, invoice date, 
-- customer ID, customer first name, and customer last name, along with the last name of the sales rep who represents each customer.
SELECT IL.ITEM_ID, IL.QUANTITY, I.INVOICE_NUM, I.INVOICE_DATE, C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, SR.LAST_NAME
FROM SALES_REP SR, CUSTOMER C, INVOICES I, INVOICE_LINE IL
WHERE SR.REP_ID = C.REP_ID
AND C.CUST_ID = I.CUST_ID
AND I.INVOICE_NUM = IL.INVOICE_NUM;

SELECT IL.ITEM_ID, IL.QUANTITY, I.INVOICE_NUM, I.INVOICE_DATE, C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, SR.LAST_NAME
FROM SALES_REP SR INNER JOIN CUSTOMER C ON (SR.REP_ID = C.REP_ID)
					INNER JOIN INVOICES I ON (C.CUST_ID = I.CUST_ID)
						INNER JOIN INVOICE_LINE IL ON (I.INVOICE_NUM = IL.INVOICE_NUM)
                        
-- SET Operations
-- 11) List the ID and names of each customer that is either represented 
-- by sales rep 10 or currently has invoices on file, or both.
SELECT CUST_ID, FIRST_NAME, LAST_NAME 
FROM CUSTOMER
WHERE REP_ID = '10'
UNION
SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME 
FROM CUSTOMER C, INVOICES I
WHERE C.CUST_ID = I.CUST_ID
ORDER BY CUST_ID;

-- 12) List the ID and names of each customer that is represented by sales rep 10 and that currently has invoices on file.
SELECT CUST_ID, FIRST_NAME, LAST_NAME 
FROM CUSTOMER
WHERE REP_ID = '10'
AND CUST_ID IN (SELECT CUST_ID
					FROM INVOICES);

-- 13) List the ID and names of each customer that is represented by sales rep 10 but that does not have invoices currently on file.
SELECT CUST_ID, FIRST_NAME, LAST_NAME 
FROM CUSTOMER
WHERE REP_ID = '10'
AND CUST_ID NOT IN (SELECT CUST_ID
					FROM INVOICES);

-- ALL and ANY OPERATOR
-- 14) Find the customer ID, full name, current balance, and sales rep ID of each customer 
-- whose balance exceeds the maximum balance of all customers represented by sales rep 10.
SELECT CUST_ID, FIRST_NAME, LAST_NAME, BALANCE, REP_ID
FROM CUSTOMER
WHERE BALANCE > (SELECT MAX(BALANCE)
				FROM CUSTOMER
                WHERE REP_ID = 10)
ORDER BY BALANCE;

SELECT CUST_ID, FIRST_NAME, LAST_NAME, BALANCE, REP_ID
FROM CUSTOMER
WHERE BALANCE > ALL (SELECT BALANCE
				FROM CUSTOMER
				WHERE REP_ID = 10);

-- 15) Find the customer ID, full name, current balance, and sales rep ID of each customer whose 
-- balance is greater than the balance of at least one customer of sales rep 10.
SELECT CUST_ID, FIRST_NAME, LAST_NAME, BALANCE, REP_ID
FROM CUSTOMER
WHERE BALANCE > (SELECT MIN(BALANCE)
				FROM CUSTOMER
                WHERE REP_ID = 10)
ORDER BY BALANCE;

SELECT CUST_ID, FIRST_NAME, LAST_NAME, BALANCE, REP_ID
FROM CUSTOMER
WHERE BALANCE > ANY (SELECT BALANCE
				FROM CUSTOMER
				WHERE REP_ID = 10);

SELECT BALANCE
				FROM CUSTOMER
                WHERE REP_ID = 10;

-- Inner join
-- 16) Display the ID, first name, and last name for each customer, along with the invoice number,
-- invoice date for each invoice. Sort the results by customer ID.
SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, I.INVOICE_NUM, I.INVOICE_DATE
FROM CUSTOMER C INNER JOIN INVOICES I ON (C.CUST_ID = I.CUST_ID)
ORDER BY C.CUST_ID;


-- Outer Join
-- 17) Display the ID, first name, and last name for each customer, along with the invoice number, and 
-- invoice date for all invoices. Include all customers in the results. For customers that do not have invoices, 
-- omit the invoice number and invoice date.
SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, I.INVOICE_NUM, I.INVOICE_DATE
FROM CUSTOMER C LEFT OUTER JOIN INVOICES I ON (C.CUST_ID = I.CUST_ID);

SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, I.INVOICE_NUM, I.INVOICE_DATE
FROM INVOICES I RIGHT OUTER JOIN CUSTOMER C ON (C.CUST_ID = I.CUST_ID);

-- Cartesian product
-- 18) Form the product of the CUSTOMER and INVOICES tables. Display the customer ID, first name, and last name from the CUSTOMER table, 
-- along with the invoice number and invoice date from the INVOICES table.
SELECT C.CUST_ID, C.FIRST_NAME, C.LAST_NAME, I.INVOICE_NUM, I.INVOICE_DATE
FROM CUSTOMER C, INVOICES I;


/* ----------------------------------------------------------------- */
