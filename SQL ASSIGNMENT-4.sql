CREATE DATABASE [SQL-4]
USE [SQL-4]

CREATE TABLE STUDENT(
STUDENT_ID INT PRIMARY KEY,
STUDENT_NAME VARCHAR(50),
SURNAME VARCHAR(50),
BIRTHDATE DATE,
GENDER CHAR(1),
CLASS VARCHAR(5),
POINT INT);
SELECT * FROM STUDENT
EXEC SP_RENAME 'STUDENT','STUDENTS'

CREATE TABLE AUTHORS(
AUTHOR_ID INT PRIMARY KEY,
AUTHOR_NAME VARCHAR(50),
SURNAME VARCHAR(50)
);

CREATE TABLE TYPES(
TYPE_ID INT PRIMARY KEY,
TYPE_NAME VARCHAR(100)
);


CREATE TABLE BOOKS(
BOOK_ID INT PRIMARY KEY,
BOOK_NAME VARCHAR(100),
PAGECOUNT INT,
POINT INT,
AUTHOR_ID INT
CONSTRAINT FK_BOOKS_AUTHOR FOREIGN KEY(AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID),
TYPE_ID INT
CONSTRAINT FK_BOOKS_TYPES FOREIGN KEY(TYPE_ID) REFERENCES TYPES(TYPE_ID)
);

CREATE TABLE BORROWS(
BORROW_ID INT,
STUDENT_ID INT,
CONSTRAINT FK_BORROWS_STUDENTS FOREIGN KEY(STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
BOOK_ID INT,
CONSTRAINT FK_BORROWS_BOOKS FOREIGN KEY(BOOK_ID) REFERENCES BOOKS(BOOK_ID),
TAKEN_DATE DATE,
BROUGHT_DATE DATE);
SELECT * FROM STUDENTS
INSERT INTO students (student_Id, STUDENT_NAME, surname,
birthdate, gender, class, point) VALUES
(1, 'John', 'Doe', '2005-01-15', 'M', '10A', 85),
(2, 'Jane', 'Smith', '2006-03-22', 'F', '10B', 90),
(3, 'Alice', 'Johnson', '2005-07-12', 'F', '10A', 88),
(4, 'Bob', 'Brown', '2006-11-30', 'M', '10C', 76),
(5, 'Charlie', 'Davis', '2005-05-05', 'M', '10B', 92),
(6, 'Diana', 'Miller', '2006-06-25', 'F', '10C', 81),
(7, 'Eve', 'Wilson', '2005-09-18', 'F', '10A', 87),
(8, 'Frank', 'Moore', '2006-12-02', 'M', '10B', 80),
(9, 'Grace', 'Taylor', '2005-04-17', 'F', '10C', 83),
(10, 'Hank', 'Anderson', '2006-10-20', 'M', '10A', 78);


INSERT INTO authors (AUTHOR_ID, AUTHOR_NAME, surname) VALUES
(1, 'F. Scott', 'Fitzgerald'),
(2, 'Harper', 'Lee'),
(3, 'George', 'Orwell'),
(4, 'Jane', 'Austen'),
(5, 'J.D.', 'Salinger'),
(6, 'J.R.R.', 'Tolkien'),
(7, 'Herman', 'Melville'),
(8, 'Leo', 'Tolstoy'),
(9, 'James', 'Joyce'),
(10, 'Homer', '');

INSERT INTO types (TYPE_ID, TYPE_NAME) VALUES
(1, 'Fiction'),
(2, 'Classic'),
(3, 'Dystopian'),
(4, 'Literature'),
(5, 'Fantasy'),
(6, 'Adventure'),
(7, 'Historical Fiction'),
(8, 'Science Fiction'),
(9, 'Mythology'),
(10, 'Philosophy');

INSERT INTO books (book_Id, BOOK_NAME, pagecount, point,
AUTHOR_ID, TYPE_ID) VALUES
(1, 'The Great Gatsby', 180, 95, 1, 1),
(2, 'To Kill a Mockingbird', 281, 90, 2, 2),
(3, '1984', 328, 88, 3, 3),
(4, 'Pride and Prejudice', 279, 93, 4, 4),
(5, 'The Catcher in the Rye', 214, 85, 5, 1),
(6, 'The Hobbit', 310, 91, 6, 2),
(7, 'Moby-Dick', 635, 80, 7, 3),
(8, 'War and Peace', 1225, 92, 8, 4),
(9, 'Ulysses', 730, 89, 9, 1),
(10, 'The Odyssey', 541, 87, 10, 2);


INSERT INTO borrows (BORROW_ID, STUDENT_ID, BOOK_ID,
taken_Date, BROUGHT_DATE) VALUES
(1, 1, 3, '2024-01-10', '2024-01-20'),
(2, 2, 5, '2024-01-12', '2024-01-22'),
(3, 3, 7, '2024-01-15', '2024-01-25'),
(4, 4, 2, '2024-01-18', '2024-01-28'),
(5, 5, 1, '2024-01-20', '2024-01-30'),
(6, 6, 4, '2024-01-22', '2024-02-01'),
(7, 7, 6, '2024-01-24', '2024-02-03'),
(8, 8, 8, '2024-01-26', '2024-02-05'),
(9, 9, 10, '2024-01-28', '2024-02-07'),
(10, 10, 9, '2024-01-30', '2024-02-09');
--List all the records in the student
SELECT * FROM STUDENTS
--Example 2: List the name surname and class of the student in the student table
SELECT STUDENT_NAME,SURNAME,CLASS FROM STUDENTS
--Example 3: List the gender Female (F) records in the student table
SELECT * FROM STUDENTS 
WHERE GENDER = 'F'
--Example 4 : List the names of each class in the way of being seen once in the student table
SELECT DISTINCT(CLASS) FROM STUDENTS

SELECT CLASS
FROM STUDENTS
GROUP BY CLASS
HAVING COUNT(*) = 1;

--Example 8: List the students name and surname by combining them as name surname in the student table
SELECT STUDENT_NAME + ' ' + SURNAME  [NAME SURNAME] FROM STUDENTS

--Example 9: List the students with the names starting with “A” letter in the student table
SELECT STUDENT_NAME FROM STUDENTS
WHERE STUDENT_NAME LIKE 'A%'

--Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table
SELECT BOOK_NAME , PAGECOUNT FROM BOOKS
WHERE PAGECOUNT BETWEEN 50 AND 200

--Example 11: List the students with names Emma Sophia and Robert in the student table
SELECT * FROM STUDENTS
WHERE STUDENT_NAME IN ('EMMA','SOPHIA','ROBERT')

--Example 12: List the students with names starting with A D and K in the student table
SELECT * FROM STUDENTS 
WHERE STUDENT_NAME IN ('A%','D%','K%');

SELECT * FROM STUDENTS
WHERE STUDENT_NAME LIKE 'A%'
OR STUDENT_NAME LIKE 'D%'
OR STUDENT_NAME LIKE 'K%';

--Example 15: List the students with birth year 1989 in the student table
SELECT * FROM STUDENTS 
WHERE YEAR(BIRTHDATE) = 1989

--Example 16: List the female students with student numbers between 30 and 50
SELECT * FROM STUDENTS 
WHERE GENDER = 'F' AND STUDENT_ID BETWEEN 30 AND 50

--Example 17: List the students according to their names
SELECT * FROM STUDENTS
ORDER BY STUDENT_NAME

--Example 18: List the students by names for those with same names. List them by their surnames

--Example 20: List the first 10 records in the student chart
select top 10 * from students

--Example 21: List the first 10 records name surname and date of birth information in the student table
SELECT TOP 10 STUDENT_NAME,SURNAME, BIRTHDATE FROM STUDENTS

--Example 22: List the book with the most page number

SELECT TOP 1 PAGECOUNT, BOOK_NAME FROM BOOKS
ORDER BY PAGECOUNT DESC;

SELECT BOOK_NAME FROM BOOKS WHERE PAGECOUNT = (SELECT MAX(PAGECOUNT)  AS [MAX PAGE COUNT] FROM BOOKS)

--Example 23: List the youngest student in the student table

SELECT TOP 1 BIRTHDATE, STUDENT_NAME FROM STUDENTS
ORDER BY BIRTHDATE DESC;

--Example 25: List the books with the second letter N
SELECT BOOK_NAME FROM BOOKS
WHERE BOOK_NAME LIKE '_N%'

SELECT* FROM students
SELECT* FROM BORROWS
SELECT* FROM BOOKS
SELECT* FROM AUTHORS
SELECT* FROM TYPES

--Example 26: List the students by grouping according to their classes
SELECT CLASS,COUNT(*) AS [NO. OF STUDNETS] FROM STUDENTS
GROUP BY CLASS


SELECT CLASS,COUNT(*) AS [NO. OF STUDNETS] FROM STUDENTS
GROUP BY CLASS

--Example 30: Add the writer named Smith Allen to the authors table
INSERT INTO AUTHORS(AUTHOR_ID,AUTHOR_NAME,SURNAME)
VALUES
(11,'SMITH','ALLEN')

--Example 38: Increase all of the students’ score by 5 points
UPDATE STUDENTS
SET POINT = POINT+5

--Example 40: List the students whose birth dates are null
SELECT STUDENT_ID FROM STUDENTS
WHERE BIRTHDATE = NULL

--Example 41: List the name ,surname and the dates of received books of the student
SELECT S.STUDENT_NAME,S.SURNAME,B.TAKEN_DATE 
FROM STUDENTS S
JOIN BORROWS B ON
S.STUDENT_ID = B.STUDENT_ID

--Example 39: Delete the author #2 ERROR

DELETE FROM AUTHORS
WHERE AUTHOR_ID = 2