--1. Write a query to display the current date & time. Label the column Today_Date. 
SELECT GETDATE() AS TODAY_DATE

--2. Write a query to find new date after 365 day with reference to today. 
SELECT DATEADD(DAY,365,GETDATE()) AS FUTURE_DATE

--3. Display the current date in a format that appears as may 5 1994 12:00AM.
SELECT CONVERT(VARCHAR,GETDATE(),100) AS FORMATTED_DATE

--4. Display the current date in a format that appears as 03 Jan 1995.
SELECT FORMAT(GETDATE(),'dd MMM yyyy') AS FORMATTED_DATE2

--5. Display the current date in a format that appears as Jan 04, 96. 
SELECT FORMAT(GETDATE(),'MMM dd yyyy') AS FORMATTED_DATE2

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
SELECT DATEDIFF(MONTH,'2008-12-31','2009-03-31') AS DIFFERENCE_DATE

--7. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
SELECT DATEDIFF(HOUR,'2012-01-25 7:00','2012-01-26 10:30') AS DIFFERENCE_DATE


--8. Write a query to extract Day, Month, Year from given date 12-May-16.
SELECT DAY('12-May-16') AS DAY,
MONTH('12-May-16') AS MONTH,
YEAR('12-May-16') AS YEAR

--9. Write a query that adds 5 years to current date. 
SELECT DATEADD(YEAR,5,GETDATE()) AS FUTURE_DATE3

--10. Write a query to subtract 2 months from current date. 
SELECT DATEADD(MONTH,-2,GETDATE()) AS FUTURE_DATE4


--11. Extract month from current date using datename () and datepart () function. 
SELECT DATENAME(MONTH,GETDATE()) AS MONTH1,
DATEPART(MONTH,GETDATE()) AS MONTH2

--12. Write a query to find out last date of current month.
SELECT EOMONTH(GETDATE())

--13. Calculate your age in years and months. 
DECLARE @a DATE = '2007-02-20';
SELECT DATEDIFF(YEAR,@a,GETDATE()) AS AGE_YEAR,
DATEDIFF(MONTH,@a,GETDATE()) AS AGE_MONTH

--14. Display all records where account date is in the year 2025. 
SELECT *
FROM DEPOSITE
WHERE YEAR(ADATE)=2025

--15. Display all records where account date is in the month of March.
SELECT *
FROM DEPOSITE
WHERE MONTH(ADATE)=03

--16. Display records where account date is after ‘01-Jan-2025’. 
SELECT *
FROM DEPOSITE
WHERE ADATE>2025-01-01

--17. Display records where account date is before ‘01-Jan-2025’.
SELECT * FROM DEPOSITE
WHERE ADATE<2025-01-01

--18. Display records where day of account date is 1. 
SELECT *
FROM DEPOSITE
WHERE DAY(ADATE)=01

--19. Display records where month of account date is greater than 6. 
SELECT *
FROM DEPOSITE
WHERE MONTH(ADATE)>06

--20. Display records where year of account date is 2026. 
SELECT *
FROM DEPOSITE
WHERE YEAR(ADATE)=2026

--21. Display number of accounts opened in each year. 
SELECT DISTINCT YEAR(ADATE) AS YEAR,COUNT(ACTNO)
FROM DEPOSITE
GROUP BY YEAR(ADATE)

--22. Display number of accounts opened in each month. 
SELECT DISTINCT MONTH(ADATE) AS MONTH,COUNT(ACTNO)
FROM DEPOSITE
GROUP BY MONTH(ADATE)

--23. Display maximum amount deposited in each year. 
SELECT DISTINCT YEAR(ADATE) AS YEAR,MAX(AMOUNT) AS MAX
FROM DEPOSITE
GROUP BY YEAR(ADATE)

--24. Display minimum amount deposited in each month. 
SELECT DISTINCT MONTH(ADATE) AS MONTH,MIN(AMOUNT) AS MIN
FROM DEPOSITE
GROUP BY MONTH(ADATE)

--25. Display total amount deposited in each year.
SELECT DISTINCT YEAR(ADATE) AS YEAR,SUM(AMOUNT) AS TOTAL
FROM DEPOSITE
GROUP BY YEAR(ADATE)

--26. Display records where account date is between ‘01-Mar-2025’ and ‘31-Dec-2025’. 
SELECT *
FROM DEPOSITE
WHERE ADATE BETWEEN '2025-03-01' and '2025-12-31'

--27. Display records where account date is in the current year. 
SELECT *
FROM DEPOSITE
WHERE YEAR(ADATE)=YEAR(GETDATE())

--28. Display difference in days between today’s date and account date.
SELECT ACTNO,DATEDIFF(DAY,ADATE,GETDATE()) AS DIFF
FROM DEPOSITE