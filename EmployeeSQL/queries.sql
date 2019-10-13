-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.first_name, e.last_name, e.gender, s.salary
FROM employee AS e
INNER JOIN salary AS s ON e.emp_no = s.emp_no
ORDER BY s.salary DESC;

-- List employees who were hired in 1986.
SELECT *
FROM employee
WHERE EXTRACT(YEAR from hire_date) = 1986
ORDER BY hire_date;

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
INNER JOIN department AS d ON dm.dept_no = d.dept_no
INNER JOIN employee AS e ON e.emp_no = dm.emp_no
ORDER BY d.dept_no, dm.from_date;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employee AS e
INNER JOIN dept_employee AS de ON e.emp_no = de.emp_no
INNER JOIN department AS d ON d.dept_no = de.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employee AS e
INNER JOIN dept_employee AS de ON e.emp_no = de.emp_no
INNER JOIN department AS d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employee AS e
INNER JOIN dept_employee AS de ON e.emp_no = de.emp_no
INNER JOIN department AS d ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development')


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS last_name_count
FROM employee
GROUP BY last_name
ORDER BY last_name_count DESC


-- BONUS - salary by title query
SELECT e.first_name, e.last_name, e.gender, s.salary, t.title
FROM employee AS e
INNER JOIN salary AS s ON e.emp_no = s.emp_no
INNER JOIN title as t ON t.emp_no = e.emp_no
ORDER BY s.salary DESC;


-- Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks 
-- you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge
-- to see that your employee ID number is 499942.

SELECT *
FROM employee
WHERE emp_no = 499942  --I'm in the database as April Foolsday what kind of operation is this!



