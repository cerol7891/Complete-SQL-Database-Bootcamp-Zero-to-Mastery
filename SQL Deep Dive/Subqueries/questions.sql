/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
SELECT *
FROM orders
join customers using(customerid)
where state in ('OH','NY','OR')

order by orderid

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
select * 
from employees
join titles using(emp_no)
where emp_no = 110183 and title='Manager'
