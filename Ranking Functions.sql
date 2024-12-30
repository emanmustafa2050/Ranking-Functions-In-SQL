/*
Ranking Functions:-
Row_Number() -> create new cols for rowNumber(based on order by)
   ....Row_Number()over(order by ....desc/asce) as RN
   .. Row_Number()over(partition by ...order by ....desc/asce) as RN
   ---------------------------------------------------------------------------
Dense_rank() ->create new cols for Rank_Number(based on order by) each equals values have the same rank
   ....Dense_rank()over(order by ....desc/asce) as DR
   ..Dense_rank()over(partition by ... order by ....desc/asce) as DR
   ---------------------------------------------------------------------------
NTiels() -> divide the table into n groups
   ....NTiels(N)over(order by ....desc/asce) as NT
   ---------------------------------------------------------------------------
Rank()
*/
select*,Row_Number()over(order by St_Age desc) as RN,
      DENSE_RANK()over(order by St_Age desc) as DR, 
	  NTILE(3) over (order by St_Age desc)as NT
from Student
--How to use in business ???
select*from (
      select*,Row_Number()over(order by St_Age desc) as RN,
      DENSE_RANK()over(order by St_Age desc) as DR, 
	  NTILE(3) over (order by St_Age desc)as NT
      from Student
) as NewTable
where  DR = 3-- // DR = 4  //RN= 2 

-- group data first -> order data in each group second
 select*,Row_Number()over(partition by Dept_id order by St_Age desc) as RN
from Student

select*,DENSE_RANK()over(partition by Dept_id order by St_Age desc) as DR
from Student

-- select the top(1) from each department
select* from (
         select*,DENSE_RANK()over(partition by Dept_id order by St_Age desc) as DR
         from Student
) as NewTable
where DR = 1

-- use Ntile
select*,NTILE(3) over (order by St_Age)
from Student

select*from(
     select*,NTILE(3) over (order by St_Age) as Groups
     from Student
) as NewTable
where Groups  = 3
------------------------------------ case - when
select * from Hr.Instructor
select*from Student
