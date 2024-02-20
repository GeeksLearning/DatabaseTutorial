show databases;

use advancesqldb;

show tables;

select * from employees;
select * from department;



-- SubQuery : A Sql query places inside another query, in simple words query inside another query
/*
Q: Find the employees who's salary is more than avg salary earned by all employees

	1. find the avg salary of employees;
    2. filter the employees based on the above result
*/

select avg(salary) from employees;

select * from employees where salary >= 60900;


select * from employees -- outer query
	where salary >= (select avg(salary) from employees); -- inner query
	
-- Scalary Subquery: always return one row & one column 

--- JOIN CLAUSE 
SELECT *
FROM employees e1
JOIN ( SELECT avg(salary) AS sal FROM employees ) e2
ON e1.salary > e2.sal;

SELECT e1.*
FROM employees e1
JOIN ( SELECT avg(salary) AS sal FROM employees ) e2
ON e1.salary > e2.sal;



-- Multi Row SubQuery
-- multi row & multi column (IN)
-- single row & multiple column (IN , NOT IN)
select * from employees;

select dept_name, max(salary) 
from employees
group by dept_name;



select * from employees 
where (dept_name,salary) 
			in (
			select dept_name, avg(salary) 
			from employees
			group by dept_name
            );
		


select e1.* from employees e1
JOIN (select dept_name, avg(salary) as avgsal from employees group by dept_name) e2
ON e1.dept_name = e2.dept_name AND e1.salary > e2.avgsal;











