CREATE DATABASE CSE_3B_386
CREATE TABLE DEPOSITE(
ACTNO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50), 
AMOUNT DECIMAL(8,2),
ADATE DATETIME,
);

INSERT INTO DEPOSITE VALUES
(101, 'MEET', 'MAVDI ',10000, '1-3-2025'),
(102, 'JAY ','MADHAPAR ',5000, '4-1-2026'),
(103, 'RAHUL', 'BEDI ',3500, '7-1-2026'),
(104, 'RIYA', 'MAVDI', 1200, '7-6-2025'),
(105, 'MANSI', 'KKV HALL', 3000, '2-3-2024'),
(106, 'DIYA', 'MADHAPAR', 2000, '1-3-2025'),
(107, 'BEDI', 'BEDI', 1000, '5-9-2025'),
(108, 'UDAY', 'UMIYA CHOWK', 5000, '2-7-2025'),
(109, 'CHARMI', 'SHITAL PARK', 7000, '2-8-2026'),
(110, 'BHAVIN', 'RING ROAD', 8000, '2-2-2025'),
(111, 'BANSI', NULL, 9000, '1-1-2025');

SELECT * FROM DEPOSITE

CREATE TABLE STUDENT(
STDID INT,
SNAME VARCHAR(50),
CITY VARCHAR(50),
SPI DECIMAL(4,2),
BRANCH VARCHAR(50),
);

INSERT INTO STUDENT VALUES
(101, 'HETVI', 'RAJKOT', 7.40, 'COMPUTER'),
(102, 'RAJ', 'MORBI', 9.50, 'MECHANICAL'),
(103, 'VISHAL', 'RAJKOT', 9.00, 'CIVIL'),
(104, 'DEEP', 'SURAT', 8.80, 'COMPUTER'),
(105, 'DHARMIK', 'BARODA', 8.80, 'CHEMICAL'),
(106, 'KRUNAL', 'VAPI', 9.00, 'CIVIL'),
(107, 'RIYA', 'NAVSARI', 5.50, 'COMPUTER'),
(108, 'VRUNDA', 'KUTCH', 7.60, 'ELECTRICAL'),
(109, 'SMAIR', 'JAMNAGAR', 6.80, 'EC'),
(110, 'PARAG', 'SURAT', 7.00, 'CHEMICAL'),
(111, 'HARSH', 'RAJKOT', 4.00, NULL);

SELECT * FROM STUDENT

CREATE TABLE EMPLOYEE(
EID INT,
FIRSTNAME VARCHAR(50),
LASTNAME VARCHAR(50),
DEPARTMENT VARCHAR(20),
SALARY DECIMAL,
CITY VARCHAR(50),
GENDER VARCHAR(10),
JOININGYEAR DECIMAL,
);

DELETE EMPLOYEE

INSERT INTO EMPLOYEE VALUES
(101, 'HETVI', 'PATEL', 'ADMIN', 12000.00, 'RAJKOT', 'FEMALE', 2026),
(102, 'RAJ', 'MEHTA', 'IT', 14000.00, 'AHMEDABAD', 'MALE', 2022),
(103, 'VISHAL', 'SHARMA', 'HR', 15000.00, 'BARODA', 'MALE', 2020),
(104, 'DEEP', 'PATEL', 'ADMIN', 12500.00, 'RAJKOT', 'MALE', 2026),
(105, 'DHAVAL', 'SHAH', 'IT', 14000.00, 'JAMNAGAR', 'MALE', 2024),
(106, 'RIYA', 'KAUR', 'IT', 5000.00, 'AHMEDABAD', 'FEMALE', 2024),
(107, 'PARAG', 'PANDYA', 'HR', 7000.00, 'RAJKOT', 'MALE', 2025),
(108, 'VRUNDA', 'VYAS', 'SERVER', 10000.00, 'BARODA', 'FEMALE', 2022),
(109, 'MEHUL', 'SINGH', 'HR', 12000.00, 'MORBI', 'MALE', 2020),
(110, 'MUBIN', 'PARMAR', 'TRANSPORT', 12000.00, 'SURAT', 'MALE', 2021),
(111, 'MAYANK', 'PUROHIT', 'ACCOUNT', 13000.00, NULL, 'MALE', 2020);

--Retrieve all data from table STUDENT.  
SELECT * FROM EMPLOYEE

--Display Student Name and City from STUDENT.
SELECT SNAME,CITY FROM STUDENT

--3. Display student details of all students who belongs to COMPUTER branch. 
SELECT * FROM STUDENT WHERE BRANCH = 'COMPUTER'

--5. Give Student Name, City and SPI of student whose SPI is greater than 6.50.  
SELECT * FROM STUDENT WHERE SPI > 6.5

--6. Give name of Student whose branch is COMPUTER and SPI is greater than 8.00.  
SELECT * FROM STUDENT WHERE BRANCH = 'COMPUTER' AND SPI > 8.0

--7. Give names of students whose ID is greater than 103 and belongs to Rajkot city.  
SELECT * FROM STUDENT WHERE STDID > 103 AND CITY = 'RAJKOT'

--8. Display names of students who belong to either ‘RAJKOT’ or ‘SURAT’ city (USE OR & IN). 
SELECT * FROM STUDENT WHERE CITY = 'RAJKOT' OR CITY = 'SURAT'

--9. Display names of students with branch whose SPI is greater than 8.0 and ID is less than 105. 
SELECT * FROM STUDENT WHERE STDID < 105 AND SPI > 8.0

----10. Find all students whose SPI is greater than or equal to 7.0 and less than or equal to 9.0 (USE AND & BETWEEN).
SELECT * FROM STUDENT WHERE SPI BETWEEN 7.0 AND 9.0

--11. Find all students who do not belong to ‘COMPUTER’ branch. 
SELECT * FROM STUDENT WHERE BRANCH != 'COMPUTER'

--12. Display Student ID, Name & SPI of students who belong to ‘COMPUTER’, ‘CIVIL’ or ‘CHEMICAL’ branch and ID is less than 104. 
SELECT STDID,SNAME,SPI FROM STUDENT WHERE BRANCH IN ( 'COMPUTER' ,'CIVIL' ,'CHEMICAL') AND STDID < 104

--13. Display all student IDs and names who do not belong to ‘COMPUTER’ or ‘CIVIL’ branch (USE NOT IN). 
SELECT STDID,SNAME,SPI FROM STUDENT WHERE BRANCH NOT IN ( 'COMPUTER' ,'CIVIL') 

--14. Display all student names other than ‘DEEP’ from STUDENT table (USE NOT, <>, !=). 
SELECT * FROM STUDENT WHERE SNAME != 'DEEP'
SELECT * FROM STUDENT WHERE SNAME <> 'DEEP'
SELECT * FROM STUDENT WHERE SNAME NOT IN ('DEEP')

--15. Display student names whose branch is not available (NULL) in STUDENT table. 
SELECT * FROM STUDENT WHERE BRANCH IS NULL

--16. Retrieve all unique branches name from STUDENT table. 
SELECT DISTINCT BRANCH FROM STUDENT 

--17. Retrieve first 50% records from STUDENT table. 
SELECT TOP 50 PERCENT * FROM STUDENT

--18. Retrieve first five student IDs from STUDENT table. 
SELECT TOP 5 STDID FROM STUDENT

--19. Display all the details of first five students from STUDENT table. 
SELECT TOP 5 * FROM STUDENT

--20. Display all the details of first three students whose SPI is greater than 8.0. 
SELECT TOP 3 * FROM STUDENT WHERE SPI > 8

--21. Display Student ID, Name of first five students whose branch does not belong to ‘COMPUTER’ branch. 
SELECT TOP 5 * FROM STUDENT WHERE BRANCH != 'COMPUTER'

--22. Select all details with student IDs not in the range 105 to 109. 
SELECT * FROM STUDENT WHERE STDID NOT BETWEEN 105 AND 109

--23. Select all records from STUDENT where SPI is greater than 7.0 and less than or equal to 9.0, and student ID is between 102 and 108.
SELECT * FROM STUDENT WHERE SPI > 7 AND SPI <= 9 AND STDID BETWEEN 102 AND 108

--24. Display all details of students who have SPI more than 8.5 without using * from STUDENT table. 
SELECT STDID,SNAME,CITY,SPI,BRANCH FROM STUDENT WHERE SPI > 8.5

--25. Retrieve names of students whose city is ‘RAJKOT’ and SPI is less than 8.00. 
SELECT SNAME FROM STUDENT WHERE CITY = 'RAJKOT' AND SPI < 8

--26. Retrieve records from STUDENT table where SPI is greater than 8.0 and student ID is less than 105. 
SELECT * FROM STUDENT WHERE STDID < 105 AND SPI > 8

--27. Retrieve records from STUDENT table where SPI is greater than 7.5 and student ID is between 100 and 110 and city is ‘RAJKOT’ or ‘SURAT’.
SELECT * FROM STUDENT WHERE SPI > 7.5 AND STDID BETWEEN 100 AND 110 AND CITY IN ('RAJKOT','SURAT')

--28. Display details of students who belong to ‘CIVIL’ or ‘MECHANICAL’ branch and SPI is greater than 8.0. 
SELECT * FROM STUDENT WHERE SPI > 8 AND BRANCH IN ('CIVIL','MECHANICAL') 

--LAB 4
SELECT * FROM STUDENT
DELETE DEPOSITE

--1. Update SPI of all students from 7.00 to 8.00. 
UPDATE STUDENT SET SPI=8 WHERE SPI=7

--2. Change city of HETVI from RAJKOT to AHMEDABAD. 
UPDATE STUDENT SET CITY = 'AHMEDABAD' WHERE SNAME = 'HETVI'

--3. Update SPI of DEEP to 9.20 and city to VADODARA. 
UPDATE STUDENT SET CITY = 'VADODARA' , SPI = 9.2 WHERE SNAME = 'DEEP'

--4. Update SPI of DHARMIK to 8.50. 
UPDATE STUDENT SET SPI = 8.5 WHERE SNAME = 'DHARMIK'

--5. Update branch name from COMPUTER to IT. 
UPDATE STUDENT SET BRANCH = 'IT' WHERE BRANCH = 'COMPUTER'

--6. Update branch of RAJ to AUTOMOBILE. 
UPDATE STUDENT SET BRANCH = 'AUTOMOBILE' WHERE SNAME = 'RAJ'

--7. Update SPI to 7.50 where STDID is between 103 and 107. 
UPDATE STUDENT SET SPI = 7.5 WHERE STDID BETWEEN 103 AND 107

--8. Update city of PARAG to MUMBAI. 
UPDATE STUDENT SET CITY = 'MUMBAI' WHERE SNAME = 'PARAG'

--9. Update SPI of RIYA to 6.00. 
UPDATE STUDENT SET SPI=6 WHERE SNAME = 'RIYA'

--10. Update SPI of SMAIR to 7.20 and branch to ELECTRICAL. 
UPDATE STUDENT SET SPI=7.2 , BRANCH='MECHANICAL' WHERE SNAME = 'SMAIR'

--11. Give 10% increment in SPI.  
UPDATE STUDENT SET SPI = SPI + 0.1*SPI

--12. Increase SPI by 20% for all students.  
UPDATE STUDENT SET SPI = SPI + 0.2*SPI

--13. Increase SPI by 0.50 in all records.  
UPDATE STUDENT SET SPI = SPI + 0.5*SPI

--14. Update branch to 'EC' and SPI to 8.00 and city to Surat where SNAME is KRUNAL.  
UPDATE STUDENT SET SPI = 8 , BRANCH ='EC',CITY='SURAT' WHERE SNAME = 'KRUNAL'

--15. Update city to 'RAJKOT' and SPI to 7.00 where branch is CIVIL and stdid is less than 105. 
UPDATE STUDENT SET SPI = 7 ,CITY='RAJKOT' WHERE STDID < 105 AND  BRANCH ='CIVIL'

--16. Update SPI of student with stdid 110 to NULL.  
UPDATE STUDENT SET SPI =NULL WHERE STDID = 110

--17. Update branch of VISHAL to NULL.  
UPDATE STUDENT SET BRANCH = NULL WHERE SNAME = 'VISHAL'

--18. Display names of students whose SPI is NULL.  
SELECT SNAME FROM STUDENT WHERE SPI IS NULL

--19. Display students who have branch assigned.  
SELECT SNAME FROM STUDENT WHERE BRANCH IS NOT NULL

--20. Update student with stdid 108 to name DARSHAN, branch COMPUTER, and SPI 8.50.  
UPDATE STUDENT SET SNAME = 'DARSHAN',BRANCH='COMPUTER',SPI=8.5 WHERE STDID = 108

--21. Update city to SURAT where SPI is less than 7.00.  
UPDATE STUDENT SET CITY = 'SURAT' WHERE SPI < 7

--22. Update city to NULL and branch to MECHANICAL where stdid is 109. 
UPDATE STUDENT SET CITY = NULL,BRANCH='MECHANICAL' WHERE STDID = 109

--LAB 5
--1. Add column state varchar(20).  
SELECT * FROM DEPOSITE
ALTER TABLE DEPOSITE
ADD  STATE VARCHAR(20)

--2. Add two more columns city varchar(20) and pincode int. 
ALTER TABLE DEPOSITE
ADD BNAME VARCHAR(50)

--3. Change the size of cname column from varchar(50) to varchar(35).  
ALTER TABLE DEPOSITE
ALTER COLUMN CNAME VARCHAR(50)

--4. Change the data type of amount from decimal to int.  
ALTER TABLE DEPOSITE
ALTER COLUMN AMOUNT INT

--5. Delete column city from the DEPOSIT table. 
ALTER TABLE DEPOSITE
DROP COLUMN BNAME

--6. Rename column actno to ano.
EXEC SP_RENAME 'DEPOSITE.ACTNO','ANO';

--7. Rename column bname to branch_name.
EXEC SP_RENAME 'DEPOSITE.BNAME','BRANCH_NAME';

--8. Rename table DEPOSIT to DEPOSIT_DETAIL.
EXEC SP_RENAME 'DEPOSITE','DEPOSITE_DETAIL';

--9. Add column ifsc_code varchar(15). 
ALTER TABLE DEPOSITE_DETAIL
ADD IFSC_CODE VARCHAR(15)

--10. Change the size of bname column from varchar(50) to varchar(30).
ALTER TABLE DEPOSITE_DETAIL
ALTER COLUMN BNAME VARCHAR(30)

--11. Rename column adate to aopendate. 
EXEC SP_RENAME 'DEPOSITE.ADATE','AOPENDATE';

--12. Delete column aopendate from DEPOSIT_DETAIL table.  
ALTER TABLE DEPOSITE_DETAIL
DROP COLUMN AOPENDATE

--13. Rename column cname to customer_name.  
EXEC SP_RENAME 'DEPOSITE_DETAIL.CNAME','CUSTOMER_NAME';

--14. Add column country varchar(20).  
ALTER TABLE DEPOSITE_DETAIL
ADD COUNTRY VARCHAR(20)

--15. Add column account_type varchar(15). 
ALTER TABLE DEPOSITE_DETAIL
ADD ACCOUNT_TYPE VARCHAR(15)

--16. Change data type of pincode from int to bigint. 
ALTER TABLE DEPOSITE_DETAIL
ALTER COLUMN PINCODE BIGINT

--17. Delete column account_type.
ALTER TABLE DEPOSITE_DETAIL
DROP COLUMN ACCOUNT_TYPE

--18. Rename column amount to balance. 
EXEC SP_RENAME 'DEPOSITE_DETAIL.AMOUNT','BALANCE';

--19. Add column status varchar(10). 
ALTER TABLE DEPOSITE_DETAIL
ADD STATUS VARCHAR(10)

--20. Change table name deposit_detail to bank_deposit.
EXEC SP_RENAME 'DEPOSITE_DETAIL','BANK_DEPOSITE';

--1. Delete all the records having amount less than or equal to 3000.  
DELETE FROM BANK_DEPOSITE
WHERE BALANCE<=3000

--2. Delete all the accounts of ‘BEDI’ branch customer. 
DELETE FROM BANK_DEPOSITE
WHERE BRANCH_NAME='BEDI'

--3. Delete all the accounts having account number greater than 102 and less than 109.
DELETE FROM BANK_DEPOSITE
WHERE ACTNO BETWEEN 102 AND 109
--4. Delete all the accounts whose branch is ‘BEDI’ or ‘MADHAPAR’.
DELETE FROM BANK_DEPOSITE
WHERE BRANCH_NAME='BEDI' OR 'MADHAPAR'
--5. Delete all the accounts details where amount is 8000 and account open after 1-1-2025; 
DELETE FROM BANK_DEPOSITE
WHERE AMOUNT=8000 AND ADATE = 1-1-2025
--6. Delete all the accounts whose account branch is NULL.  
DELETE FROM BANK_DEPOSITE
WHERE BRANCH_NAME IS NULL
--7. Delete all the accounts details where amount is 7000 and name is CHARMI and branch is SHITAL PARK. 
DELETE FROM BANK_DEPOSITE
WHERE AMOUNT=7000 AND NAME = 'CHARMI' AND BRANCH_NAME='SHITAL_PARK'
--8. Delete all the remaining records using DELETE command. 
DELETE FROM BANK_DEPOSITE
--9. Delete all the records of DEPOSIT table. (Use TRUNCATE)  
TRUNCATE TABLE BANK_DEPOSITE
--10. Remove DEPOSIT table. (Use DROP)
DROP TABLE DEPOSITE
--11. Delete all the students whose stdid is greater than 105.  
DELETE FROM STUDENT
WHERE STDID>105
--12. Delete the records whose branch is NULL and sname is not NULL. 
DELETE FROM STUDENT
WHERE BRANCH IS NULL AND SNAME IS NOT NULL
--13. Delete the records whose SPI is less than 9 and city is RAJKOT.  
DELETE FROM STUDENT
WHERE SPI<9 AND CITY='RAJKOT'
--14. Delete the records whose branch name is not empty.  
DELETE FROM STUDENT
WHERE BRANCH IS NOT NULL
--15. Delete all the records of STUDENT table. (Use TRUNCATE)
TRUNCATE TABLE STUDENT