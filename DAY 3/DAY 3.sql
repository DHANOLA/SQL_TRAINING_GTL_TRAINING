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
		 