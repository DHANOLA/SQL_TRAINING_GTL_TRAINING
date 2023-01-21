select * from assignment.orders


--select 50% of the table

select * from assignment.orders limit (select count(*)/2 from assignment.orders);


-- 2)	Write a query that counts the number of individual orders where poster quantity was more than 50 for three region North 
-- (North East), West (Midwest + West), South (Southeast)

select count(distinct(id)) from assignment.orders where assignment.orders.poster_qty>50 ;

select * from assignment.orders

select * from assignment.region

select * from assignment.accounts

select * from assignment.sales

select * from assignment.o

select count(distinct(id)) AS HELLO from assignment.sales group by region_id;

TRANPOSE

SELECT *
FROM crosstab(
	$$
    select count(distinct(id)) AS HELLO from assignment.sales group by region_id;

  $$
)
AS ct(
  "COLUMN 1" INT,
	"COLUMN 2" INT,
	"COLUMN 3" INT,
	"COLUMN 4" INT
);

-- 3)	Write a query that shows the count of number of distinct accounts for each region with the regions being represented as 
-- column names. The grouping of the regions would be same as above

select count(distinct)
select * from assignment.region


select * from assignment.orders inner join assignment.region on assignment.orders.id=assignment.region.id


-- 5)	Create an employee table (ID,name) with the following values
-- 1, Abhishek 
-- 2, Suneeth
-- 3, Hrushikesh 
-- 4, Harsha
--  Generate an output where Suneeth will always be the first entry and the other three names would have to be sorted in asc order


create table assignment.employee(

	id integer,
	
	name varchar(200)

);

insert into assignment.employee values(1,'Abhishek');

insert into assignment.employee values(2,'Suneeth');

insert into assignment.employee values(3,'Hrushikesh');

insert into assignment.employee values(4,'Harsha');

select * from assignment.employee;

select * from assignment.employee order by name;