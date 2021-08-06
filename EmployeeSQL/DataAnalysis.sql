--- 1. Employee Details ---
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
FROM employees as emp
    LEFT JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

--- 2. Employees hired in 1986 ---
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. Managers of the departments ---
SELECT  dm.dept_no,
        dept.dept_name,
        dm.emp_no,
        emp.last_name,
        emp.first_name
FROM dept_manager AS dm
    INNER JOIN departments AS dept
        ON (dm.dept_no = dept.dept_no)
    INNER JOIN employees AS emp
        ON (dm.emp_no = emp.emp_no);


--- 4. Department of each employee ---
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        dept.dept_name
FROM employees AS emp
    INNER JOIN dept_emp AS de
        ON (emp.emp_no = de.emp_no)
    INNER JOIN departments AS dept
        ON (de.dept_no = dept.dept_no)
ORDER BY emp.emp_no;

--- 5. Employees whose first name is "Hercules" and last name begins with "B"
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--- 6. Employees in the Sales department
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        dept.dept_name
FROM employees AS emp
    INNER JOIN dept_emp AS de
        ON (emp.emp_no = de.emp_no)
    INNER JOIN departments AS dept
        ON (de.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales'
ORDER BY emp.emp_no;

--- 7. Employees in Sales and Development departments
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        dept.dept_name
FROM employees AS emp
    INNER JOIN dept_emp AS de
        ON (emp.emp_no = de.emp_no)
    INNER JOIN departments AS dept
        ON (de.dept_no = dept.dept_no)
WHERE dept.dept_name IN ('Sales', 'Development')
ORDER BY emp.emp_no;

--- 8. Frequency of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
