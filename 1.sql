CREATE DATABASE School;

USE School;

CREATE TABLE Student(
	stid INT primary key,
	sname VARCHAR(20),
	dept VARCHAR(20),
	mark1 INT,
	mark2 INT,
	cgpa FLOAT AS ((3*mark1+4*mark2)/70) );

CREATE TABLE hostel_details (
    hid INT PRIMARY KEY,
    sname VARCHAR(20),
    block INT,
    Roomno INT );


INSERT INTO Student (stid, sname, dept, mark1, mark2) VALUES
	(1, 'Alice', 'CS', 85, 90),
	(2, 'Bob', 'EE', 78, 82),
	(3, 'Charlie', 'ME', 88, 76),
	(4, 'David', 'Math', 92, 89),
	(5, 'Eve', 'Phy', 75, 80);

INSERT INTO hostel_details (hid, sname, block, Roomno) VALUES 
	(1, 'Alice', 1, 101),
	(2, 'Bob', 1, 102),
	(3, 'Charlie', 2, 201),
	(4, 'David', 2, 202),
	(5, 'Eve', 1, 108);

SELECT * FROM Student;

SELECT * FROM hostel_details;

ALTER TABLE hostel_details RENAME TO Hostel;

UPDATE Student SET mark1 = 80 WHERE stid = 3;

SELECT sname,cgpa FROM Student WHERE cgpa > 8;

SELECT sname,Roomno FROM Hostel WHERE block = 1;

SELECT sname,dept FROM Student WHERE dept = 'CS';

SELECT sname,Roomno FROM Hostel WHERE Roomno = 108;
