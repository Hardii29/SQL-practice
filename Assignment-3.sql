CREATE TABLE department (
dept_id INT NOT NULL PRIMARY KEY,
dept_name VARCHAR(20)
);
 
CREATE TABLE employee (
emp_id INT NOT NULL PRIMARY KEY,
dept_id INT NULL FOREIGN KEY REFERENCES department(dept_id),
mngr_id INT,
emp_name VARCHAR(40),
salary "money" NULL CONSTRAINT "DF_employee_salary" DEFAULT (0)
);

INSERT INTO department(dept_id, dept_name) VALUES (1, 'Executive');
INSERT INTO department(dept_id, dept_name) VALUES (2, 'HR');
INSERT INTO department(dept_id, dept_name) VALUES (3, 'Sales');
INSERT INTO department(dept_id, dept_name) VALUES (4, 'Development');
INSERT INTO department(dept_id, dept_name) VALUES (5, 'Support');
INSERT INTO department(dept_id, dept_name) VALUES (6, 'Research');

INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (101,  1,  NULL, 'John', 200000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (102,  1,  1, 'Smith', 100000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (105,  1,  1, 'Hiren', 100000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (201,  2,  1, 'Tiya', 50000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (303,  3,  2, 'Vishal', 55000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (401,  4,  3, 'Tripti', 60000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (505,  5,  3, 'Diva', 45000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (207,  2,  4, 'Umang', 45000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (203,  2,  5, 'Om', 40000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (305,  3,  5, 'Riya', 40000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (406,  4,  6, 'Het', 35000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (405,  4,  6, 'Helly', 40000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (410,  4,  6, 'Muskan', 35000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (605,  NULL,  7, 'Preet', 30000);
INSERT INTO employee (emp_id, dept_id, mngr_id, emp_name, salary )
VALUES (507,  5,  7, 'Dhruv', 30000);

SELECT e.emp_name, e.salary, e.dept_id FROM employee e WHERE e.salary IN (SELECT MAX(SALARY) FROM employee GROUP BY dept_id);

SELECT d.dept_name FROM employee e INNER JOIN department d ON e.dept_id=d.dept_id GROUP BY d.dept_name HAVING COUNT(e.emp_id)<3 ;

SELECT COUNT(E.emp_id), d.dept_name FROM employee e INNER JOIN department d ON e.dept_id=d.dept_id GROUP BY d.dept_name;

SELECT SUM(e.salary), d.dept_name FROM employee e INNER JOIN department d ON e.dept_id=d.dept_id GROUP BY d.dept_name;