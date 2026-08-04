-- 1. List all books with their authors.
SELECT B.TITLE, A.AUTHORNAME 
FROM BOOK B 
INNER JOIN AUTHOR A ON B.AUTHORID = A.AUTHORID;

-- 2. List all books with their publishers.
SELECT B.TITLE, P.PUBLISHERNAME 
FROM BOOK B 
INNER JOIN PUBLISHER P ON B.PUBLISHERID = P.PUBLISHERID;

-- 3. List all books with their authors and publishers.
SELECT B.TITLE, A.AUTHORNAME, P.PUBLISHERNAME 
FROM BOOK B 
INNER JOIN AUTHOR A ON B.AUTHORID = A.AUTHORID 
INNER JOIN PUBLISHER P ON B.PUBLISHERID = P.PUBLISHERID;

-- 4. List all books published after 2010 with their authors and publisher and price.
SELECT B.TITLE, A.AUTHORNAME, P.PUBLISHERNAME, B.PRICE 
FROM BOOK B 
INNER JOIN AUTHOR A ON B.AUTHORID = A.AUTHORID 
INNER JOIN PUBLISHER P ON B.PUBLISHERID = P.PUBLISHERID 
WHERE B.PUBLICATIONYEAR > 2010;

-- 5. List all authors and the number of books they have written.
SELECT A.AUTHORNAME, COUNT(B.BOOKID) AS NO_OF_BOOKS 
FROM AUTHOR A 
LEFT JOIN BOOK B ON A.AUTHORID = B.AUTHORID 
GROUP BY A.AUTHORNAME;

-- 6. List all publishers and the total price of books they have published.
SELECT P.PUBLISHERNAME, SUM(B.PRICE) AS TOTAL_PRICE 
FROM PUBLISHER P 
INNER JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID 
GROUP BY P.PUBLISHERNAME;

-- 7. List authors who have not written any books.
SELECT A.AUTHORNAME 
FROM AUTHOR A 
LEFT JOIN BOOK B ON A.AUTHORID = B.AUTHORID 
WHERE B.BOOKID IS NULL;

-- 8. Display the total number of books written by each author along with the average price of their books.
SELECT A.AUTHORNAME, COUNT(B.BOOKID) AS TOTAL_BOOKS, AVG(B.PRICE) AS AVG_PRICE 
FROM AUTHOR A 
INNER JOIN BOOK B ON A.AUTHORID = B.AUTHORID 
GROUP BY A.AUTHORNAME;

-- 9. List each publisher along with the total number of books they have published, sorted from highest to lowest.
SELECT P.PUBLISHERNAME, COUNT(B.BOOKID) AS TOTAL_BOOKS 
FROM PUBLISHER P 
LEFT JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID 
GROUP BY P.PUBLISHERNAME 
ORDER BY TOTAL_BOOKS DESC;

-- 10. Display number of books published each year.
SELECT PUBLICATIONYEAR, COUNT(BOOKID) AS NO_OF_BOOKS 
FROM BOOK 
GROUP BY PUBLICATIONYEAR;

-- 11. List the publishers whose total book prices exceed 500, ordered by the total price.
SELECT P.PUBLISHERNAME, SUM(B.PRICE) AS TOTAL_PRICE 
FROM PUBLISHER P 
INNER JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID 
GROUP BY P.PUBLISHERNAME 
HAVING SUM(B.PRICE) > 500 
ORDER BY TOTAL_PRICE DESC;

-- 12. List most expensive book for each author, sort it with the highest price.
SELECT A.AUTHORNAME, MAX(B.PRICE) AS MAX_PRICE 
FROM AUTHOR A 
INNER JOIN BOOK B ON A.AUTHORID = B.AUTHORID 
GROUP BY A.AUTHORNAME 
ORDER BY MAX_PRICE DESC;

-- 13. Display publisher name and difference between maximum and minimum book price.
SELECT P.PUBLISHERNAME, (MAX(B.PRICE) - MIN(B.PRICE)) AS PRICE_DIFF 
FROM PUBLISHER P 
INNER JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID 
GROUP BY P.PUBLISHERNAME;

-- 14. List publisher name and total price of books published each year.
SELECT P.PUBLISHERNAME, B.PUBLICATIONYEAR, SUM(B.PRICE) AS TOTAL_PRICE 
FROM PUBLISHER P 
INNER JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID 
GROUP BY P.PUBLISHERNAME, B.PUBLICATIONYEAR;

-- 15. Display author name and total price of books sorted by highest total price.
SELECT A.AUTHORNAME, SUM(B.PRICE) AS TOTAL_PRICE 
FROM AUTHOR A 
INNER JOIN BOOK B ON A.AUTHORID = B.AUTHORID 
GROUP BY A.AUTHORNAME 
ORDER BY TOTAL_PRICE DESC;

--insert and create the table EMPLOYEE_MASTER
CREATE TABLE EMPLOYEE_MASTER (
       EmployeeNo VARCHAR(50),
       Name VARCHAR(50),
       ManagerNo VARCHAR(50),
);

DROP TABLE EMPLOYEE_MASTER

INSERT INTO EMPLOYEE_MASTER (EmployeeNo,Name,ManagerNo) VALUES
('E01','Tarun',NULL),
('E02','Rohan','E02'),
('E03','Priya','E01'),
('E04','Milan','E03'),
('E05','Jay','E01'),
('E06','Anjana','E04');

-- 16. Retrieve the names of employee along with their manager's name from the Employee table.
SELECT E.Name AS EmployeeName, M.Name AS ManagerName 
FROM EMPLOYEE_MASTER E 
LEFT JOIN EMPLOYEE_MASTER M ON E.ManagerNo = M.EmployeeNo;

-- 17. Display employees who are managers.
SELECT DISTINCT M.Name AS ManagerName 
FROM EMPLOYEE_MASTER E 
INNER JOIN EMPLOYEE_MASTER M ON E.ManagerNo = M.EmployeeNo;

-- 18. Display number of employees working under each manager.
SELECT M.Name AS ManagerName, COUNT(E.EmployeeNo) AS NoOfEmployees 
FROM EMPLOYEE_MASTER E 
INNER JOIN EMPLOYEE_MASTER M ON E.ManagerNo = M.EmployeeNo 
GROUP BY M.Name;

-- 19. Display the employee's name along with their manager's name and senior manager name.
SELECT 
    E.Name AS EmployeeName, 
    M.Name AS ManagerName, 
    SM.Name AS SeniorManagerName 
FROM EMPLOYEE_MASTER E 
LEFT JOIN EMPLOYEE_MASTER M ON E.ManagerNo = M.EmployeeNo 
LEFT JOIN EMPLOYEE_MASTER SM ON M.ManagerNo = SM.EmployeeNo;

-- 20. Display managers and count of employees under them in descending order.
SELECT M.Name AS ManagerName, COUNT(E.EmployeeNo) AS NoOfEmployees 
FROM EMPLOYEE_MASTER E 
INNER JOIN EMPLOYEE_MASTER M ON E.ManagerNo = M.EmployeeNo 
GROUP BY M.Name 
ORDER BY NoOfEmployees DESC;