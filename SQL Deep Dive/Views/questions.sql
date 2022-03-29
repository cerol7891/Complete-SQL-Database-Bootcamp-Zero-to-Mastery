/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/

create or replace view "90-95" as
SELECT emp_no, first_name,last_name,salary, hire_date
from"public"."salaries"
join "public"."employees" using(emp_no)
where extract (year from hire_date) between 1990 and 1995 
order by emp_no

/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/

create view "bigbucks" as
select emp_no, salary 
from "public"."salaries"
where salary>= 80000
