-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_emp;

-- fix 'titles' table problem
--DROP TABLE titles CASCADE;
--DROP TABLE dept_emp CASCADE;

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date, title)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no, to_date)
);

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility/Create a new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;
 
-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--DROP TABLE retirement_info;

-- Joining departments and dept_manager tables using inner join
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables using left join
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

--DROP TABLE current_emp;

SELECT * FROM current_emp;
	
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO emp_dept_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM emp_dept_count;

--DROP TABLE emp_dept_count;

-- Create a table about employee information
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info;

-- Create a table list of managers for each department
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
	INNER JOIN departments as d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp AS ce
		ON (dm.emp_no = ce.emp_no);
		
SELECT * FROM manager_info;
		
-- Create an updated list of current employees that includes their departments
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no);
		
SELECT * FROM dept_info;

-- Create a table list just of the sales team
SELECT ri.emp_no, 
	ri.first_name, 
	ri.last_name,
	d.dept_name
INTO sales_team
FROM retirement_info as ri
	INNER JOIN dept_emp as de
		ON (ri.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

SELECT * FROM sales_team;

-- Create a table list just of the sales and development team
SELECT ri.emp_no, 
	ri.first_name, 
	ri.last_name,
	d.dept_name
INTO sales_dev_team
FROM retirement_info as ri
	INNER JOIN dept_emp as de
		ON (ri.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development');

SELECT * FROM sales_dev_team;

-- Challenge Part 1:
-- 1.1: Create a table listing the number of titles retiring
SELECT ri.emp_no,
	 ri.first_name, 
	 ri.last_name,
	 ti.title,
	 ti.from_date,
	 s.salary
INTO titles_retiring
FROM retirement_info AS ri
	INNER JOIN titles AS ti
		ON (ri.emp_no = ti.emp_no)
	INNER JOIN salaries AS s
		ON (ti.emp_no = s.emp_no);	
		
SELECT * FROM titles_retiring;
		
-- 1.2: Create a table listing only the most recent titles(exclude duplicate names)
-- Get a list of the employees that are dupicated 
SELECT first_name,
	last_name,
	COUNT(*)
FROM titles_retiring
GROUP BY first_name,
	last_name
HAVING COUNT(*) > 1;

-- List of only the recent titles by creating a mentor list, removing duplicates, and order by date
SELECT emp_no, 
	first_name,
	last_name,
	from_date,
	title
INTO mentor_list
FROM 
	(SELECT emp_no, first_name, last_name, from_date, title,
		ROW_NUMBER() OVER
	(PARTITION BY (emp_no) ORDER BY from_date DESC) rn
		FROM titles_retiring
		) tmp WHERE rn = 1
ORDER BY from_date DESC;

SELECT * FROM mentor_list;

-- Create a table list of how many mentors are retiring from each department
SELECT title,
	COUNT(*)
INTO mentor_list_count
FROM mentor_list
GROUP BY title;

SELECT * FROM mentor_list_count;

--1.3: Create a table list of what employees are ready for a mentor
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.to_date,
	ti.from_date
INTO mentor_ready
FROM employees AS e
	INNER JOIN titles AS ti
		ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND ti.to_date = ('9999-01-01')
ORDER BY title;

SELECT * FROM mentor_ready;
