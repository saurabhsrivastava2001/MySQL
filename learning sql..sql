use test;
#to select few columns--
select Gender,Grade from test5;

#filter all the record where name=john
select * from test5 where FirstName="john";

 # putting condition-
 select * from test5 where StudentID >10 and grade >80 and Gender = "male";
 
 #delete records--
delete from test5 where StudentID=10;
select * from test5;

#update values in rows--
update test5 set Grade =92 where StudentId=1;

#group by operations-
select Gender, sum(Grade) as total from test5 group by Gender order by total asc;
select Grade ,count(Grade) as count from test5 where Grade>85 group by Grade order by count asc  ;

#Alter table:
#alter table is used to modify of sdd columns
alter table test5 add column course varchar(20);

select * from test5;

#truncate table---- deletes table contains but the table remains
# truncate table table_name;

# select distinct---
select distinct Gender from test5;

#where to filter--
# select column from table_name where condition;


# to read a csv filw directly ---
use test;
show tables;
select * from new2;

--------
SHOW GLOBAL VARIABLES LIKE 'local_infile';
set global local_infile = 1;
LOAD DATA LOCAL INFILE 'E:\student_data.csv'
INTO TABLE new2
FIELDS TERMINATED BY ','
;
select * from new2;


#using string function
select upper(replace(FirstName,"John","johny")) from test5;


# aggregate function-
select count(*) from test5;
select sum(Grade) from test5;
# we can use max , min ,avg,

#round- sets the decimals after value--
select round(avg(Grade),3) from test5;

# group by--
select Gender , count(Gender) as total from new2 group by Gender;

# having clause -- used with group by--like we use where for select
select Gender, sum(Grade) as total from new2 where Grade>82  group by Gender having sum(Grade)>1000;



#time stamp functions--
select current_timestamp;

#joins
#1-inner join

use test;
select n.FirstName, t.Grade  # we can also use * for all the columns
from new2 as n 
inner join test5 as t 
on n.StudentID=t.StudentID; 

#2-left join--
select n.FirstName, t.Grade  # we can also use * for all the columns
from new2 as n 
left join test5 as t 
on n.StudentID=t.StudentID; 
 
 # self join--
 select * from new2 as n1
 join new2 as n2
 on n2.StudentID = n1.studentID;
 
 # union--
 select * from test5
 union
select * from new2;

# union all

select * from test5
union all
select *  from new2;

#subquery--
#question--find the details of student in new2 whose Grade is more than the average grade --
-- step1-find he average grade
select avg(Grade) from new2;
-- step2- filter students whose Grade is more than the average -
select * from new2 where Grade >84;

-- this is not the best practice --
-- we will puth the first query in the place of average value inn the 2nd query -- this is called a subquery
select * from new2 where Grade >(select avg(Grade) from new2);

# this was easy because we have only one output average ----but in the next problem we wili use 'in'' operaor--

select * from test5
where StudentID in (select StudentID from new2 where Grade>89);

#exist operator--

select FirstName, LastName from new2 where exists (select  StudentID , Grade from test5
where Grade>91);




















































