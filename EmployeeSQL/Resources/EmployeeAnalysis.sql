SELECT * FROM employees 

SELECT * FROM departments

SELECT * FROM dept_manager

SELECT * FROM dept_emp 

SELECT * FROM titles

SELECT * FROM salaries

-- 1. List the employee number, last name, first name,
-- sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex,s.salary
FROM employees AS e
JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY emp_no

-- 2.List the first name, last name, and hire date 
--for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date

-- 3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT d.dept_no,d.dept_name, e.emp_no,e.last_name,e.first_name
FROM departments AS d
JOIN dept_manager
ON d.dept_no = dept_manager.dept_no
JOIN employees AS e
ON e.emp_no = dept_manager.emp_no

--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.

SELECT d.dept_no,e.emp_no,e.last_name,e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp
ON d.dept_no = dept_emp.dept_no
JOIN employees AS e
ON e.emp_no = dept_emp.emp_no
ORDER BY dept_no

-- 5. List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List each employee in the Sales department, 
--including their employee number, last name, and first name.

SELECT d.dept_name,e.emp_no,e.last_name, e.first_name
FROM departments AS d
JOIN dept_emp 
ON d.dept_no = dept_emp.dept_no
JOIN employees AS e
ON e.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales'
ORDER BY emp_no

-- 7.List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.

SELECT e.emp_no,e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp 
ON d.dept_no = dept_emp.dept_no
JOIN employees AS e
ON e.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales' OR dept_name= 'Development'
ORDER BY emp_no

-- 8. List the frequency counts, in descending order, of all the employee
--last names (that is, how many employees share each last name).

SELECT last_name, COUNT (last_name) AS "Frequency of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Last Name" DESC
