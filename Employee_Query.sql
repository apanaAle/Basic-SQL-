SELECT DB_NAME() AS CurrentDatabase;  --shows the current database that is in use 

CREATE TABLE Project(Proj_id INT PRIMARY KEY, Proj_Name VARCHAR(50))

INSERT INTO Project( Proj_id, Proj_Name) VALUES
(1, 'Website Development'),
(2, 'Mobile App'),
(3, 'Inventory System'),
(4, 'Online Learning Platform'),
(5, 'Hospital Management System');

SELECT *  FROM Project;

CREATE TABLE Employee( Emp_id INT PRIMARY KEY, Emp_Name VARCHAR(50), Dept_id INT, Mgr_id INT, Salary INT);

INSERT INTO Employee(Emp_id , Emp_Name,  Dept_id, Mgr_id, Salary) VALUES
(1, 'Ram',   10, NULL, 50000),
(2, 'Sita',  10, 1,    40000),
(3, 'Hari',  20, 1,    45000),
(4, 'Gita',  20, 3,    38000),
(5, 'Nabin', 30, 3,    42000);


SELECT *  FROM Employee;

CREATE TABLE Manager ( Mgr_Id INT PRIMARY KEY, Mgr_Name VARCHAR(50));

INSERT INTO Manager(Mgr_Id, Mgr_Name) VALUES 
(1, 'Anil'),
(2, 'Sunita'),
(3, 'Ramesh'),
(4, 'Kavita'),
(5, 'Anish');

SELECT *  FROM Manager;

CREATE TABLE Employee_Project (Emp_id INT, Proj_id INT,
 PRIMARY KEY (Emp_id, Proj_Id),
 FOREIGN KEY (Emp_id) REFERENCES Employee( Emp_id),
 FOREIGN KEY(Proj_iD) REFERENCES Project(Proj_id) );

 INSERT INTO Employee_Project (Emp_id, Proj_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 2);

SELECT * FROM Employee_Project;

--it shows the table inside the database:
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

--Q1. Display employee names along with respective manager name:

		SELECT Employee.Emp_Name, Manager.Mgr_Name
		FROM Employee INNER JOIN Manager 
		ON Employee.Mgr_id = Manager.Mgr_id;


		SELECT * FROM Employee;
		SELECT * FROM Manager;

--Q2. List the Employee name who have assigned at least one project.
		SELECT DISTINCT e.Emp_name
		FROM Employee e INNER JOIN Employee_Project
		ON e.Emp_id = Employee_Project.Emp_id;


		SELECT * FROM Employee_Project;
		SELECT * FROM Employee;

--Q3. Display employee name, dept id, manager name :

		SELECT e.Emp_Name, e.Dept_id, m.Mgr_name
		FROM Employee e INNER JOIN Manager m 
		ON e.Mgr_id = m.Mgr_id;

--Q4. Find the employee who work more than one projects:
	
		SELECT e.Emp_Name
		FROM Employee e INNER JOIN Employee_Project ep
		ON e.emp_id = ep.Emp_id 
		GROUP BY e.Emp_Name 
		HAVING COUNT (ep.proj_id) >1 ;

--Q5. Find the employees who work on the less than or equals to two projetcs:

		SELECT e.Emp_Name
		FROM Employee e INNER JOIN Employee_Project ep 
		ON e.emp_id = ep.Emp_id 
		GROUP BY e.emp_name
		HAVING COUNT (ep.proj_id) >=2;


--Q6. Count the number of employees assigned to each project:
		
		SELECT p.Proj_name, COUNT(ep.emp_id) as total_employee
		FROM Project p LEFT JOIN Employee_Project ep
		ON p.Proj_id = ep.Proj_id
		GROUP BY p.Proj_name;


		select * from Project;
		select * from Employee_Project;
		select * from Employee;

--Q7. list the employee assigned to more than one project:
		
		SELECT e.emp_name, count(ep.proj_id) as total_proj
		FROM Employee e inner join Employee_Project ep
		ON e.emp_id = ep.Emp_id 
		group by e.emp_name
		having count(ep.proj_id) > = 2;
		
--Q8. Find the highest salary in each department:
	
		select dept_id , max(salary) as high_salary
		from employee 
		group by dept_id;

--Q9. list the project that no employee have assigned.
		
		select p.proj_name 
		from project p left join Employee_Project ep 
		on p.Proj_id = ep.Proj_id
		WHERE ep.Emp_id = null;

--Q10. Show the average salary of the employees under each manager:

		select  mgr_id, avg(salary) as avg_salary 
		from employee
		group by mgr_id;

		select * from employee;

--	Q11. List employees who are assigned to all project:

		Select ep.emp_id 
		from Employee_Project ep inner join project p 
		on ep.Proj_id = p.Proj_id;

-- Q12. Find the employee who are not assigned to any project:
		SELECT e.Emp_name 
		FROM Employee e LEFT JOIN Employee_Project ep 
		On e.Emp_id = ep.Emp_id 
		WHERE e.Emp_id IS NULL;

--Q13. list managers who do not manage anyone:
			SELECT m.Emp_Name
			FROM Employee m
			WHERE NOT EXISTS (
			SELECT 1
			FROM Employee e
			WHERE e.Mgr_id = m.Emp_id);

--Q14. Show Employee Name, Project Name, and Manager Name together:
SELECT 
    e.Emp_Name  AS Employee_Name,
    p.Proj_Name AS Project_Name,
    m.Emp_Name  AS Manager_Name
FROM Employee e
JOIN Employee_Project ep
    ON e.Emp_id = ep.Emp_id
JOIN Project p
    ON ep.Proj_id = p.Proj_id
LEFT JOIN Employee m
    ON e.Mgr_id = m.Emp_id;





