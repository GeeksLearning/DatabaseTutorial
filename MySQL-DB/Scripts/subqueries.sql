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






