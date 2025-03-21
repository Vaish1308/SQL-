CREATE DATABASE [VK UNIVERSITY]
CREATE TABLE COLLEGE_TABLE(
COOLEGE_ID INT PRIMARY KEY,
COLLEGE_NAME VARCHAR(100),
COOLEGE_AREA VARCHAR(200)
);
EXEC SP_RENAME 'COLLEGE_TABLE.COOLEGE_AREA','COLLEGE_AREA','COLUMN'
CREATE TABLE DEPARTMENT_TABLE(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(150),
DEPT_FACILITY VARCHAR(100)
);
CREATE TABLE PROFESSOR_TABLE(
PROFESSOR_ID INT PRIMARY KEY,
PROFESSOR_NAME VARCHAR(100),
PROFESSOR_SUBJECT VARCHAR(150)
);
CREATE TABLE STUDENT_TABLE(
STUDENT_ID INT PRIMARY KEY,
STUDENT_NAME VARCHAR(150),
STUDENT_STREAM VARCHAR(150)
);
--4. Apply foreign Key on Student_Table from Professor_Table
ALTER TABLE STUDENT_TABLE
ADD PROFESSOR_ID INT
ALTER TABLE STUDENT_TABLE
ADD CONSTRAINT FK_STUDENT_PROFESOR FOREIGN KEY(PROFESSOR_ID) REFERENCES PROFESSOR_TABLE(PROFESSOR_ID)

EXEC SP_RENAME 'COLLEGE_TABLE.COOLEGE_ID','COLLEGE_ID','COLUMN'

--3. Apply foreign key on Department key from College_table
ALTER TABLE DEPARTMENT_TABLE
ADD COLLEGE_ID INT
ALTER TABLE DEPARTMENT_TABLE
ADD CONSTRAINT FK_DEPARTMENT_COLLEGE FOREIGN KEY(COLLEGE_ID) REFERENCES COLLEGE_TABLE(COLLEGE_ID)

SELECT* FROM DEPARTMENT_TABLE
SELECT* FROM PROFESSOR_TABLE
INSERT INTO COLLEGE_TABLE(COLLEGE_ID, COLLEGE_NAME, COLLEGE_AREA) 
VALUES
(1, 'ABC Engineering College', 'New York'),
(2, 'XYZ University', 'Los Angeles'),
(3, 'PQR Institute of Technology', 'Chicago'),
(4, 'LMN Science College', 'Houston'),
(5, 'DEF Arts College', 'Phoenix'),
(6, 'GHI Management College', 'San Diego'),
(7, 'JKL Polytechnic', 'Dallas'),
(8, 'MNO Medical University', 'San Francisco'),
(9, 'STU Law College', 'Seattle'),
(10, 'VWX Business School', 'Boston');

INSERT INTO DEPARTMENT_TABLE (DEPT_ID, DEPT_NAME, DEPT_FACILITY, COLLEGE_ID) VALUES
(1, 'Computer Science', 'AI Lab', 1),
(2, 'Mechanical Engineering', 'Workshop', 1),
(3, 'Electronics', 'Circuit Lab', 2),
(4, 'Civil Engineering', 'Survey Lab', 3),
(5, 'Physics', 'Research Lab', 4),
(6, 'Mathematics', 'Data Center', 5),
(7, 'Management', 'Seminar Hall', 6),
(8, 'Medical', 'Anatomy Lab', 8),
(9, 'Law', 'Moot Court', 9),
(10, 'Business', 'Trading Room', 10);

INSERT INTO PROFESSOR_TABLE (PROFESSOR_ID, PROFESSOR_NAME, PROFESSOR_SUBJECT) VALUES
(1, 'Dr. John Smith', 'Data Structures'),
(2, 'Dr. Alice Brown', 'Thermodynamics'),
(3, 'Dr. Robert Johnson', 'Microcontrollers'),
(4, 'Dr. Emily Davis', 'Structural Analysis'),
(5, 'Dr. Michael Wilson', 'Quantum Physics'),
(6, 'Dr. Sarah Thompson', 'Probability'),
(7, 'Dr. Kevin Anderson', 'Corporate Strategy'),
(8, 'Dr. Jessica Martinez', 'Human Anatomy'),
(9, 'Dr. David Garcia', 'Criminal Law'),
(10, 'Dr. Linda White', 'Finance Management');

INSERT INTO STUDENT_TABLE (STUDENT_ID, STUDENT_NAME, STUDENT_STREAM, PROFESSOR_ID) VALUES
(1, 'Alice Johnson', 'Computer Science', 1),
(2, 'Bob Smith', 'Mechanical Engineering', 2),
(3, 'Charlie Davis', 'Electronics', 3),
(4, 'David Wilson', 'Civil Engineering', 4),
(5, 'Eve Brown', 'Physics', 5),
(6, 'Frank Garcia', 'Mathematics', 6),
(7, 'Grace Martinez', 'Management', 7),
(8, 'Henry White', 'Medical', 8),
(9, 'Ivy Thompson', 'Law', 9),
(10, 'Jack Anderson', 'Business', 10);
--1. Give the information of College_ID and College_name from College_Table
SELECT COLLEGE_ID,COLLEGE_NAME FROM COLLEGE_TABLE
--2. Show Top 5 rows from Student table.
SELECT TOP 5 * FROM STUDENT_TABLE
--3. What is the name of professor whose ID is 5
SELECT * FROM PROFESSOR_TABLE
SELECT PROFESSOR_NAME FROM PROFESSOR_TABLE
WHERE PROFESSOR_ID = 5
--4. Convert the name of the Professor into Upper case
SELECT UPPER(PROFESSOR_NAME) AS UPPER FROM PROFESSOR_TABLE
--5. Show me the names of those students whose name is start with a
SELECT * FROM STUDENT_TABLE
SELECT STUDENT_NAME FROM STUDENT_TABLE
WHERE STUDENT_NAME LIKE 'A%'
--6. Give the name of those colleges whose end with a
SELECT * FROM COLLEGE_TABLE
SELECT COLLEGE_NAME FROM COLLEGE_TABLE
WHERE COLLEGE_NAME LIKE '%A'
--6. Rename the College_Table to College_Tables_Data 
EXEC SP_RENAME 'COLLEGE_TABLE','COLLEGE_TABLES_DATE'
--7. Add one Salary Column in Professor_Table
ALTER TABLE PROFESSOR_TABLE
ADD SALARY FLOAT
--8. Add one Contact Column in Student_table
ALTER TABLE STUDENT_TABLE
ADD CONTACT VARCHAR(15)
--9. Find the total Salary of Professor
SELECT SUM(SALARY) AS TOTAL_SALARY FROM PROFESSOR_TABLE
--10. Change datatype of any one column of any one Table
ALTER TABLE STUDENT_TABLE
ALTER COLUMN CONTACT VARCHAR(20)

EXEC SP_RENAME 'COLLEGE_TABLES_DATE','COLLEGE_TABLE'

SELECT * FROM COLLEGE_TABLE
SELECT * FROM DEPARTMENT_TABLE
SELECT * FROM PROFESSOR_TABLE
SELECT * FROM STUDENT_TABLE

--Apply Inner join on all 4 tables together(Syntax is mandatory)
SELECT 
    S.STUDENT_ID, S.STUDENT_NAME, S.STUDENT_STREAM,
    P.PROFESSOR_ID, P.PROFESSOR_NAME, P.PROFESSOR_SUBJECT,
    D.DEPT_ID, D.DEPT_NAME, D.DEPT_FACILITY,
    C.COLLEGE_ID, C.COLLEGE_NAME, C.COLLEGE_AREA
FROM STUDENT_TABLE S
INNER JOIN PROFESSOR_TABLE P ON S.PROFESSOR_ID = P.PROFESSOR_ID
INNER JOIN DEPARTMENT_TABLE D ON P.PROFESSOR_ID = D.DEPT_ID
INNER JOIN COLLEGE_TABLE C ON D.COLLEGE_ID = C.COLLEGE_ID;