
--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries on employees.emp_no = salaries.emp_no
;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date between '1-1-1986' and '12-31-1986'
order by hire_date ASC
;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,
employees.first_name
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
;

--List first name, last name, and sex 
--for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%'
;

--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

SELECT  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
;

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
;

--List the frequency count of employee last names (i.e., how many employees share each last name) 
--in descending order.

SELECT last_name, COUNT(last_name) as "last_name count"
FROM employees
GROUP BY last_name
ORDER BY "last_name count" DESC;

