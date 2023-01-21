--create the table region table

create table assignment.region(

		id float8 primary key,
	
		name varchar(100)

);

--create the table sales table

create table assignment.sales(

		id float8 primary key,
	
		name varchar(100),
	
		region_id float8

);

--create the table orders table

create table assignment.orders(

		id float8 primary key,
	
		account_id float8,
	
		occurred_at varchar(100),
	
		standard_qty float8,
	
		gloss_qty float8,
	
		poster_qty float8,
	
		total float8,
	
		standard_amt_usd float8,
	
		gloss_amt_usd float8,
	
		poster_amt_usd float8,
	
		total_amt_usd float8
	

);

--create the table accounts table

create table assignment.accounts(

		id float8 primary key,
	
		name varchar(100),
	
		website varchar(500),
	
		lat float8,
	
		long float8,
	
		primary_poc varchar(100),
	
		sales_rep_id float8

);


--show the region table data

select * from assignment.region;

--show the orders table data

select * from assignment.orders;

--show the accounts table data

select * from assignment.accounts;

--show the sales table data

select * from assignment.sales;

--find sum of the standar_qty, gloss_qty and poster_qty where account id is 1001 and total > 150

select sum(standard_qty) as total_standard, sum(gloss_qty ) as total_gloss, sum(poster_qty) as total_poster
from assignment.orders
where account_id=1001 and total>150;

-- show the name, website and it's length from accounts and order by length of website

select name,website,length(website) from assignment.accounts 
order by length(website) desc
limit 1;

-- count sales name having 'e' in them

select count(name) from assignment.sales where name like '%e%'; 


-- show 3 account name having '&' 

select name from assignment.accounts where name like '%&%' order by name limit 1 offset 2;


-- count sales name having region_id=1

select count(name) from assignment.sales where region_id=1;



-- add foreign key to sales_rep_id to accounts table 


ALTER TABLE assignment.accounts add FOREIGN KEY(sales_rep_id) REFERENCES assignment.sales(id) ON DELETE SET NULL ;

--the set null helps in deleting the foreign key else give error


-- drop all the table having foreign key hence use cascade else give error

drop table region cascade; --delete region table
drop table accounts cascade; --delete accounts table
drop table orders cascade;--delete orders table
drop table sales cascade;--delete sales table


-- show accounts with id=1003

select count(*) from assignment.accounts where id =1003;


-- show account_id and total sum from order table and group by account_id and sum to be greater than 24000 and order by sum of total

select account_id,sum(total)from assignment.orders group by account_id having sum(total)>24000 order by sum(total) limit 5;


-- cases in sql

select 
case
when total_amt_usd >1 and total_amt_usd <= 10000 then 'bad'
when total_amt_usd >=10001 and total_amt_usd<=20000 then 'avg'
else 'good'
end as status,count(*)	--here we are counting the satus for esch i.e. bad, good, avg
from assignment.orders  group by status ;


-- count distinct account id in orders table


select count(distinct (account_id)) from assignment.orders;


-- show account and order where account_id not equal order_id


select * from assignment.accounts,assignment.orders where assignment.accounts.id<>assignment.orders.account_id;


-- inner join account_id and order_id


select * from assignment.accounts inner join assignment.orders on assignment.accounts.id=assignment.orders.account_id ;



-- Which region has the lowest proportion of sales reps to accounts


select assignment.region.name ,(count( distinct(assignment.accounts.id)) /count(distinct (assignment.sales.id)))from assignment.accounts,assignment.sales,assignment.region where sales.id=accounts.sales_rep_id and sales.region_id=region.id group by assignment.region.name;


-- Among sales reps Tia Amato, Delilah Krum, and Soraya Fulton, which one had accounts with the greatest total quantity ordered (not USD) in September 2016?

select assignment.sales.name,sum(assignment.orders.total) from assignment.sales
inner join assignment.accounts on assignment.sales.id=assignment.accounts.id
where assignment.sales.name in ('Tia Amato','Delilah Krum','Soraya Fulton')
and extract (year from assignment.orders.occurred_at)=09 group by assignment.sales.name;

select * from assignment.sales
where name in ('Tia Amato','Delilah Krum','Soraya Fulton');

-- Of accounts served by sales reps in the northeast, one account has never bought any posters. Which company? 

select * from assignment.orders cou


-- How many accounts have never ordered Poster?




-- For the West region, which month (list the full name) had the highest percent of poster orders by count during 2015?

select assignment.orders.poster_qty
from assignment.orders
inner join assignment.accounts on assignment.order.id=assignment.accounts.id
inner join assignment.sales on assignment.accounts.id=assignment.sales.id
inner join assignment.region on assignment.region.id=assignment.sales.region_id 
where assignment.region.name='West' and date_part('year',occurred_at)=2015
group by TO_CHAR(assignment.orders.occurred_at,'Month')
order by sum(assignment.orders.poster_qty) desc;


-- simple query to get the sum of poster_qty

SELECT EXTRACT(MINUTE FROM TIMESTAMP'2017-06-15 09:34:21');
SELECT EXTRACT(YEAR FROM TIMESTAMP '2016-12-31 13:30:15');

select EXTRACT(DAY FROM MAX(DATE '2016-12-31')-MIN(DATE '2016-12-1')) AS DateDifference


select * from assignment.orders;

select sum(poster_qty) from assignment.orders
where EXTRACT(YEAR FROM orders.occurred_at)=2015
