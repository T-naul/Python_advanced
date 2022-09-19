
-- D. SQLite Subquery

-- 1. Write a query to find the names (first_name, last_name) and salaries of the employees who have a higher salary than the employee whose last_name='Bull'. 
-- SELECT first_name || ' ' || last_name as name, salary 
-- FROM employees
-- WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull');
-- 2. Write a query to find the names (first_name, last_name) of all employees who works in the IT department.
-- SELECT first_name || ' ' || last_name as name
-- FROM employees
-- WHERE department_id = 60;
-- 3. Write a query to find the names (first_name, last_name) of the employees who have a manager who works for a department based in the United States.
-- WITH depart AS (SELECT department_id FROM department WHERE location_id = 1600 OR location_id = 1700)
-- SELECT first_name || ' ' || last_name as name
-- FROM employees
-- WHERE manager_id in (SELECT employee_id FROM employees WHERE department_id in (SELECT * FROM depart));

-- 4. Write a query to find the names (first_name, last_name) of the employees who are managers.
-- SELECT first_name || ' ' || last_name as name
-- FROM employees
-- WHERE employee_id in (SELECT DISTINCT manager_id FROM employees);
-- 5. Write a query to find the names (first_name, last_name), the salary of the employees whose salary is greater than the average salary.
-- SELECT first_name || ' ' || last_name as name
-- FROM employees
-- WHERE salary > (SELECT SUM(salary)/COUNT(salary) as salary FROM employees);
-- 6. Write a query to find the names (first_name, last_name), the salary of the employees whose salary is equal to the minimum salary for their job grade.
-- WITH min_sala as (SELECT MIN(salary) as min_salary, job_id FROM employees GROUP BY job_id)
-- SELECT first_name || ' ' || last_name as name, salary, employees.job_id
-- FROM employees
-- JOIN min_sala  on employees.salary = min_sala.min_salary AND employees.job_id = min_sala.job_id;

-- 7. Write a query to find the names (first_name, last_name), the salary of the employees who earn more than the average salary and who works in any of the IT departments. 
-- SELECT first_name || ' ' || last_name as name, salary
-- FROM employees
-- WHERE salary > (SELECT SUM(salary)/COUNT(salary) as salary FROM employees) OR department_id = 60;
-- 8. Write a query to find the names (first_name, last_name), the salary of the employees who earn more than Mr. Bell.
-- SELECT first_name || ' ' || last_name as name, salary
-- FROM employees
-- WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bell') ;
-- 9. Write a query to find the names (first_name, last_name), the salary of the employees who earn the same salary as the minimum salary for all departments.
WITH min_sala as (SELECT MIN(salary) as min_salary, job_id FROM employees GROUP BY job_id)
SELECT first_name || ' ' || last_name as name, salary, employees.job_id
FROM employees
JOIN min_sala  on employees.salary = min_sala.min_salary AND employees.job_id = min_sala.job_id;
-- 10. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
-- SELECT first_name || ' ' || last_name as name
-- FROM employees
-- WHERE employee_id NOT IN (SELECT DISTINCT manager_id FROM employees);
-- 11. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
-- SELECT first_name || ' ' || last_name as name, salary, employees.job_id
-- FROM employees
-- JOIN (SELECT SUM(salary)/COUNT(salary) as avg_salary, job_id FROM employees GROUP BY job_id) as b on employees.salary < b.avg_salary AND employees.job_id = b.job_id;
-- 12. Write a query to find the 5th maximum salary in the employees table.
-- SELECT * 
-- FROM (SELECT * FROM employees ORDER BY salary DESC LIMIT 5)
-- ORDER BY salary ASC LIMIT 1;
-- 13. Write a query to find the 4th minimum salary in the employees table.
-- SELECT * 
-- FROM (SELECT * FROM employees ORDER BY salary ASC LIMIT 4)
-- ORDER BY salary DESC LIMIT 1;
-- 14. Write a query to select last 10 records from a table.
--SELECT * FROM employees ORDER BY employee_id DESC LIMIT 10;
-- 15. Write a query to list department number, name for all the departments in which there are no employees in the department.
-- SELECT department_id, department_name
-- FROM department
-- WHERE department_id NOT IN (SELECT DISTINCT department_id FROM employees);
-- 16. Write a query to get 3 maximum salaries. 
--SELECT * FROM employees ORDER BY salary DESC LIMIT 3;
-- 17. Write a query to get 3 minimum salaries.
--SELECT * FROM employees ORDER BY salary ASC LIMIT 3;
-- 18. Write a query to get nth max salaries of employees.
-- SELECT *
-- FROM employees emp1
-- WHERE (0) = (SELECT COUNT(DISTINCT(emp2.salary)) FROM employees emp2 WHERE emp2.salary > emp1.salary);

