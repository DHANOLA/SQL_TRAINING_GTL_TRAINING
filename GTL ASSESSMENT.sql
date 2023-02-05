-- CREATING THE DATABASE

CREATE DATABASE ASSESSMENT;

-- CREATE THE SCHEMA AFTER CHANGING THE DATABASE

CREATE SCHEMA ASSESSMENT;


-- CREATE THE ORDERS TABLE 

CREATE TABLE IF NOT EXISTS ASSESSMENT.ORDERS
(
    "ROW_ID" DOUBLE PRECISION,
    "ORDER_ID" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "ORDER_DATE" TIMESTAMP WITHOUT TIME ZONE,
    "SHIP_DATE" TIMESTAMP WITHOUT TIME ZONE,
    "SHIP_MODE" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "CUSTOMER_ID" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "CUSTOMER_NAME" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "SEGMENT" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "COUNTRY" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "CITY" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "STATE" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "POSTAL CODE" DOUBLE PRECISION,
    "REGION" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "PRODUCT_ID" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "CATEGORY" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "SUB-CATEGORY" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "PRODUCT_NAME" CHARACTER VARYING(255) COLLATE pg_catalog."default",
    "SALES" DOUBLE PRECISION,
    "QUANTITY" DOUBLE PRECISION,
    "DISCOUNT" DOUBLE PRECISION,
    "PROFIT" DOUBLE PRECISION
);

SELECT * from assessment.orders



-- CREATE THE PROPLE TABLE 

CREATE TABLE ASSESSMENT.ASSESSMENT.PEOPLE(

	PERSON VARCHAR(100),
	
	REGION VARCHAR(50)

);

-- CREATE THE RETURNS TABLE 

CREATE TABLE ASSESSMENT.ASSESSMENT.RETURNS(

	RETURNED VARCHAR(10),
	
	ORDER_ID INTEGER
	
);

ALTER TABLE ASSESSMENT.ASSESSMENT.RETURNS 
ALTER COLUMN ORDER_ID TYPE VARCHAR(50);

--CREATE THE TABLE SQL_REGION TABLE

CREATE TABLE ASSESSMENT.ASSESSMENT.SQL_REGION(

		ID FLOAT8 PRIMARY KEY,
	
		NAME VARCHAR(100)

);

--CREATE THE TABLE SQL_SALES TABLE

CREATE TABLE ASSESSMENT.ASSESSMENT.SQL_SALES(

		ID FLOAT8 PRIMARY KEY,
	
		NAME VARCHAR(100),
	
		REGION_ID FLOAT8

);

--CREATE THE TABLE SQL_ORDERS TABLE

CREATE TABLE ASSESSMENT.ASSESSMENT.SQL_ORDERS(

		ID FLOAT8 PRIMARY KEY,
	
		ACCOUNT_ID FLOAT8,
	
		OCCURRED_AT VARCHAR(100),
	
		STANDARD_QTY FLOAT8,
	
		GLOSS_QTY FLOAT8,
	
		POSTER_QTY FLOAT8,
	
		TOTAL FLOAT8,
	
		STANDARD_AMT_USD FLOAT8,
	
		GLOSS_AMT_USD FLOAT8,
	
		POSTER_AMT_USD FLOAT8,
	
		TOTAL_AMT_USD FLOAT8
	

);

--CREATE THE TABLE SQL_ACCOUNTS TABLE

CREATE TABLE ASSESSMENT.ASSESSMENT.SQL_ACCOUNTS(

		ID FLOAT8 PRIMARY KEY,
	
		NAME VARCHAR(100),
	
		WEBSITE VARCHAR(500),
	
		LAT FLOAT8,
	
		LONG FLOAT8,
	
		PRIMARY_POC VARCHAR(100),
	
		SALES_REP_ID FLOAT8

);





--TABLES AFTER IMPORT OF CSV'S

-- ORDERS TABLE

SELECT * FROM ASSESSMENT.ASSESSMENT.ORDERS;



-- ORDERS PEOPLE

SELECT * FROM ASSESSMENT.ASSESSMENT.PEOPLE;

-- ORDERS RETURNS

SELECT * FROM ASSESSMENT.ASSESSMENT.RETURNS;


-- ORDERS SQL_ACCOUNTS

SELECT * FROM ASSESSMENT.ASSESSMENT.SQL_ACCOUNTS;

-- ORDERS SQL_ORDERS

SELECT * FROM ASSESSMENT.ASSESSMENT.SQL_ORDERS;

-- ORDERS SQL_SALES

SELECT * FROM ASSESSMENT.ASSESSMENT.SQL_SALES;

-- ORDERS SQL_REGION

SELECT * FROM ASSESSMENT.ASSESSMENT.SQL_REGION;


-- 1)	What are the top 5 cities in respect to count of returned orders?


SELECT * FROM assessment.ORDERS
WHERE assessment.ORDERS.ORDER_ID=assessment.RETURNS.ORDER_ID
group by city;

select * from assessment.orders

-- 2)	Flag instances where the same customer has procured the same product in the same month at
-- different unit prices (Unit_Price = Sales/Qty)


