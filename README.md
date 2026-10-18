# Employee Management System (SQL)

A relational database project built in **MySQL** that manages departments, employees, projects, and project assignments. It includes the database schema, sample data, and a set of queries covering core SQL concepts, from basic filtering to joins and correlated subqueries.

## Table of Contents

- [Features](#features)
- [Database Tables](#database-tables)
- [Table Structure](#table-structure)
- [Queries Covered](#queries-covered)
- [Getting Started](#getting-started)
- [Sample Queries](#sample-queries)
- [Skills Used](#skills-used)
- [Author](#author)

## Features

- Database design with primary keys and foreign keys
- Sample data: 5 departments, 30 employees, 8 projects, and 30 project assignments
- Many-to-many relationship between employees and projects
- Queries grouped by topic: filtering, aggregates, joins, and subqueries

## Database Tables

- Departments
- Employees
- Projects
- Employee_Projects

## Table Structure

### Departments

| Column | Data Type | Key |
|---|---|---|
| Department_ID | INT | Primary Key |
| Department_Name | VARCHAR(50) | NOT NULL |
| Location | VARCHAR(50) | |

### Employees

| Column | Data Type | Key |
|---|---|---|
| Employee_ID | INT | Primary Key, Auto Increment (starts at 101) |
| Employee_Name | VARCHAR(50) | |
| Employee_Age | INT | |
| Salary | DECIMAL(10,2) | |
| Department_ID | INT | Foreign Key (Departments) |
| Joining_Date | DATE | |

### Projects

| Column | Data Type | Key |
|---|---|---|
| Project_ID | INT | Primary Key |
| Project_Name | VARCHAR(50) | NOT NULL |
| Department_ID | INT | Foreign Key (Departments) |

### Employee_Projects

| Column | Data Type | Key |
|---|---|---|
| Employee_ID | INT | Primary Key, Foreign Key (Employees) |
| Project_ID | INT | Primary Key, Foreign Key (Projects) |
| Assign_Date | DATE | |

## Queries Covered

### Basic Filtering and Sorting

- Employees earning more than ₹40,000
- Employees sorted by salary (descending)
- Top 5 highest-paid employees
- Names starting with a given letter (`LIKE`)
- Salaries within a range (`BETWEEN`)

### Aggregate Functions

- Total employees, average salary, highest and lowest salary, total salary expenditure
- Employee count and average salary per department (`GROUP BY`)
- Departments with more than three employees (`HAVING`)

### Joins

- Employees with their department names and locations
- Employees in a specific department (IT)
- Employees assigned to projects, and employees on a particular project
- All departments including those without employees (`LEFT JOIN`)

### Subqueries

- Employees earning above the company average
- Employee with the highest salary
- Employees earning above their own department's average (correlated subquery)
- Departments whose average salary is above the company average
- Employees who earn the same salary as at least one other employee
- Employees not assigned to any project (`NOT EXISTS`)
- Department with the highest number of employees

## Getting Started

### Prerequisites

- MySQL 8.0 or later
- MySQL Workbench or any MySQL client (optional)

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/ajaychidarla143/Employee--Management--system.git/<ajaychidarla143>/<Employee--Management--system>.git
   cd <Employee--Management--system>
   ```

2. Run the script from the MySQL command line:
   ```bash
   mysql -u root -p < employee_management_system.sql
   ```
   Or open the file in MySQL Workbench and click **Execute**.

3. Select the database and explore:
   ```sql
   USE Employee_Management_System;
   SHOW TABLES;
   ```

## Sample Queries

**Top 5 highest-paid employees**
```sql
SELECT * FROM Employees
ORDER BY Salary DESC
LIMIT 5;
```

**Employees with their department names**
```sql
SELECT E.Employee_Name, D.Department_Name
FROM Employees E
JOIN Departments D ON E.Department_ID = D.Department_ID;
```

**Employees earning more than their department's average**
```sql
SELECT *
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department_ID = E.Department_ID
);
```

**Employees not assigned to any project**
```sql
SELECT *
FROM Employees E
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee_Projects EP
    WHERE EP.Employee_ID = E.Employee_ID
);
```

## Skills Used

- MySQL
- DDL and DML
- SELECT queries
- WHERE, ORDER BY, LIMIT, and LIKE
- Aggregate functions
- GROUP BY and HAVING
- JOINs
- Subqueries and correlated subqueries
- Primary keys and foreign keys

## Author

**Ajay Chidarla**
Python Developer (Fresher) | Hyderabad, India

- GitHub: [@ajaychidarla143] (https://github.com/ajaychidarla143)
- LinkedIn: [Ajay chidarla] (www.linkedin.com/in/
ajay-chidarla-aa3733253)
