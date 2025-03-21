CREATE DATABASE [SQL-2]
CREATE TABLE EmployeeDetails (
 EmpId INT PRIMARY KEY,
 FullName VARCHAR(100),
 ManagerId INT,
 DateOfJoining DATE,
 City VARCHAR(100)
);
CREATE TABLE EmployeeSalary (
 EmpId INT,
 Project VARCHAR(50),
 Salary DECIMAL(10, 2),
 Variable DECIMAL(10, 2),
 FOREIGN KEY (EmpId) REFERENCES
EmployeeDetails(EmpId)
);
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId,
DateOfJoining, City) VALUES
(101, 'Alice Johnson', 321, '2022-05-15', 'New York'),
(102, 'Bob Smith', 876, '2020-03-12', 'Los Angeles'),
(103, 'Charlie Brown', 986, '2021-08-23', 'Chicago'),
(104, 'David Williams', 876, '2019-11-05', 'Houston'),
(105, 'Eve Davis', 321, '2023-01-07', 'Phoenix'),
(106, 'Frank Miller', 986, '2018-12-19', 'Philadelphia'),
(107, 'Grace Wilson', 876, '2022-03-28', 'San Antonio'),
(108, 'Hank Moore', 321, '2021-09-14', 'San Diego'),
(109, 'Ivy Taylor', 986, '2020-02-11', 'Dallas'),
(110, 'Jack Anderson', 876, '2022-11-30', 'San Jose'),
(111, 'Karen Thomas', 321, '2021-07-16', 'Austin'),
(112, 'Liam Jackson', 986, '2023-04-21', 'Fort Worth'),
(113, 'Mia White', 876, '2019-06-03', 'Columbus'),
(114, 'Noah Harris', 321, '2020-12-10', 'Charlotte'),
(115, 'Olivia Martin', 986, '2021-10-25', 'San Francisco'),
(116, 'Paul Garcia', 876, '2023-07-18', 'Indianapolis'),
(117, 'Quinn Martinez', 321, '2022-09-07', 'Seattle'),
(118, 'Rachel Rodriguez', 986, '2020-01-15', 'Denver'),
(119, 'Steve Clark', 876, '2021-03-19', 'Washington'),
(120, 'Tina Lewis', 321, '2019-08-31', 'Boston');

INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable)
VALUES
(101, 'P1', 7500, 500),
(102, 'P2', 9200, 700),
(103, 'P1', 6700, 600),
(104, 'P3', 8300, 900),
(105, 'P2', 7800, 800),
(106, 'P3', 9100, 1000),
(107, 'P1', 6200, 400),
(108, 'P2', 8800, 750),
(109, 'P3', 9500, 1100),
(110, 'P1', 7200, 650),
(111, 'P2', 8700, 850),
(112, 'P3', 9300, 1200),
(113, 'P1', 7900, 550),
(114, 'P2', 6800, 450),
(115, 'P3', 8400, 900),
(116, 'P1', 7600, 500),
(117, 'P2', 8900, 1000),
(118, 'P3', 9200, 1100),
(119, 'P1', 8100, 600),
(120, 'P2', 8300, 750);

--2.)SQL query to fetch all the employees who are not working on any project.
SELECT ED.EMPID,ED.FULLNAME,ES.PROJECT
FROM EmployeeDetails ED
LEFT  JOIN EmployeeSalary ES
ON ED.EMPID=ES.EmpId
WHERE ES.PROJECT IS NULL

--3.)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.
SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020

--4.)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
SELECT ED.EMPID,ED.FULLNAME,ES.SALARY
FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES
ON ED.EMPID = ES.EmpId

--Q5)Write an SQL query to fetch a project-wise count of employees.
SELECT Project, COUNT(PROJECT) AS [PROJECT-WISE COUNT]  FROM EmployeeSalary
GROUP BY Project

SELECT * FROM EmployeeDetails
SELECT * FROM EmployeeSalary

---6)Fetch employee names and salaries even if the salary value is not present for the employee.
SELECT ED.EMPID, ED.FULLNAME,ES.SALARY
FROM EmployeeDetails ED
LEFT JOIN EmployeeSalary ES ON
ED.EmpId = ES.EmpId

--7.)Write an SQL query to fetch all the Employees who are also managers.

SELECT E1.FULLNAME AS EMPLOYEE,E2.FULLNAME AS MANAGER
FROM EmployeeDetails E1
INNER JOIN EMPLOYEEDETAILS E2
ON E1.ManagerId= E2.EmpId
--8.)Write an SQL query to fetch duplicate records from EmployeeDetails.

--PRT 2
--Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – „986‟.
SELECT EMPID,FULLNAME FROM EmployeeDetails
WHERE MANAGERID = 986

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT DISTINCT PROJECT FROM EmployeeSalary

--Ques.3. Write an SQL query to fetch the count of employees working in project P1
SELECT COUNT(PROJECT) AS [EMPLOYEE'S WORKING IN PROJECT P1] FROM EmployeeSalary
WHERE PROJECT = 'P1'

--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT MIN(SALARY) AS MINIMUM_SALARY,MAX(SALARY) AS MAXIMUM_SALARY,AVG(SALARY) AS AVERAGE_SALARY FROM	EmployeeSalary

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
SELECT EMPID, SALARY FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000
--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT FULLNAME, EMPID FROM EmployeeDetails
WHERE CITY = 'Toronto' AND ManagerId = 321
--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
SELECT FULLNAME,EMPID FROM EmployeeDetails
where city = 'CALIFORNIA' OR MANAGERID = 321
--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.
SELECT EMPID,PROJECT FROM EmployeeSalary
WHERE NOT PROJECT= 'P1'
--Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value
--Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
SELECT FULLNAME FROM EmployeeDetails
WHERE FULLNAME LIKE '__%HN%'
--PART-3
--Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables – „EmployeeDetails‟ and „EmployeeSalary‟.
SELECT ED.EMPID
FROM EmployeeDetails ED
FULL OUTER JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId
--Ques.2 Write an SQL query to fetch common records between two tables
SELECT ED.EMPID,ED.FULLNAME,ES.PROJECT,ES.SALARY
FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES ON ED.EMPID = ES.EmpId
--Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.
SELECT ED.*
FROM EmployeeDetails ED 
LEFT JOIN EmployeeSalary ES ON
ED.EMPID =  ES.EMPID
WHERE ES.EMPID IS NULL
--Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables – „EmployeeDetails‟ and „EmployeeSalary.
SELECT ED.EMPID 
FROM EmployeeDetails ED 
INNER JOIN EmployeeSalary ES ON
ED.EMPID = ES.EmpId
--Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
SELECT ED.EMPID
FROM EmployeeDetails ED 
LEFT JOIN EmployeeSalary ES ON
ED.EMPID =  ES.EMPID
WHERE ES.EMPID IS NULL
--Ques.8. Write an SQL query to display both the EmpId and ManagerId together.
SELECT EMPID,MANAGERID FROM EmployeeDetails
SELECT * FROM EmployeeDetails
SELECT* FROM EmployeeSalary
--Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.
SELECT UPPER(FULLNAME) AS UPPE4WE5RFGV FVGRCASE, LOWER(CITY) AS LOWERCASE FROM EmployeeDetails
