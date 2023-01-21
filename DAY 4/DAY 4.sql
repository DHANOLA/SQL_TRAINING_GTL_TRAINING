--create table emailid

create table assignment.email(

	email_id varchar(200)
	
);



insert into assignment.email(email_id) values ('rahul.dhanola31@gmail.com');

insert into assignment.email(email_id) values ('r.dhanola@goldstonetech.com');

insert into assignment.email(email_id) values ('garvit.pant4@gmail.com');

insert into assignment.email(email_id) values ('garvit.pant.goldstonetech.com');

insert into assignment.email(email_id) values ('mayank.upes@gmail.com');

insert into assignment.email(email_id) values ('mayank.upes@goldstonetech.com');

insert into assignment.email(email_id) values ('harsh.upes@gmail.com');

insert into assignment.email(email_id) values ('harsh.upesgoldstonetech.com');

insert into assignment.email(email_id) values ('balark.singhal@gmail.com');

insert into assignment.email(email_id) values ('balark.singhal@goldstonetech.com');

insert into assignment.email(email_id) values ('himanshu.upes@gmail.com');

insert into assignment.email(email_id) values ('himanshu.goldstonetech.com');

-- show the table

select * from assignment.email;


-- get the first name of the email

-- using the left function


select assignment.email.email_id  left(assignment.email.email_id,position('.' in assignment.email.email_id)-1)
from assignment.email.email_id;

-- using the split_part function

select assignment.email.email_id, split_part(assignment.email.email_id,'@',1)from assignment.email;

-- get the right name of the email

-- using the right function


select assignment.email.email_id, right(assignment.email.email_id,position('@' in reverse(assignment.email.email_id))-1)
from assignment.email;

-- using the split_part function

select assignment.email.email_id, split_part(assignment.email.email_id,'@',2)from assignment.email;


-- using the substring

select substring(assignment.email.email_id,position('@' in assignment.email.email_id)+1,length(assignment.email.email_id))
from assignment.email


-- write a normal concatenate

select concatenate('First name',' ','Second name')


-- concatenate the substring generated above


SELECT concat(CONCAT(substring(assignment.email.email_id,1,position('@' in assignment.email.email_id))
					 , ' '),
			 substring(assignment.email.email_id,position('@' in assignment.email.email_id)+1,length(assignment.email.email_id)))
			 AS NAME FROM assignment.email;



-- put firstname in upper and second in lower above query


SELECT concat(CONCAT(upper(substring(assignment.email.email_id,1,position('@' in assignment.email.email_id))
					 ), ' '),
			 lower(substring(assignment.email.email_id,position('@' in assignment.email.email_id)+1,length(assignment.email.email_id))))
			 AS NAME FROM assignment.email;


-- get date diffrence


select '2015-01-12'::date - '2015-01-01'::date as date,
EXTRACT(MONTH FROM DATE '2015-01-12')-EXTRACT(MONTH FROM DATE '2015-01-01') AS MONTH,
;

SELECT AGE('2015-12-31','2015-01-01')



-- CREATING VIES IN SQL


CREATE VIEW assignment.region_view as (select * from assignment.region);

-- preview a basic view

select * from assignment.region_view;


-- creating a materialized view


create materialized view assignment.region_mat_view as(select * from assignment.region);

-- refresh a materialised view

refresh materialized view assignment.region_mat_view;

-- diffrence between simple and materialized view

-- simple view: the data in view change as the original table value changes in real-time

-- materialized view: the data in view change only if we refresh else it will read the previous cache memory(this is actually non-volatile memory)

select assignment.sales.name from assignment.sales where assignment.sales.id=(select max(assignment.sales.id) from assignment.sales.id);



-- use subquery instead of join as it is a good way  and faster than join, but to use this you should have the a column which have 1-to-1 relation

select a.id,a.name,a.sales_rep_id,(select b.account_id from assignment.orders b where a.id=b.id) from assignment.accounts a;

-- above you can see that we should have a column or the values one -by -one relation here it is 'id' column


-- group by region id

select a.sales_rep_id,a.name,count(*) from
(select a.id,a.name,a.sales_rep_id,(select b.account_id from assignment.orders b where a.id=b.id) from assignment.accounts a)
as a 
group by a.id,a.name;


-- Common Table Expressions (CTE) IN POSTGRESQL

-- the with clause help in alisaing the query 


with a as(select a.region_id,
		 (select b.name
		 from assignment.employee.region_id b
		 where a.region_id=b.id)
		 as name
		 
		 );
		 
		 
		 
-- windows function in sql

select * from assignment.orders;


-- row_number(): gives the row of the table 


select account_id,row_number() over(partition by account_id order by account_id),a.* from assignment.orders a;


-- rank in sql: it will rank each unique id a rankbut for each new id it's rank is it's row number


select account_id, rank() over (order by account_id) from assignment.orders;


-- dense rank: helps in resolving above issue

select account_id,dense_rank() over (order by account_id) from assignment.orders;


-- finding the ranges of each partition bin


with temp_tbl as (select A.*,ntile(5) over (order by a.total_amt_usd) as tile from assignment.orders A)
select tile, min(total_amt_usd),max(total_amt_usd) from temp_tbl group by tile order by 1;


-- do above by subquery

select tile,min(total_amt_usd),max(total_amt_usd) from (select A.*,ntile(5) over (order by a.total_amt_usd) as tile from assignment.orders A) as sub
group by tile order by 1;


-- stored procedure and functions

simple funtion: can help in retuen 

-- creating simple functionms

-- each schema have its own functionso call or creat function as schema.function name

create or replace function assignment.getaccountid(id_ int) returns assignment.orders--return table

LANGUAGE SQL --any language which you are feasible either plgsql or sql

as $$ --it is the starting of the function definition

select  * from assignment.orders where id=id_; --function definition

$$; --it is the ending of the function definition

select * from assignment.getaccountid(1); --function call



------------------------------------------------------------------------------------------------------------------------------------------------------

--if want to pass more than one argument

SELECT * from assignment.orders;

--same as def function: where def is same as 'create or replace function' 

create or replace function assignment.getcount(start_ int ,end_ int )

returns int --function return type

language plpgsql --language we use in function definition 


as $$--function beginning

declare --declare a variable

count_ integer ;


--we use  dollar as curly braces and begin is written afer variable declaration as here--
begin  --function beginning



select count(*)
into count_
from assignment.orders
where id between start_ and end_;

return count_;

end; --function ending

$$;--function ending


select assignment.getcount(2,3);



--create funtcion to return table





-- create master table and log table having all data with date and time

-- store d functions in sql


-- in normal function dml commands not work

alter table assignment.transaction rename  to master_table;
drop table assignment.master_table
ALTER TABLE assignment.master_table
ADD id datatype;

create table assignment.transaction(
	
	id integer,
	
	name varchar(50),
	
	amount float8


);



insert into assignment.TRANSACTION(ID,name,amount) values(1,'Rahul',3000);

insert into assignment.TRANSACTION(ID,name,amount) values(2,'garvit',1000);

insert into assignment.TRANSACTION(ID,name,amount) values(3,'harsh',2000);

insert into assignment.TRANSACTION(ID,name,amount) values(4,'hello',5000);

insert into assignment.TRANSACTION(ID,name,amount) values(5,'balark',1000);

insert into assignment.TRANSACTION(ID,name,amount) values(6,'noname',20000);

select * from assignment.TRANSACTION;

create table assignment.log_transaction(

-- 	name varchar(200),
	
	amount float8,
	
	date_val TIMESTAMP

);


alter table assignment.log_transaction drop column name;

select * from assignment.log_transaction;

create or replace procedure assignment.TARNSACTION3(

	sender float8,
	
	reciever float8,
	
	balance float8

)


language plpgsql

as $$

begin


-- subtract from sender account


update assignment.TRANSACTION
set amount=amount-balance
where assignment.transaction.id=sender;


-- adding amount to reciever table
insert into assignment.log_transaction values(amount,NOW());


update assignment.TRANSACTION
SET amount=amount+balance
where ASSIGNMENT.TRANSACTION.id=reciever;


insert into assignment.log_transaction values(amount,now());

commit;

end;$$;

call assignment.TARNSACTION3(3,1,500);

select * from assignment.transaction
