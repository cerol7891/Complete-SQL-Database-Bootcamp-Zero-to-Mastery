
/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
SELECT employees.emp_no, count(titles.title) 
from "public"."employees"
INNER join "public"."titles"
on employees.emp_no=titles.emp_no
WHERE EXTRACT(year from hire_date)>1991
GROUP by employees.emp_no
having count(titles.title)> 2


/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
SELECT employees.emp_no, count(salaries.salary)
from "public"."employees"
inner join "public"."salaries"
on employees.emp_no=salaries.emp_no
inner join "public"."dept_emp"
on dept_emp.emp_no=employees.emp_no    
inner join "public"."departments"
on dept_emp.dept_no=departments.dept_no
where departments.dept_name = 'Development'
group by employees.emp_no
having count(salaries.salary)>15
order by emp_no



/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
SELECT employees.emp_no
from "public"."employees"
inner join "public"."dept_emp"
on employees.emp_no=dept_emp.emp_no
GROUP by employees.emp_no
HAVING count(dept_emp.dept_no)>1
order by employees.emp_no

