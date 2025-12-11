Used Query:

1. `CREATE TABLE users(...)` – Create users table
2. `SELECT * FROM users` – View all users
3. `ALTER TABLE users ADD Age INT` – Add column
4. `ALTER TABLE users DROP COLUMN Age` – Drop column
5. `ALTER TABLE users ALTER COLUMN ID INT` – Change column type
6. `INSERT INTO users(...) VALUES(...)` – Insert single row
7. `INSERT INTO users(...) VALUES(...),(...),...` – Insert multiple rows
8. `SELECT * FROM users WHERE DOB='...'` – Filter by DOB
9. `SELECT * FROM users WHERE DOB BETWEEN ...` – DOB range filter
10. `SELECT * FROM users WHERE Gender IN (...)` – Filter by gender
11. `ALTER TABLE users ADD Salary Float` – Add salary column
12. `UPDATE users SET Salary=... WHERE Name=...` – Update salary
13. `UPDATE users SET Salary=... WHERE ID=...` – Update by ID
14. `SELECT * FROM users WHERE Gender='female' AND Salary>40000` – Filter female+salary
15. `SELECT * FROM users WHERE Gender='female' OR Salary>40000 ORDER BY DOB DESC` – OR filter + sort
16. `UPDATE users SET Name='...' WHERE ID=...` – Update name
17. `UPDATE users SET Salary=Salary+10000 WHERE Salary<50000` – Increment salary
18. `DELETE FROM users WHERE Salary IS NULL` – Delete null salary
19. `ALTER TABLE users ALTER COLUMN Name VARCHAR(50) NOT NULL` – Change Name type
20. `SELECT COUNT(*) FROM users` – Count all users
21. `SELECT COUNT(*) FROM users WHERE Gender='Female'` – Count female users
22. `SELECT MIN(Salary) AS min_salary, MAX(Salary) AS max_salary FROM users` – Min/max salary
23. `SELECT SUM(Salary) AS total_salary FROM users` – Sum salaries
24. `SELECT AVG(Salary) AS avg_salary FROM users` – Average salary
25. `SELECT Gender, AVG(Salary) FROM users GROUP BY Gender` – Avg salary by gender
26. `SELECT Gender, SUM(Salary) FROM users GROUP BY Gender` – Sum salary by gender
27. `SELECT Name, DATEDIFF(DAY, DOB, GETDATE()) AS days FROM users` – Days since DOB
28. `BEGIN TRANSACTION; ... COMMIT;` – Transaction commit
29. `BEGIN TRANSACTION; ... ROLLBACK;` – Transaction rollback
30. `SELECT Gender, COUNT(*) AS total FROM users GROUP BY Gender` – Count by gender
31. `CREATE TABLE address(...) FOREIGN KEY(user_id) REFERENCES users(id)` – Create FK table
32. `INSERT INTO Address(...) VALUES(...)` – Insert into address
33. `INNER JOIN` – Join users+address
34. `LEFT JOIN` – Left join users+address
35. `UNION` – Merge columns unique
36. `UNION ALL` – Merge all columns
37. `CREATE VIEW rich_user AS SELECT ...` – Create view
38. `DROP VIEW rich_user` – Drop view
39. `EXEC sp_helpindex 'users'` – Show table indexes
40. `SELECT * FROM users WHERE Salary<(SELECT AVG(Salary) FROM users)` – Subquery example
41. `GROUP BY Gender` – Group by gender
42. `HAVING SUM(Salary)>10000` – Filter group sum


Do you want me to do that?
