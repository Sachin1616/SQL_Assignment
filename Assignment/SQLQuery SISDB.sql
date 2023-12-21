---------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                     --TASK 1 Database Design (Normalization)
---------------------------------------------------------------------------------------------------------------------------------------------------------------


--Q1 CREATE A TABLE NAMED SISDB.
CREATE DATABASE SISDB;
USE SISDB;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                     --TASK 2 Data Definition Language (DDL)
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q2 DDL (CREATE TABLES)
CREATE TABLE Students
(
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(40),
date_of_birth DATE,
email VARCHAR(50),
phone_number VARCHAR(20)
);

CREATE TABLE Teacher
(
teacher_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50)
);

CREATE TABLE Courses
(
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
credits INT,
teacher_id INT
FOREIGN KEY(teacher_id) REFERENCES Teacher(teacher_id) ON DELETE CASCADE
);

CREATE TABLE Enrollments
(
enrollment_id INT PRIMARY KEY,
student_id INT FOREIGN KEY REFERENCES Students(student_id) ON DELETE CASCADE,
course_id INT FOREIGN KEY REFERENCES Courses(course_id)ON DELETE CASCADE,
enrollment_date DATE 
);

CREATE TABLE Payments
(
payment_id INT PRIMARY KEY,
student_id INT FOREIGN KEY REFERENCES Students(student_id) ON DELETE CASCADE,
amount FLOAT(2),
payment_date DATE
);
SELECT*FROM Students

---------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                      --TASK 3 Data Manipulation Language (DML)
---------------------------------------------------------------------------------------------------------------------------------------------------------------

---Q3.A DML INSERTING VALUES
INSERT INTO Students 
VALUES
(1,'Sachin', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890'),
(2,'Jeevan', 'Smith', '1998-03-22', 'alice.smith@example.com', '9876543210'),
(3,'Chaitanya', 'Johnson', '1997-05-10', 'bob.johnson@example.com', '5551234567'),
(4,'Krishna', 'lalth', '1996-11-03', 'emma.miller@example.com', '1237894560'),
(5,'Ram', 'A', '1999-09-25', 'james.davis@example.com', '7890123456'),
(6,'Seetha', 'V', '1994-04-18', 'olivia.white@example.com', '2345678901'),
(7,'Lakshman', 'P', '1993-12-08', 'ethan.taylor@example.com', '4567890123'),
(8,'Surekha', 'Balla', '1992-06-30', 'sophia.martin@example.com', '6789012345'),
(9,'Nora', 'Fatima', '1991-02-14', 'noah.clark@example.com', '8901234567'),
(10,'Divesh','Chinni','1993-11-05','divesh.chinni@gmail.com','1234567789');


INSERT INTO Courses
VALUES
(1,'Mathematics', 3, 1),
(2,'History', 4, 2),
(3,'Computer Science', 5, 3),
(4,'Physics', 4, 4),
(5,'Literature', 3, 5),
(6,'Chemistry', 4, 1),
(7,'Biology', 4, 2),
(8,'Art', 2, 3),
(9,'Music', 2, 4),
(10,'Physical Education', 2, 5);

INSERT INTO Enrollments
VALUES
(001,2, 10, '2023-01-02'),
(002,3, 9, '2023-01-03'),
(003,4, 8, '2023-01-04'),
(004,5, 7, '2023-01-05'),
(005,6, 6, '2023-01-06'),
(006,7, 5, '2023-01-07'),
(007,8, 4, '2023-01-08'),
(008,9, 3, '2023-01-09'),
(009,10, 2, '2023-01-10'),
(010,1, 1, '2023-01-01');



INSERT INTO Teacher
VALUES
(1,'Mr.', 'Anderson', 'mr.anderson@example.com'),
(2,'Mrs.', 'Johnson', 'mrs.johnson@example.com'),
(3,'Dr.', 'Smith', 'dr.smith@example.com'),
(4,'Ms.', 'Davis', 'ms.davis@example.com'),
(5,'Prof.', 'Miller', 'prof.miller@example.com'),
(6,'Miss', 'Taylor', 'miss.taylor@example.com'),
(7,'Mr.', 'White', 'mr.white@example.com'),
(8,'Mrs.', 'Clark', 'mrs.clark@example.com'),
(9,'Dr.', 'Martin', 'dr.martin@example.com'),
(10,'Ms.', 'Brown', 'ms.brown@example.com');

INSERT INTO Payments
VALUES
(011,1, 500.00, '2023-02-01'),
(012,2, 750.00, '2023-02-02'),
(013,3, 600.00, '2023-02-03'),
(014,4, 700.00, '2023-02-04'),
(015,5, 550.00, '2023-02-05'),
(016,6, 800.00, '2023-02-06'),
(017,7, 900.00, '2023-02-07'),
(018,8, 650.00, '2023-02-08'),
(019,9, 720.00, '2023-02-09'),
(110,10, 850.00, '2023-02-10');

--Q3.B.1
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

--Q3.B.2 (The **curdate** is a function used to get a current date of the enrollment date.)
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (011, 1, 6, CURDATE());

--Q3.B.3
UPDATE Teacher
SET email = 'new.email@example.com'
WHERE teacher_id = 3;

--Q3.B.4
DELETE FROM Enrollments
WHERE student_id = 2 AND course_id = 10;

--Q3.B.5
UPDATE Courses
SET teacher_id = 3
WHERE course_id = 3;

--Q3.B.6
SELECT * FROM Students WHERE student_id = 3; 
DELETE FROM Enrollments WHERE student_id = 3;
DELETE FROM Students WHERE student_id = 3;

--Q3.B.7
UPDATE Payments
SET amount = 750.00
WHERE payment_id = 014;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                           --TASK 4   JOINS
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q1
SELECT Students.student_id, Students.first_name, Students.last_name, SUM(Payments.amount) AS total_payments
FROM Students 
JOIN Payments ON Students.student_id = Payments.student_id
WHERE Students.student_id = 1
GROUP BY Students.student_id, Students.first_name, Students.last_name;

--Q2
SELECT Courses.course_id, Courses.course_name, COUNT(Enrollments.student_id) AS enrolled_students
FROM Courses 
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY Courses.course_id, Courses.course_name
ORDER BY Courses.course_id;

--Q3
SELECT Students.first_name, Students.last_name
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.student_id IS NULL;

--Q4
SELECT Students.first_name, Students.last_name, Courses.course_name
FROM Students 
JOIN Enrollments  ON Students.student_id = Enrollments.student_id
JOIN Courses  ON Enrollments.course_id = Courses.course_id;

--Q5
SELECT Teacher.first_name, Teacher.last_name, Courses.course_name
FROM Teacher 
INNER JOIN Courses ON Teacher.teacher_id = Courses.teacher_id;

--Q6
SELECT Students.first_name, Students.last_name, Enrollments.enrollment_date
FROM Students 
JOIN Enrollments  ON Students.student_id = Enrollments.student_id
JOIN Courses  ON Enrollments.course_id = Courses.course_id
WHERE Courses.course_name = 'Computer Science';

--Q7
SELECT Students.first_name, Students.last_name
FROM Students
LEFT JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.payment_id IS NULL;

--Q8
SELECT Courses.course_id, Courses.course_name
FROM Courses 
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
WHERE Enrollments.course_id IS NULL;

--Q9
SELECT student_id, COUNT(course_id) AS num_enrollments
FROM Enrollments
GROUP BY student_id
HAVING COUNT(course_id) > 1;

--Q10
SELECT Teacher.teacher_id,Teacher.first_name,Teacher.last_name
FROM Teacher 
LEFT JOIN Courses ON Teacher.teacher_id = Courses.teacher_id
WHERE Courses.teacher_id IS NULL;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
														--TASK 5 AGGREGATE FUNCTIONS AND SUBQUERIES 
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q1
SELECT  Courses.course_name,
    (
        SELECT AVG(enrollment_count) 
        FROM (
            SELECT COUNT(*) AS enrollment_count
            FROM Enrollments 
            WHERE Enrollments.course_id = Courses.course_id
            GROUP BY Enrollments.course_id
        ) AS subquery
    ) AS avg_students_enrolled
FROM Courses ;

--Q2
SELECT Students.student_id, Students.first_name, Students.last_name, Payments.amount
FROM Students
JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.amount = (
    SELECT MAX(amount)
    FROM Payments);

--Q3
SELECT  course_name, COUNT(E.enrollment_id) FROM Courses AS C
JOIN Enrollments AS E ON C.course_id = E.course_id
GROUP BY course_name;

--Q4
SELECT Teacher.teacher_id, Teacher.first_name, Teacher.last_name, SUM(Payments.Amount) AS TotalPayments
FROM Teacher 
JOIN Courses ON Teacher.teacher_id = Courses.teacher_id
JOIN Enrollments ON Courses.course_id = Enrollments.course_id
JOIN Payments  ON Enrollments.student_id = Payments.student_id
GROUP BY Teacher.teacher_id, Teacher.first_name, Teacher.last_name;

--Q5
SELECT student_id, first_name, last_name FROM Students
WHERE (
        SELECT COUNT(DISTINCT course_id) FROM Enrollments
        ) = (
        SELECT  COUNT(DISTINCT course_id) FROM Enrollments e
        WHERE Students.student_id = e.student_id
);

--Q6
SELECT Teacher_id, first_name, last_name FROM Teacher
WHERE teacher_id NOT IN
(
	SELECT Teacher.teacher_id FROM Teacher 
	JOIN Courses ON Teacher.teacher_id  = Courses.teacher_id 
);

--Q7
SELECT StudentAges.student_id, AVG(StudentAge) AS AverageAge 
FROM (
	SELECT student_id, DATEDIFF(YEAR, date_of_birth, GETDATE()) AS StudentAge FROM Students
) As StudentAges
GROUP BY StudentAges.student_id;

--Q8
SELECT course_id, course_name FROM Courses
WHERE course_id NOT IN(
	SELECT Courses.course_id FROM Courses 
	JOIN Enrollments ON Courses.course_id = Enrollments.course_id
);

--Q9
SELECT Students.first_name, Students.last_name, SUM(Amount) AS TotalPayments FROM Students 
JOIN Enrollments  ON Students.student_id = Enrollments.student_id
JOIN Courses  ON Enrollments.course_id = Courses.course_id
JOIN Payments  ON Enrollments.student_id = Payments.student_id
GROUP BY Students.first_name, Students.last_name;

--Q10
SELECT Students.first_name, Students.last_name FROM Students 
WHERE student_id IN (
	SELECT student_id From Payments
	GROUP BY student_id
	HAVING COUNT(*)>1
);

--Q11
SELECT Students.first_name, Students.last_name, SUM(Amount) AS TotalPayments FROM Students 
JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.first_name, Students.last_name;

--Q12
SELECT course_name, COUNT(enrollment_id) FROM Courses 
JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY course_name;

--Q13
SELECT  Students.first_name, Students.last_name, AVG(Amount) From Students
JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.first_name, Students.last_name;










