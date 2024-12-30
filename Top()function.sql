select*from Employee
insert into Employee(Fname,Lname,SSN,Salary)
values ('Iman','Fathy',987456,2500),('Iman','Fathy',123956,2500)
-- to return top n-rows not the greatest n row(not orderd)
select top(3)Salary from Employee
select top(3)Salary,SSN from Employee

-- to return top n-rows (orderd)
select top(3)Salary 
from Employee
order by Salary desc

-- top() with ties -> must user order by 
-- return top n-rows with duplication of only last value(if exist)
select top(2) with ties * -- return 3 rows
from Employee
order by Salary desc

-- GUID
-- when we need to randomize the query (return random result for each run)
select * ,newid() 
from Employee 
order by newid()  -- order randomly
------------------------------------------------------------
-- Excution order -- using subquery 
select *from
   (select Fname +' '+Lname as fullName , Salary from Employee) as Newtable
where fullName = 'Iman Fathy'

-- DB objects (table - view - function ....)
-- what if we need to call object from another DB/server/schema ?
-- [serverName].[DBName].[schemaName].[tableName]

-- select into statment
-- DDL statment to creat table besed on data in another table (copy data)
select Fname,Lname, Salary ,Dno into table2 
from Employee

select*from table2
order by Salary desc

select Fname,Lname, Salary  into table3 
from Employee
where Sex='M'

select*from table3
order by Salary desc
-- what if i need to copy the structure of table not data ??
-- assign condition which impossible to be true
select* into table4
from Employee
where 1=2

select*from table4

select* into table5
from Employee
where 1=2

-- what if we need to copy  data not the structure of table  ??
-- Use insert based on select 
insert into table5
select*from Employee
select*from table5 
---------------------------------------------
-- Note : having (with agg) only - OR (group by)
select sum(Salary)
from Employee
having Salary > 1000 -- error xxx

-- If select has agg -> we can use having without group by
select sum(Salary)
from Employee
having count(Salary) > 1000 -- true ... using agg->count()
 
-- If select hasn't agg -> we must use having with group by
select Dno
from Employee
group by Dno
having count(Dno) >=3


