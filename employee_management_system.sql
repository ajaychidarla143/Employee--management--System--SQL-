-- Creating a database
create database Employee_Management_System;


use employee_Management_System;

-- creating a table
create table Departments(
Department_ID INT PRIMARY KEY,
Department_Name VARCHAR(50) NOT NULL,
Location VARCHAR(50)
);

-- inserting the data
INSERT INTO Departments (Department_ID, Department_Name, Location)
VALUES
(1, 'IT', 'Hyderabad'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Chennai'),
(4, 'Marketing', 'Mumbai'),
(5, 'Sales', 'Pune');

SELECT * FROM Departments;


create table Employees(
Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
Employee_Name VARCHAR(50),
Employee_Age INT,
Salary DECIMAL(10,2),
Department_ID INT,
Joining_Date DATE,
FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
) AUTO_INCREMENT=101;



INSERT INTO employees (Employee_Name, Employee_Age, Salary, Department_ID, Joining_Date)
VALUES
('Ajay', 22, 45000, 1, '2025-01-15'),
('Ravi', 25, 55000, 1, '2024-06-10'),
('Kiran', 24, 35000, 2, '2025-03-20'),
('Suresh', 28, 65000, 1, '2023-08-12'),
('Priya', 23, 40000, 2, '2025-02-05'),
('Anil', 30, 75000, 3, '2022-11-18'),
('Sneha', 26, 50000, 3, '2024-04-22'),
('Arjun', 27, 60000, 4, '2023-09-14'),
('Divya', 24, 38000, 4, '2025-05-01'),
('Vikram', 29, 70000, 5, '2022-07-25'),
('Rahul', 23, 30000, 5, '2025-06-11'),
('Meena', 26, 48000, 1, '2024-12-01'),
('Varun', 31, 85000, 3, '2021-10-10'),
('Akhil', 22, 32000, 2, '2025-07-15'),
('Pooja', 27, 52000, 4, '2023-12-20'),
('Naveen', 25, 45000, 1, '2024-08-05'),
('Swathi', 28, 62000, 5, '2023-05-17'),
('Manoj', 24, 40000, 2, '2025-04-08'),
('Deepak', 29, 58000, 3, '2022-09-30'),
('Asha', 26, 35000, 5, '2024-02-14'),
('Sanjay', 27, 42000, 1, '2024-03-12'),
('Lakshmi', 24, 36000, 2, '2025-08-10'),
('Praveen', 29, 68000, 3, '2023-04-18'),
('Kavya', 23, 47000, 4, '2025-01-25'),
('Ramesh', 31, 72000, 5, '2022-06-14'),
('Harish', 26, 55000, 1, '2024-11-20'),
('Sravani', 25, 39000, 2, '2025-02-17'),
('Tarun', 28, 80000, 3, '2022-12-05'),
('Bhavana', 22, 44000, 4, '2025-06-22'),
('Mahesh', 30, 63000, 5, '2023-07-08');

SELECT * FROM Employees;

CREATE TABLE Projects(
Project_ID INT PRIMARY KEY,
Project_Name VARCHAR(50) NOT NULL,
Department_ID int,
FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

INSERT INTO Projects (Project_ID, Project_Name, Department_ID)
VALUES
(201, 'Website Development', 1),
(202, 'Employee Portal', 1),
(203, 'Recruitment System', 2),
(204, 'Financial Dashboard', 3),
(205, 'Marketing Campaign', 4),
(206, 'Sales Analytics', 5),
(207, 'Database Migration', 1),
(208, 'Payroll System', 3);

SELECT * FROM Projects;

CREATE TABLE Employee_Projects(
Employee_ID INT,
Project_ID INT,
Assign_Date DATE,
PRIMARY KEY (Employee_ID, Project_ID),
FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
); 

INSERT INTO employee_projects
(Employee_ID, Project_ID, Assign_Date)
VALUES
(101, 201, '2025-02-01'),
(101, 202, '2025-03-15'),
(102, 201, '2024-07-01'),
(103, 203, '2025-04-01'),
(104, 207, '2023-09-01'),
(105, 203, '2025-03-10'),
(106, 204, '2022-12-01'),
(107, 208, '2024-05-15'),
(108, 205, '2023-10-01'),
(109, 205, '2025-05-15'),
(110, 206, '2022-08-01'),
(112, 202, '2025-01-10'),
(113, 204, '2021-11-01'),
(115, 205, '2024-01-15'),
(116, 207, '2024-09-01'),
(117, 206, '2023-06-01'),
(119, 208, '2023-01-15'),
(121, 201, '2024-04-01'),
(122, 203, '2025-09-01'),
(123, 204, '2023-05-01'),
(124, 205, '2025-02-10'),
(125, 206, '2022-07-01'),
(126, 202, '2024-12-01'),
(127, 203, '2025-03-01'),
(128, 208, '2023-01-10'),
(129, 205, '2025-07-01'),
(130, 206, '2023-08-01'),
(126, 207, '2025-01-15'),
(128, 204, '2023-03-01'),
(130, 201, '2024-01-01');

SELECT * FROM Employee_projects;

-- Project Tasks
-- Find employees earning more than ₹40,000.
SELECT * FROM Employees
where salary > 40000;

-- Display employees in descending salary order.
SELECT * FROM Employees
ORDER BY salary DESC;

-- Find the five highest-paid employees.
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- Display employees whose names start with A.
SELECT * FROM Employees
WHERE Employee_name 
LIKE  'A%';

-- Find employees whose salaries are between ₹30,000 and ₹60,000.
SELECT * FROM Employees
WHERE salary BETWEEN 30000 AND 60000;

-- AGGREGATE FUNCTIONS
-- Count the total number of employees.
SELECT COUNT(*) FROM Employees;

-- Calculate the average employee salary
SELECT AVG(salary) FROM Employees;

-- Find the highest and lowest salaries.
-- Highest
SELECT MAX(salary) FROM Employees;
-- Lowest 
SELECT MIN(salary) FROM Employees;

-- Calculate the total salary expenditure.
SELECT SUM(salary) FROM Employees;

-- Count the employees in each department.
SELECT Department_ID, COUNT(*) AS Total_Employees FROM Employees
GROUP BY Department_ID;

-- Calculate the average salary for each department.
SELECT Department_ID, AVG(salary) AS Average_salary FROM Employees
GROUP BY Department_ID;

-- Display departments with more than three employees.
SELECT Department_ID, COUNT(*) AS MoreThan_3Employees FROM Employees
GROUP BY Department_ID
HAVING COUNT(*) > 3;

-- JOINS
-- Display employee names with their department names.

SELECT E.Employee_Name, D.Department_Name FROM Employees E
JOIN Departments D ON E.Department_ID = D.Department_ID;

-- Display employees with their department locations.

SELECT E.Employee_Name, D.Location FROM Employees E
JOIN Departments D ON E.Department_ID = D.Department_ID;

-- Find employees who work in the IT department.

SELECT E.Employee_Name, D.Department_Name FROM Employees E
JOIN Departments D ON E.Department_ID = D.Department_ID
WHERE D.Department_Name = 'IT';

-- Display all employees assigned to projects.

SELECT E.Employee_Name, P.Project_Name FROM Employees E
JOIN Employee_Projects EP ON E.Employee_ID = EP.Employee_ID
JOIN Projects P ON P.Project_ID = EP.Project_ID;

-- Find the employees working on a particular project.

SELECT E.Employee_Name, P.Project_Name FROM Employees E
JOIN Employee_Projects EP ON E.Employee_ID = EP.EMployee_ID
JOIN Projects P ON EP.Project_ID = P.Project_ID
WHERE Project_Name='Database Migration';

-- Display all departments, including those without employees.

SELECT D.Department_Name, Employee_Name FROM Departments D
LEFT JOIN Employees E ON D.Department_ID = E.Department_ID;

-- SUBQUERIES
-- Find employees earning more than the company's average salary.
SELECT * FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Find the employee receiving the highest salary.
select * from employees
where salary = (select max(salary) from Employees);

-- Find employees earning more than the average salary of their own department.
SELECT *
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department_ID = E.Department_ID
);

-- Find departments whose average salary is greater than the company's overall average salary.
SELECT D.Department_ID, D.Department_Name
FROM Departments D
WHERE (
    SELECT AVG(E.Salary)
    FROM Employees E
    WHERE E.Department_ID = D.Department_ID
) > (
    SELECT AVG(Salary)
    FROM Employees
);

-- Find employees who earn the same salary as at least one other employee.
SELECT *
FROM Employees E
WHERE Salary IN (
    SELECT Salary
    FROM Employees
    GROUP BY Salary
    HAVING COUNT(*) > 1
);

-- Find employees who are not assigned to any project.
SELECT *
FROM Employees E
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee_Projects EP
    WHERE EP.Employee_ID = E.Employee_ID
);

-- Find the department with the highest number of employees.
SELECT D.Department_ID, D.Department_Name
FROM Departments D
WHERE (
    SELECT COUNT(*)
    FROM Employees E
    WHERE E.Department_ID = D.Department_ID
) = (
    SELECT MAX(Employee_Count)
    FROM (
        SELECT COUNT(*) AS Employee_Count
        FROM Employees
        GROUP BY Department_ID
    ) AS Department_Counts
);



