CREATE DATABASE Gagnesh
USE Gagnesh

create table TBL_Author( 
       Author_id Int primary key,  
       Author_name varchar(max),      
	   country varchar(max) 
)

create table TBL_Books( 
		Book_id Int primary key,  
	 	Book_title varchar(max),
	 	AuthorId Int  
	 	Foreign key (AuthorId) references TBL_Author(Author_id)
) 

INSERT INTO TBL_Author (Author_id, Author_name, country) VALUES 
(1, 'George Orwell', 'United Kingdom'), 
(2, 'Haruki Murakami', 'Japan'), 
(3, 'Chinua Achebe', 'Nigeria'), 
(4, 'J.K. Rowling', 'United Kingdom'), 
(5, 'Gabriel García Márquez', 'Colombia'), 
(6, 'Mark Twain', 'United States'); 

INSERT INTO TBL_Books (Book_id, Book_title, AuthorId) VALUES 
(101, '1984', 1), 
(102, 'Kafka on the Shore', 2), (103, 'Things Fall Apart', 3), 
(104, 'Harry Potter and the Sorcerer Stone', 4), 
(105, 'One Hundred Years of Solitude', 5), 
(106, 'Adventures of Huckleberry Finn', 6); 

SELECT b.Book_title AS 'Book Name', a.Author_name AS [Author Name], a.country AS[Country]	 
FROM TBL_Books AS b	 	
inner join 
TBL_Author AS a  
ON b.AuthorId = a.Author_id;	 

--MEDIUM PROBLEM

CREATE TABLE Department ( 
    DeptID INT PRIMARY KEY, 
    DeptName VARCHAR(100) 
); 
 
CREATE TABLE Course ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(100), 
    DeptID INT, 
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID) 
); 

INSERT INTO Department VALUES 
(1, 'Computer Science'), 
(2, 'Physics'), 
(3, 'Mathematics'), 
(4, 'Chemistry'), 
(5, 'Biology'); 

INSERT INTO Course VALUES 
(101, 'Data Structures', 1), 
(102, 'Operating Systems', 1), 
(103, 'Quantum Mechanics', 2), 
(104, 'Electromagnetism', 2), 
(105, 'Linear Algebra', 3), 
(106, 'Calculus', 3), 
(107, 'Organic Chemistry', 4), 
(108, 'Physical Chemistry', 4), 
(109, 'Genetics', 5), 
(110, 'Computer Networks', 1),	 
(111, 'Linux/Unix systems', 1),	 
(112, 'Matrix', 3),	 	
(113, 'Space Physics', 2);	 	


SELECT D.DeptName, 
(SELECT COUNT(*) FROM Course C WHERE C.DeptID = D.DeptID) AS CourseCount
FROM Department D;


SELECT D.DeptName
FROM Department D WHERE (SELECT COUNT(*) FROM Course C WHERE C.DeptID = D.DeptID) >= 2;


create login test_login with password = 'Gagnesh@123';
create user test_user for login test_login;
execute as user = 'test_user';	  
grant select on Course to test_user;	 

