CREATE DATABASE [PROJECT-1]
use  [PROJECT-1]
CREATE TABLE regions (
region_id INT PRIMARY KEY,
region_name VARCHAR (25) DEFAULT NULL
);
CREATE TABLE countries (
country_id CHAR (2) PRIMARY KEY, 
country_name VARCHAR (40) DEFAULT NULL, 
region_id INT NOT NULL,
FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE locations (
location_id INT PRIMARY KEY,
street_address VARCHAR (40) DEFAULT NULL,
postal_code VARCHAR (12) DEFAULT NULL, 
city VARCHAR (30) NOT NULL,
state_province VARCHAR (25) DEFAULT NULL, 
country_id CHAR (2) NOT NULL,
FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE jobs (
job_id INT PRIMARY KEY,
job_title VARCHAR (35) NOT NULL,
min_salary DECIMAL (8, 2) DEFAULT NULL,
max_salary DECIMAL (8, 2) DEFAULT NULL
);
CREATE TABLE departments ( 
department_id INT PRIMARY KEY,
department_name VARCHAR (30) NOT NULL, 
location_id INT DEFAULT NULL,
FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE employees ( 
employee_id INT PRIMARY KEY,
first_name VARCHAR (20) DEFAULT NULL, 
last_name VARCHAR (25) NOT NULL,
email VARCHAR (100) NOT NULL,
phone_number VARCHAR (20) DEFAULT NULL,
hire_date DATE NOT NULL,
job_id INT NOT NULL,
salary DECIMAL (8, 2) NOT NULL,
manager_id INT DEFAULT NULL,
department_id INT DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);
CREATE TABLE dependents ( 
dependent_id INT PRIMARY KEY,
first_name VARCHAR (50) NOT NULL, 
last_name VARCHAR (50) NOT NULL, 
relationship VARCHAR (25) NOT NULL, 
employee_id INT NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
/*Data for the table regions */

INSERT INTO regions(region_id,region_name)
VALUES 
(1,'Europe'),
(2,'Americas'),
(3,'Asia'),
(4,'Middle East and Africa');

/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);


SELECT * FROM locations
/*Data for the table locations */
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

/*Data for the table jobs */
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);

/*Data for the table departments */
INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);
SELECT * FROM employees
/*Data for the table employees */
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06- 17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09- 21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01- 13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01- 03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06- 25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02- 05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02- 07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08- 17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08- 16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10); 
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09- 30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03- 07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12- 07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05- 18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12- 24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07- 24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11- 15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08- 10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07- 18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04- 10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05- 01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10- 10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09- 28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8); 
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01- 05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03- 24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04- 23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05- 24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01- 04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5); 
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03- 03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09- 17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02- 17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2); 
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06- 07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06- 07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06- 07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (206,'Vaishnavi','Vaish','vaishnavi.vaish@sqltutorial.org','630.520.9999','1997-08-13',16,900000,101,8);
/*Data for the table dependents */
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (30,'Sandra','Taylor','Child',176);

/*1)WRITE A QUERY FOR SELECT STATEMENTS :-
A.	To get data from all the rows and columns in the employees table:*/
SELECT * FROM employees
/*B.select data from the employee id, first name, last name, and hire date of all rows in the employees table: */
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE FROM EMPLOYEES
/*C.Increase the salary two times and named as New_SALARY from employees table */
SELECT employee_id, SALARY * 2 AS NEW_SALARY FROM employees
/*D.to get the first name, last name, salary, and new salary: */
SELECT FIRST_NAME,LAST_NAME,SALARY, SALARY * 2 AS NEW_SALARY FROM employees

/*2)	WRITE A QUERY FOR ORDER BY STATEMENTS :-
A.	returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:*/
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,SALARY FROM employees
B.	to sort employees by first names in alphabetical order:*/
SELECT FIRST_NAME FROM employees
ORDER BY FIRST_NAME ASC
/*C.	to sort the employees by the first name in ascending order and the last name in descending order:*/
SELECT FIRST_NAME,LAST_NAME FROM employees
ORDER BY FIRST_NAME ASC, LAST_NAME DESC;
/*D.	to sort employees by salary from high to low*/
SELECT EMPLOYEE_ID,SALARY FROM employees
ORDER BY SALARY DESC
/*E.	to sort the employees by values in the hire_date column from:*/
SELECT * FROM employees
ORDER BY HIRE_DATE
/* F.	sort the employees by the hire dates in descending order:*/
SELECT * FROM employees
ORDER BY HIRE_DATE DESC

/*3)	WRITE A QUERY FOR DISTINCT STATEMENTS :-
A.	selects the salary data from the salary column of the employees table and sorts them from high to low:*/
SELECT DISTINCT SALARY FROM employees
ORDER BY salary DESC
/*B.	select unique values from the salary column of the employees table:*/
SELECT DISTINCT SALARY FROM employees
/*C.	selects the job id and salary from the employees table:*/
SELECT JOB_ID, SALARY FROM employees
/*D.	to remove the duplicate values in job id and salary:*/
SELECT DISTINCT JOB_ID,  SALARY FROM employees
/*E.	returns the distinct phone numbers of employees:*/
SELECT DISTINCT PHONE_NUMBER FROM employees

/*4)	WRITE A QUERY FOR TOP N STATEMENTS :-
A.	returns all rows in the employees table sorted by the first_name column */
SELECT * FROM EMPLOYEES
ORDER BY first_name
/*B.	to return the first 5 rows in the result set returned by the SELECT clause:*/
SELECT TOP 5  * FROM employees
/*C.to return five rows starting from the 4th row:*/
SELECT  * FROM employees
ORDER BY employee_id
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY;
/*D.	gets the top five employees with the highest salaries*/
SELECT TOP 5 * FROM EMPLOYEES
ORDER BY SALARY DESC
/* E.	to get employees who have the 2nd highest salary in the company */
SELECT * FROM employees
ORDER BY SALARY DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY
/*5)	WRITE A QUERY FOR WHERE CLAUSE and COMPARISON OPERATORS 
A.	query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.*/
SELECT * FROM EMPLOYEES
WHERE salary > 14000
ORDER BY SALARY DESC
/*B.query finds all employees who work in the department id 5.*/
SELECT * FROM EMPLOYEES
WHERE department_id = 5
/*C.	query finds the employee whose last name is Chen */
SELECT EMPLOYEE_ID, FIRST_NAME FROM employees
WHERE last_name = 'CHEN'
/*D.	To get all employees who joined the company after January 1st, 1999*/
SELECT * FROM employees
WHERE HIRE_DATE > '1999-01-01' 
/*E.	to find the employees who joined the company in 1999*/
SELECT * FROM employees 
WHERE YEAR(HIRE_DATE) = '1999'
/*F.	statement finds the employee whose last name is Himuro */
SELECT FIRST_NAME FROM employees
WHERE LAST_NAME = 'HIMURO'
/*G.	the query searches for the string Himuro in the last_name column of the employees table.*/
SELECT FIRST_NAME FROM employees
WHERE LAST_NAME LIKE '%HIMURO%'
/* H.	to find all employees who do not have phone numbers:*/
SELECT * FROM employees
WHERE phone_number IS NULL
/*I.	returns all employees whose department id is not 8. */
SELECT * FROM employees WHERE NOT department_id = 8
/*J.	finds all employees whose department id is not eight and ten.*/
SELECT * FROM EMPLOYEES WHERE NOT department_id NOT IN(8,10)
/*K.	to find the employees whose salary is greater than 10,000 */
SELECT * FROM employees 
WHERE SALARY > 10000
/*L.	finds employees in department 8 and have the salary greater than 10,000: */
SELECT * FROM EMPLOYEES WHERE department_id = 8 AND SALARY > 10000
/*M.	the statement below returns all employees whose salaries are less than 10,000:*/
SELECT * FROM employees where salary <10000
/*N.	finds employees whose salaries are greater than or equal 9,000:*/
SELECT * FROM employees WHERE SALARY >= 9000
/*O.	finds employees whose salaries are less than or equal to 9,000:*/
SELECT * FROM employees WHERE SALARY <= 9000

/*6)	WRITE A QUERY FOR:-
A.	adds a new column named credit_hours to the courses table.*/
CREATE TABLE COURSES(
COURSE_ID INT,
COURSE_NAME VARCHAR(80));
ALTER TABLE COURSES 
ADD CREDIT_HOURS FLOAT
/*B.	adds the fee and max_limit columns to the courses table and places these columns after the course_name column.*/
ALTER TABLE COURSES
ADD FEE DECIMAL,MAX_LIMIT INT;
/*C.	changes the attribute of the fee column to NOT NULL.*/
ALTER TABLE COURSES
ALTER COLUMN FEE DECIMAL NOT NULL;
/*D.	to remove the fee column of the courses table*/
ALTER TABLE COURSES
DROP COLUMN FEE
/*E.	removes the max_limit and credit_hours of the courses table.*/
ALTER TABLE COURSES
DROP COLUMN MAX_LIMIT , CREDIT_HOURS;

/*6)WRITE A QUERY FOR:-
A.	to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the projects and project_milestones tables.*/
CREATE TABLE projects (
  project_id INT PRIMARY KEY,
  project_name VARCHAR(255),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);
CREATE TABLE project_milestones(
  milestone_id INT PRIMARY KEY,
  project_id  INT,
  milestone_name VARCHAR(100)
);

ALTER TABLE PROJECT_MILESTONEs
ADD CONSTRAINT fk_PROJECTS_PROJECT_MILESTONE FOREIGN KEY(PROJECT_ID) REFERENCES PROJECTS(PROJECT_ID)
on delete cascade

/********TASK -2******/
/*1)	WRITE A QUERY FOR LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-
Part 1:-
A.	finds all employees whose salaries are greater than 5,000 and less than 7,000:  */
SELECT * FROM EMPLOYEES
WHERE SALARY > 5000 AND SALARY < 7000
/*B.	finds employees whose salary is either 7,000 or 8,000:*/
SELECT * FROM EMPLOYEES 
WHERE SALARY = 7000 OR salary = 8000

SELECT * FROM EMPLOYEES
WHERE salary IN (7000,8000)
/*C.	finds all employees who do not have a phone number:*/
SELECT * FROM EMPLOYEES
WHERE phone_number IS null
/*D.	finds all employees whose salaries are between 9,000 and 12,000.*/
SELECT * FROM employees 
WHERE SALARY BETWEEN 9000 AND 12000
/* E.	finds all employees who work in the department id 8 or 9.*/
SELECT * FROM EMPLOYEES
WHERE department_id IN (8,9)
/*F.	finds all employees whose first name starts with the string jo */
SELECT * FROM EMPLOYEES
WHERE first_name LIKE '%JO%'
/* G.	finds all employees with the first names whose the second character is h */
SELECT * FROM employees
WHERE first_name LIKE '_H%'
/* H.	finds all employees whose salaries are greater than all salaries of employees in the department 8: */


/*Part 2:-
A.	finds all employees whose salaries are greater than the average salary of every department: */
SELECT * FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
GROUP BY department_id


/*B.	finds all employees who have dependents: */
SELECT * FROM EMPLOYEES E
INNER JOIN DEPENDENTS D ON
E.EMPLOYEE_ID = D.EMPLOYEE_ID

/*C.	to find all employees whose salaries are between 2,500 and 2,900: */
SELECT * FROM EMPLOYEES WHERE salary BETWEEN 2500 AND 2900

/*D.	to find all employees whose salaries are not in the range of 2,500 and 2,900: */
SELECT * FROM EMPLOYEES WHERE SALARY NOT BETWEEN 2500 AND 2900

/*E.	to find all employees who joined the company between January 1, 1999, and December 31, 2000: */
SELECT * FROM EMPLOYEES WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31'

/*F.	to find employees who have not joined the company from January 1, 1989 to December 31, 1999: */
SELECT * FROM EMPLOYEES WHERE HIRE_DATE NOT BETWEEN '1989-01-01' AND '1999-12-31'

/*G.	to find employees who joined the company between 1990 and 1993: */
SELECT * FROM EMPLOYEES WHERE YEAR(HIRE_DATE) BETWEEN 1990 AND 1993 

/*PART-3 
A.	to find all employees whose first names start with Da */
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'DA%'
/*B.	to find all employees whose first names end with er */
SELECT * FROM EMPLOYEES WHERE first_name LIKE'%ER'
/*C.	to find employees whose last names contain the word an: */
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '%AN%'
/*D.	retrieves employees whose first names start with Jo and are followed by at most 2 characters */
SELECT * FROM employees WHERE first_name LIKE 'JO_' or first_name like 'jo__' or first_name like 'jo'
/*E.	to find employees whose first names start with any number of characters and are followed by at most one character: */
SELECT * FROM EMPLOYEES WHERE first_name LIKE'%_'
/* F.	to find all employees whose first names start with the letter S but not start with Sh: */
SELECT * FROM EMPLOYEES WHERE first_name like 's%' and first_name not like 'sh%'

/*Part 4:-
A.	retrieves all employees who work in the department id 5. */
SELECT * FROM employees WHERE department_id = 5
/*B.	To get the employees who work in the department id 5 and with a salary not greater than 5000. */
SELECT * FROM EMPLOYEES WHERE 
DEPARTMENT_ID = 5 AND SALARY <= 5000
/*C.	statement gets all the employees who are not working in the departments 1, 2, or 3. */
SELECT * FROM employees WHERE DEPARTMENT_ID NOT IN (1,2,3)
/*D.	retrieves all the employees whose first names do not start with the letter D. */
SELECT * FROM EMPLOYEES WHERE first_name NOT LIKE 'D%'
/* E.	to get employees whose salaries are not between 5,000 and 1,000. */
SELECT * FROM EMPLOYEES WHERE SALARY NOT BETWEEN 1000 AND 5000

/*Part 5:-
A.	Write a query to get the employees who do not have any dependents by above image */
SELECT E.* FROM EMPLOYEES E
LEFT JOIN dependents D
ON E.employee_id = d.employee_id
where d.employee_id IS null
/*B.	To find all employees who do not have the phone numbers */
SELECT * FROM EMPLOYEES WHERE phone_number IS NULL
/*C.	To find all employees who have phone numbers */
SELECT * FROM EMPLOYEES WHERE phone_number IS NOT NULL
/*TASK 3:  joins
A.	To get the information of the department id 1,2, and 3 */
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (1,2,3)
/* B.	To get the information of employees who work in the department id 1, 2 and 3 */
SELECT * FROM EMPLOYEES WHERE department_id IN (1,2,3)
/* Write a Query to get the first name, last name, and department name of employees who work in department id 1, 2, and 3. */
SELECT E.FIRST_NAME ,E.LAST_NAME,D.DEPARTMENT_NAME
FROM EMPLOYEES E 
INNER JOIN DEPARTMENTS D ON
E.department_id = D.department_id
/* Write a Query to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3. */
SELECT E.FIRST_NAME ,E.LAST_NAME,J.JOB_TITLE,D.DEPARTMENT_NAME
FROM EMPLOYEES E
INNER JOIN JOBS J ON E.job_id = J.job_id
INNER JOIN departments D ON E.department_id = D.department_id
WHERE D.department_id IN (1,2,3)

/*PART-2
A.	To query the country names of US, UK, and China */
SELECT COUNTRY_NAME,country_id FROM countries 
WHERE COUNTRY_ID IN ('US','UK','CHINA')
/*B.	query retrieves the locations located in the US, UK and China: */
SELECT l.* 
FROM locations l
INNER JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name IN ('US', 'UK', 'China');
/*C.	To join the countries table with the locations table */
SELECT c.*,l.* FROM countries C
LEFT JOIN LOCATIONS L
ON C.country_id = L.country_id
/* D.	to find the country that does not have any locations in the locations table */
SELECT * FROM COUNTRIES C
LEFT JOIN LOCATIONS L ON
C.country_id = L.country_id
WHERE L.country_id IS NULL
/* E. Write a query to join 3 tables: regions, countries, and locations */
SELECT * FROM COUNTRIES C
LEFT JOIN LOCATIONS L ON C.country_id = L.country_id
LEFT JOIN regions R ON C.region_id = R.region_id

SELECT * FROM employees
/*The manager_id column specifies the manager of an employee. Write a query statement to 
joins the employees table to itself to query the information of who reports to whom. */

SELECT E1.EMPLOYEE_ID,E1.MANAGER_ID,E2.FIRST_NAME + ' ' + E2.LAST_NAME AS MANAGER_NAME
FROM EMPLOYEES E1
JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID

/* Now write a Query To include the president in the result set:- */
SELECT E1.EMPLOYEE_ID,E1.MANAGER_ID,E2.FIRST_NAME + ' ' + E2.LAST_NAME AS MANAGER_NAME
FROM EMPLOYEES E1
left JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID


CREATE TABLE fruits (
	fruit_id INT PRIMARY KEY,
	fruit_name VARCHAR (255) NOT NULL,
	basket_id INTEGER
);
CREATE TABLE baskets (
	basket_id INT PRIMARY KEY,
	basket_name VARCHAR (255) NOT NULL
);

INSERT INTO baskets (basket_id, basket_name) 
VALUES (1,'A'),(2,'B'),(3,'C')
INSERT INTO fruits (fruit_id,fruit_name,basket_id)
VALUES(1, 'Apple', 1),(2,'ORANGE',1),(3,'BANANA',2),(4, 'Strawberry', NULL);


 /* A.	Write a query to returns each fruit that is in a basket and each basket that has a fruit, 
 but also returns each fruit that is not in any basket and each basket that does not have any fruit. */

 SELECT F.*,B.* 
 FROM FRUITS F
 FULL OUTER JOIN baskets B ON
 F.BASKET_ID = B.basket_id

/* B.	Write a query to find the empty basket, which does not store any fruit */
SELECT B.BASKET_ID,B.BASKET_NAME FROM BASKETS B
LEFT JOIN FRUITS F
ON B.BASKET_ID = F.BASKET_ID
WHERE f.fruit_id is NULL

/*C.	Write a query which fruit is not in any basket */
SELECT F.FRUIT_ID,F.FRUIT_NAME FROM fruits F
LEFT JOIN BASKETS B
ON F.basket_id = B.basket_id
WHERE B.basket_id IS NULL
CREATE TABLE sales_organization (
	sales_org_id INT PRIMARY KEY,
	sales_org VARCHAR (255)
);
 CREATE TABLE sales_channel (
	channel_id INT PRIMARY KEY,
	channel VARCHAR (255)
);
INSERT INTO sales_organization (sales_org_id, sales_org) VALUES (1, 'Domestic'),(2, 'Export');
INSERT INTO sales_channel (channel_id, channel) VALUES (1, 'Wholesale'), (2, 'Retail'), (3, 'eCommerce'), (4, 'TV Shopping');
/* Write a Query To find the all possible sales channels that a sales organization */

SELECT SC.*,SO.*
from sales_organiZation	SO
CROSS JOIN sales_channel SC

/*TASK 4: SQL GROUP BY clause
A.	to group the values in department_id column of the employees table: */



/*B.	to count the number of employees by department: OR C.	returns the number of employees by department */
SELECT COUNT(EMPLOYEE_ID) AS [TOTAL EMPLOYEES IN DEPARTMENT],DEPARTMENT_ID FROM employees
GROUP BY department_id
/*D.	to sort the departments by headcount: */
SELECT COUNT(EMPLOYEE_ID) AS [TOTAL EMPLOYEES IN DEPARTMENT],DEPARTMENT_ID FROM employees
GROUP BY department_id
ORDER BY COUNT(EMPLOYEE_ID) DESC

/*E.	to find departments with headcounts are greater than 5: */
SELECT COUNT(EMPLOYEE_ID) AS [TOTAL EMPLOYEES IN DEPARTMENT],DEPARTMENT_ID FROM employees
GROUP BY department_id
HAVING COUNT(EMPLOYEE_ID) > 5
/* F.	returns the minimum, maximum and average salary of employees in each department. */
SELECT MIN(SALARY) AS [MINIMUM SALARY],MAX(SALARY) AS [MAXIMUM SALARY], AVG(SALARY) AS [AVERAGE SALARY] , DEPARTMENT_ID FROM EMPLOYEES
GROUP BY department_id
/* G.	To get the total salary per department */
SELECT SUM(SALARY) AS [TOTAL SALARY] , DEPARTMENT_ID FROM EMPLOYEES
GROUP BY department_id
/*H.	groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups */


/*A.	To get the managers and their direct reports, and to group employees by the managers and to count the direct reports. */
SELECT  COUNT(EMPLOYEE_ID) AS [REPORT COUNT], MANAGER_ID from employees
GROUP BY MANAGER_ID
/*B.	To find the managers who have at least five direct reports */
SELECT  COUNT(EMPLOYEE_ID) AS [REPORT COUNT], MANAGER_ID from employees
GROUP BY MANAGER_ID
HAVING COUNT(EMPLOYEE_ID)  >= 5
/*C.	calculates the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000. */
SELECT SUM(SALARY) AS [TOTAL SALARY], DEPARTMENT_ID FROM employees
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) BETWEEN 20000 AND 30000
/* D.	To find the department that has employees with the lowest salary greater than 10000 */
SELECT department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 10000;
/* E.	To find the departments that have the average salaries of employees between 5000 and 7000 */
SELECT AVG(SALARY) AS [AVERAGE SALARY],DEPARTMENT_ID FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) BETWEEN 5000 AND 7000

/* TASK 5 (Other Queries) */
/* Write a Query to combine the first name and last name of employees and dependents */
SELECT * FROM employees
SELECT * FROM dependents

SELECT FIRST_NAME + ' ' + LAST_NAME FROM EMPLOYEES
UNION ALL
SELECT FIRST_NAME + ' ' + LAST_NAME FROM dependents

/* Write a Query to update Sarah’s last name from Bell to Lopez */
UPDATE EMPLOYEES
SET last_name = 'LOPEZ'
WHERE first_name = 'SARAH' AND LAST_NAME = 'BELL'