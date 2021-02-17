/*
SQL Bascis commands - Anshu Pandey | BootUP Academy
*/

create database bootup;

use bootup; /* activating the specific database, all furhter actions will happen on this database*/

/*DDL Family Commands*/


/*Creating a table inside a database */
CREATE TABLE students (
    Name VARCHAR(10),
    Email VARCHAR(20),
    City VARCHAR(10),
    DOB DATE,
    Salary NUMERIC(20)
);

/*write a code to create a table - employee - (name, age, email, mobile, address, familysize)*/

CREATE TABLE new_employee (
    Name VARCHAR(10),
    Age INT(3),
    Email VARCHAR(20),
    Mobile VARCHAR(15),
    address VARCHAR(200),
    familysize INT(3)
);

/*Create a dummy table, which we will delete later, to understand how to delete or remove a table*/
CREATE TABLE emp (
    Name VARCHAR(10),
    Email VARCHAR(20)
);

/*DROP - to drop a table, or a column or rows from a database/table */
DROP table emp;

/*DROP - dropping column familysize from new_employee*/
alter table new_employee drop column familysize;

/*Renaming a coulumn age to current_age*/
alter table new_employee rename column age to current_age;

/*ALTER - add a new column address to the table students*/
alter table students add(address varchar(20));

/* DML Family commands - INSERT, UPDATE, DELETE */
insert into students values("Rahul","rahul@bootup.com","Jakarta",12/01/1995,412789,"Jakarta, Indonesia");

/* OR */

insert into students (Name,City,DOB) values("Juan","Jakarta",01/01/1995);

/*
insert into students values("john","john@bootup.com","Jakarta",12011993,997789,"Jakarta, Indonesia");
insert into students values("john","john@bootup.com","Jakarta",1993-05-02,997789,"Jakarta, Indonesia");
insert into students values("john","john@bootup.com","Jakarta",20200526,997789,"Jakarta, Indonesia");
*/

insert into students values("Kelly","Kelly@bootup.com","Singapore",'1992-05-02',997789,"Singapore, Singapore");

/* TO check the database table and see the values*/
select * from students;

/* add a key column - student_id to the table students*/
alter table students add student_id int not null primary key auto_increment;

/* UPDATE Command from DML*/
update students set DOB = "1995-01-12" where student_id=1;
update students set DOB = "2001-05-18" where student_id=2;
update students set DOB = "1996-01-14" where student_id=3;
update students set DOB = "2005-05-01" where student_id=4;

/* Delete command - deleting a particular row*/
delete from students where student_id = 3;

insert into students (Name,Email,City,DOB,Salary,address) values("Jimmy","Kelly@bootup.com","Singapore",'1992-05-02',997789,"Singapore, Singapore");


/*DQL: Select*/
select * from students;

/*condition based selection*/
select * from students where city="jakarta";
/* selecting top n rows*/
select * from students limit 3;
/*select and order*/
select * from students order by DOB;
select * from students order by DOB, Name;
/*selecting a set of columns */
select Name, Email,City from students where City="Jakarta";


/* using multiple conditions */

select * from students where city="jakarta" and salary<500000;

select * from students where city="jakarta" or salary<500000;

/* Groupby operation*/

select * from students;
select City,sum(Salary) from students group by City;
select City,sum(Salary) from students group by City order by sum(salary) desc;

/*delete the row ehere salary is null*/
delete from students where student_id=NULL;

/*eliminate duplicates - distinct*/
select distinct Name, Email, City from students;


/* how to load csv as sql table*/


use bootup;
CREATE TABLE stockdata (
    InvoiceNo VARCHAR(10),
    StockCode VARCHAR(20),
    Description VARCHAR(100),
    Quantity NUMERIC(10),
    InvoiceDate DATETIME,
    UnitPrice NUMERIC(20),
    CustomerID VARCHAR(10),
    Country VARCHAR(20)
);

/* enable the loading of data in mysql*/
show global variables like "local_infile";
/*if you see the value as OFF, then we need to switch it on*/
set global local_infile=1;

show global variables like "local_infile";

use bootup;
load data local infile "E:\\MLIoT\\ML\\dataset\\Online Retail.csv" into table stockdata 
character set latin1 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

select * from stockdata;

/***************************************/
use bootup;
select * from stockdata;
/*to check rows in the table*/
select count(*) from stockdata;

/*to check mean/average of unitprice*/
select avg(UnitPrice), avg(Quantity) from stockdata;
select sum(UnitPrice), sum(Quantity) from stockdata;
select min(UnitPrice), min(Quantity) from stockdata;
select max(UnitPrice), max(Quantity) from stockdata;






