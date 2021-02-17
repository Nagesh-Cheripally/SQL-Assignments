
use bootup;
/*
creating two tables, customer, order
*/
-- comment

CREATE TABLE customers (
    Id INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(200),
    Salary NUMERIC(30),
    PRIMARY KEY (Id)
);

CREATE TABLE orders (
    Oid INT NOT NULL,
    Date DATETIME NOT NULL,
    Customerid INT NOT NULL,
    Amount NUMERIC(20),
    PRIMARY KEY (Oid)
);

insert into customers values(1, "John",32, "New York", 12455);
insert into customers values(2, "Robert",25, "London", 48755);
insert into customers values(3, "Juan",28, "Paris", 13525);
insert into customers values(4, "Cello",18, "Jakarta", 78925);
insert into customers values(5, "Oscar",39, "Singapore", 13655);
insert into customers values(6, "Anshu",42, "Delhi", 12455);
insert into customers values(7, "Rahul",21, "Kualalumpur", 78555);

select * from customers;


insert into orders values(105, "20191012",3,2000);
insert into orders values(100, "20190202",3,5400);
insert into orders values(106, "20191121",2,3210);
insert into orders values(112, "20191226",6,7840);
insert into orders values(110, "20190312",1,1000);
insert into orders values(109, "20190521",4,6300);
insert into orders values(120, "20190521",9,8700);

select * from orders;

/*How to join two tables */
select Id,Name,Age,Date,Amount from customers,orders where customers.id
 = orders.customerid;

select Id,Name,Age,Date,Amount from customers as c,orders as o where c.id = o.customerid;

-- INNER JOIN
select Id,Name,Amount, Date from customers inner join orders on customers.Id = orders.CustomerId;

-- LEFT JOIN
select Id,Name,Amount, Date from customers left join orders on customers.Id = orders.CustomerId;

-- RIGHT JOIN
select Id,Name,Amount, Date from customers right join orders on customers.Id = orders.CustomerId;

-- FULL JOIN
select Id,Name,Amount, Date from customers full join orders on customers.Id = orders.CustomerId;



/*UNION - combine the results of two or more tables without any duplicates*/
select Id,Name,Amount, Date from customers left join orders on customers.Id = orders.CustomerId
union
select Id,Name,Amount, Date from customers right join orders on customers.Id = orders.CustomerId;


select * from customers;
select * from orders;

-- ********************************************************************************************
-- SELF join - join a table to itself by some operation

select a.Id, a.Salary from customers as a;

select a.Id, b.Name, a.Salary from customers as a, customers as b where a.salary<b.salary;

SELECT 
    a.Id, a.Name, b.Id, b.Name, a.Salary, b.salary
FROM
    customers AS a,
    customers AS b
WHERE
    a.salary < b.salary;

SELECT 
    a.Id AS cust1_id,
    a.Name AS cust1_name,
    b.Id AS cust2_id,
    b.Name AS cust2_name,
    a.Salary AS cust1_salary,
    b.salary AS cust2_salary
FROM
    customers AS a,
    customers AS b
WHERE
    a.salary < b.salary;


/*store the above result in another table*/

CREATE TABLE customers_comparison SELECT a.Id AS cust1_id,
    a.Name AS cust1_name,
    b.Id AS cust2_id,
    b.Name AS cust2_name,
    a.Salary AS cust1_salary,
    b.salary AS cust2_salary FROM
    customers AS a,
    customers AS b
WHERE
    a.salary < b.salary;
    

select * from customers_comparison;


-- to perform some operations on columns of the same database table

create table testtable(Numofitems int, Amount int);
insert into testtable values (5,2000),(3,4000),(6,2500),(8,2140);

select * from testtable;

select Numofitems,Amount, (NumofItems*Amount) as checkout_amount from testtable;

