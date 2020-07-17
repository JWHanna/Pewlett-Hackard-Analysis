-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
-- Code Breakdpwn:
-- 1. "CREATE TABLE" is the syntax required to create a new table in SQL.
-- 2. "departments" is the name of the table and how it will be referenced in queries.
-- 3. "dept_no VARCHAR(4) NOT NULL", creates a column named “dept_no” that can hold up
--    to four varying characters, while NOT NULL tells SQL that no null fields will 
--    be allowed when importing data.
-- 4. "dept_name VARCHAR(40) NOT NULL", creates a column similar to the dept_no, 
--    only the varying character count has a maximum of 40.
-- 5. "PRIMARY KEY (dept_no)", means that the dept_no column is used as the primary 
--    key for this table.
-- 6. "UNIQUE (dept_name)" adds the unique constraint to the dept_name column.

CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager(
dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
-- 1. The FOREIGN KEY constraint tells Postgres that there is a link between two tables
-- 2. The parentheses following FOREIGN KEY specify which of the current table’s columns 
--    is linked to another table
-- 3. REFERENCES table_name (column_name) tells Postgres which other table uses that 
--    column as a primary key

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);


SELECT * FROM departments;
-- The SELECT statement tells Postgres that we’re about to query the database.
-- The asterisk tells Postgres that we’re looking for every column in a table.
-- FROM departments tells pgAdmin which table to search.
-- The semicolon signifies the completion of the query