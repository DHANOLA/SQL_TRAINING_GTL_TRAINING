------------------------------------------------SQL DAY - 2-----------------------------------------------------

-- CREATE BRANCH SUPPLIER TABLE

CREATE TABLE EMPLOYEE.B_SUP(

	B_ID INTEGER,
	
	SUP_NAME VARCHAR(50),
	
	SUP_TYPE VARCHAR(50),
	
	PRIMARY KEY(B_ID, SUP_NAME) --THIS IS A COMPOSITE KEY IN WHICH WE USED HELP OF TWO FIELD TO MAKE IT A S 									  PRIMARY KEY

);


-- CREATE EMPLOYEE TABLE UNDER EMPLOYEE DATABASE

CREATE TABLE EMPLOYEE.EMPLOYEE(

		EMP_ID INTEGER PRIMARY KEY,
	
		F_NAME VARCHAR(100),
	
		L_NAME VARCHAR(100),
	
		DOB DATE,
	
		SEX VARCHAR(1),
	
		SALARY FLOAT8,
	
		SUPER_ID INTEGER,
	
		B_ID INTEGER

);

-- CREATE WORKS_WITH TABLE UNDER EMPLOYEE DATABASE

CREATE TABLE EMPLOYEE.WORK_WTH(

	EMP_ID INTEGER,
	
	CLIENT_ID INTEGER,
	
	TOTAL_SLAES FLOAT8,
	
	PRIMARY KEY(EMP_ID, CLIENT_ID)


);

-- CREATE CLIENT TABLE UNDER EMPLOYEE DATABASE

CREATE TABLE EMPLOYEE.CLIENT(

	C_ID INTEGER,
	
	C_NAME VARCHAR(100),
	
	B_ID INTEGER,
	
	PRIMARY KEY(C_ID)
	
);


-- DSCRIBE A TABLE IN PSQL

-- 1. CONNECT TO PSQL AS POSTGRES USER:

-- 	PSQL -U POSTGRES -W
	
-- 2. ENTER PASSWORD

-- 3. SWITCH TO DATABASE

-- 	\C DATABASE_NAME
	
-- 4. \D+ 

CREATE TABLE EMPLOYEE.BRANCH(

	B_ID INTEGER,
	
	B_NAME VARCHAR(100),
	
	MGR_ID INTEGER,
	
	MGR_DATE DATE,
	
	PRIMARY KEY(B_ID)


);


-- ALL VALUES OF EMPLOYEE TABLE

SELECT * FROM EMPLOYEE.EMPLOYEE


-- ALL VALUES OF BRANCH TABLE

SELECT * FROM EMPLOYEE.BRANCH


-- ALL VALUES OF CLIENT TABLE

SELECT * FROM EMPLOYEE.CLIENT


-- ALL VALUES OF BRANCH SUPPLIER TABLE

SELECT * FROM EMPLOYEE.B_SUP


-- ALL VALUES OF WORKS WITH TABLE

SELECT * FROM EMPLOYEE.WORK_WTH

