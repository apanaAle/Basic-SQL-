create table users(ID int IDENTITY(1,1) primary key,
Name VARCHAR(50) NOT NULL,
Email VARCHAR(50) UNIQUE NOT NULL,
Gender VARCHAR(10) CHECK ( Gender IN ('Male', 'Female', 'Other')),
DOB DATE);

SELECT *FROM USERS;

ALTER TABLE users ADD Age INT;
--it adds the extra coloumn to the table 

SELECT * FROM users;

ALTER TABLE Users 
DROP COLUMN Age;
--it removes the column name age from the table.

SELECT * FROM users;

ALTER TABLE Users 
ALTER COLUMN ID INT;
--it changes the data type of the id

SELECT * FROM users;


INSERT INTO users( Name, Email, Gender, DOB) VALUES 
( 'Hari', 'hari11@gmail.com', 'Male', '2001-1-5');

  INSERT INTO users( Name, Email, Gender, DOB) VALUES 
( 'Hari2', 'hari12@gmail.com', 'Female', '2002-1-5'),  
( 'Hari3', 'hari13@gmail.com', 'Male', '2003-1-5'),  
( 'Hari4', 'hari14@gmail.com', 'Female', '2002-1-5'),  
( 'Hari5', 'hari15@gmail.com', 'Male', '2004-1-5');  

 
  select * from users where DOB ='2001-1-5';

  select * from users where  DOB between  '2001-1-5'and '2002-1-5';

  select * from users where gender in ('Male', 'Female'); -- selects the all the data that lies under male and female.

  ALTER TABLE Users
  ADD Salary Float;

 --Adding values in the salary column:
UPDATE Users 
SET Salary = 40000
WHERE Name = 'Hari';

UPDATE Users 
SET Salary = 50000
WHERE ID = 6;

UPDATE Users 
SET Salary = 55000
WHERE ID = 7;

UPDATE Users 
SET Salary = 45000
WHERE ID = 8;

UPDATE Users 
SET Salary = 30000
WHERE ID = 9;


SELECT * FROM USERS WHERE Gender = 'female' and Salary > 40000;

SELECT * FROM USERS WHERE Gender = 'female' or Salary > 40000 order by DOB DESC;

--Updating the data:

UPDATE users SET Name = 'Hari Ale' WHERE ID = 1;
SELECT * FROM users;

UPDATE Users SET Salary = Salary+10000 
WHERE salary < 50000;

DELETE FROM Users where salary is null;


--Changing the data type of column:
ALTER TABLE users 
alter column Name VARCHAR(50) NOT NULL;

INSERT INTO users( Name, Email, Gender, DOB, Salary) values ( 'sita','sita@gmail.com','Female','2010-1-9', 20000);
  
UPDATE USERS 
SET Name = 'Sita'
WHERE Salary= 20000;

--counting data :
SELECT COUNT(*) FROM users;

SELECT COUNT(*) FROM users WHERE Gender='Female';

Select * from users;


--use of AS:
SELECT MIN(Salary) AS min_salary, MAX(Salary) AS max_salary FROM Users;
 
 -- Use of SUM:
 SELECT SUM(Salary) AS total_salary From users;
 
 --Use of AVG 
 SELECT AVG(Salary) AS avg_salary FROM users;

SELECT Gender, 
AVG(Salary) FROM users
GROUP  BY Gender;

SELECT Gender, 
SUM(Salary) FROM users
GROUP  BY Gender;

--getting days difference:
SELECT Name,
       DATEDIFF(DAY, DOB, GETDATE()) AS days
FROM users;

--Transcation and autocommit 

BEGIN TRANSACTION;

INSERT INTO users (Name, Email, DOB)
VALUES ('rita', 'rita@gmail.com', '2002-02-05');

-- Changes are NOT saved yet
COMMIT;  -- Now changes are saved
 
 select * from users;
  
  update users set gender = 'female', salary= 40000
  where id =16;
  

-- ROLLBACK:
BEGIN TRANSACTION;

DELETE FROM Users 
WHERE Name = 'Rita';

rollback;

--select count(*) from users;

--select gender, sum(salary) from users group by gender;


select gender,
count(*) as total 
from users 
group by gender;


--select gender, sum(salary) as totalsalary from users group by gender;

BEGIN transaction;

update users set name = 'Apana' where salary = 50000;

select * from users;

rollback;

Update users set name = 'Rita' where id = 16;

--concept of foreign key 

create table address ( user_id int primary key,
city varchar(50), 
FOREIGN KEY(user_id) REFERENCES users(id));

INSERT INTO Address(user_id, city) VALUES
(1, 'Ktm'),
(6, 'Bhaktapur'), 
(7, 'Lalitpur'), (8, 'Chitwon'), (9, 'Birgunj'), (12, 'Bardiya'),(16, 'Ktm') ;


select * from users;
select * from address;

--concept of join 
    --INNER JOIN:

select users.name , address.city  from users INNER JOIN address 
ON users.id = address.user_id;

select users.name ,  address.city  from users LEFT JOIN address 
ON users.id = address.user_id;


--UNION:(the number of columns and their data type must match in all select statements)
select name from users
UNION 
SELECT city from address;

SELECT name from users 
UNION ALL 
SELECT city from address 
ORDER BY name;

--VIEW(virtual table)

CREATE VIEW rich_user AS
SELECT * from users  WHERE Salary >40000;

select * from rich_user;


--update  users set name = 'martin' where id = 1; // this shows that when the original tale is update the data in the view also get updated.
-- before martin the name of id = 1 is hari:

drop view rich_user;

--INDEXES ( in sql uses EXEC for indexes that speed up the data retrieval)

EXEC sp_helpindex 'users'; 


--SUBQUERY(QUERY within query)

SELECT AVG(salary) FROM users;
select * from users WHERE Salary < (SELECT AVG(salary) FROM users);

 
 --GRPUP BY :
 SELECT Gender, AVG(Salary) AS avg_salary from users GROUP BY Gender;

 SELECT Gender, AVG(Salary) AS avg_salary, COUNT(*) as Total_gender
 FROM users GROUP By gender;


 --HAVING 
 SELECT Gender, SUM(Salary) as Total_salary
 FROM users
 GROUP BY Gender 
 HAVING SUM(Salary) > 10000;


