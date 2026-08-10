SELECT * FROM STUDENT
SELECT * FROM RESULT
--Part – A:
--1. Display the details of students whose SPI is greater than the average SPI.
SELECT SNAME,SPI FROM STUDENT
WHERE SPI > (SELECT AVG(SPI) FROM STUDENT)


--2. Display the names of students whose SPI is less than the average SPI.
SELECT SNAME,SPI FROM STUDENT
WHERE SPI < (SELECT AVG(SPI) FROM STUDENT)

--3. Display the student details who has the highest SPI.
SELECT SNAME,SPI FROM STUDENT
WHERE SPI = (SELECT MAX(SPI) FROM STUDENT)

--4. Display the student details who has the lowest SPI.
SELECT SNAME,SPI FROM STUDENT
WHERE SPI = (SELECT MIN(SPI) FROM STUDENT)

--5. Display the students whose SPI is greater than SPI of student DHARMIK.
SELECT SNAME,SPI FROM STUDENT
WHERE SPI > (SELECT SPI FROM STUDENT WHERE SNAME = 'DHARMIK')

--6. Display the students whose SPI is less than SPI of student RIYA.
SELECT SNAME,SPI FROM STUDENT
WHERE SPI < (SELECT SPI FROM STUDENT WHERE SNAME = 'RIYA')

--7. Display the students who belong to the same branch as KRUNAL.
SELECT SNAME,BRANCH FROM STUDENT
WHERE BRANCH = (SELECT BRANCH FROM STUDENT WHERE SNAME = 'KRUNAL')

--8. Display the students whose branch is different from HETVI.
SELECT SNAME,BRANCH FROM STUDENT
WHERE BRANCH != (SELECT BRANCH FROM STUDENT WHERE SNAME = 'HETVI')

--9. Display the second highest SPI from RESULT table.
SELECT MAX(SPI) FROM RESULT 
WHERE SPI < (SELECT MAX(SPI) FROM RESULT)

--10. Display the second lowest SPI from RESULT table.
SELECT MIN(SPI) FROM RESULT 
WHERE SPI > (SELECT MIN(SPI) FROM RESULT)

--11. Display the names of students whose SPI is above branch-wise average SPI.
SELECT * FROM STUDENT S1
WHERE SPI >
(SELECT AVG(SPI) FROM STUDENT S2
WHERE S1.BRANCH=S2.BRANCH)

--12. Display the branch having maximum average SPI.
SELECT BRANCH , AVG(SPI)
FROM STUDENT 
GROUP BY BRANCH 
HAVING AVG(SPI) = (
    SELECT MAX(AVG_SPI) 
    FROM (
        SELECT AVG(SPI) AS AVG_SPI 
        FROM STUDENT 
        GROUP BY BRANCH) AS BRANCH_AVG);

--13. Display the branch having minimum average SPI.
SELECT BRANCH , AVG(SPI)
FROM STUDENT 
GROUP BY BRANCH 
HAVING AVG(SPI) = (
    SELECT MIN(AVG_SPI) 
    FROM (
        SELECT AVG(SPI) AS AVG_SPI 
        FROM STUDENT 
        GROUP BY BRANCH) AS BRANCH_AVG);

--From the table STUDENT_INFO and RESULT perform the following queries:
--Part – B:
SELECT * FROM STUDENT_INFO
--14. Display the students whose SPI is greater than all students of ME branch.
SELECT NAME,RESULT.RNO,BRANCH,RESULTID
FROM RESULT JOIN STUDENT_INFO
ON RESULT.RNO=STUDENT_INFO.RNO
WHERE SPI > (
    SELECT MAX(SPI) 
    FROM STUDENT_INFO JOIN RESULT 
    ON RESULT.RNO=STUDENT_INFO.RNO
    WHERE BRANCH = 'ME'
);

--15. Display the students whose SPI is less than any student of ME branch.
SELECT NAME,RESULT.RNO,BRANCH,RESULTID
FROM RESULT JOIN STUDENT_INFO
ON RESULT.RNO=STUDENT_INFO.RNO
WHERE SPI < ANY (
    SELECT SPI 
    FROM STUDENT_INFO JOIN RESULT 
    ON RESULT.RNO=STUDENT_INFO.RNO
    WHERE BRANCH = 'ME'
);

--16. Display the student details whose SPI is not equal to any SPI of EC branch students.
SELECT NAME,RESULT.RNO,BRANCH,RESULTID
FROM RESULT JOIN STUDENT_INFO
ON RESULT.RNO=STUDENT_INFO.RNO
WHERE SPI != ANY(
    SELECT SPI 
    FROM STUDENT_INFO JOIN RESULT 
    ON RESULT.RNO=STUDENT_INFO.RNO
    WHERE BRANCH = 'EC'
);

--17. Display the names of students who scored higher SPI than student of RNO 103.
SELECT NAME,RESULT.RNO,BRANCH,RESULTID
FROM RESULT JOIN STUDENT_INFO
ON RESULT.RNO=STUDENT_INFO.RNO
WHERE SPI > (
    SELECT SPI 
    FROM STUDENT_INFO JOIN RESULT 
    ON RESULT.RNO=STUDENT_INFO.RNO
    WHERE RESULT.RNO = 103
);

--18. Display the students whose SPI is greater than average SPI of their own branch.
SELECT S.NAME,R.RNO,S.BRANCH,RESULTID
FROM RESULT R JOIN STUDENT_INFO S
ON R.RNO=S.RNO
WHERE SPI > (
    SELECT AVG(SPI) 
    FROM STUDENT_INFO S1 JOIN RESULT R1
    ON R1.RNO=S1.RNO
    WHERE S1.BRANCH=S.BRANCH
);

--19. Display the students whose SPI is greater than the average SPI of CE branch but greater than the
--maximum SPI of ME branch.
SELECT S.NAME,R.RNO,S.BRANCH,RESULTID
FROM RESULT R JOIN STUDENT_INFO S
ON R.RNO=S.RNO
WHERE SPI > (
    SELECT AVG(SPI) 
    FROM STUDENT_INFO S1 JOIN RESULT R1
    ON R1.RNO=S1.RNO
    WHERE BRANCH='CE'
) AND SPI>(
    SELECT MAX(SPI)
    FROM STUDENT_INFO S1 JOIN RESULT R1
    ON R1.RNO=S1.RNO
    WHERE BRANCH='ME'
);

--20. Display the branch names whose average SPI is greater than the overall average SPI.
SELECT S.BRANCH,AVG(SPI)
FROM RESULT R JOIN STUDENT_INFO S
ON R.RNO=S.RNO
GROUP BY BRANCH
HAVING AVG(SPI) > (
    SELECT AVG(SPI) 
    FROM STUDENT_INFO S1 JOIN RESULT R1
    ON R1.RNO=S1.RNO
);

--21. Display the students who have maximum SPI in their respective branch.
SELECT S.BRANCH,SPI
FROM RESULT R JOIN STUDENT_INFO S
ON R.RNO=S.RNO
GROUP BY BRANCH
HAVING SPI = (
    SELECT MAX(SPI) 
    FROM STUDENT_INFO S1 JOIN RESULT R1
    ON R1.RNO=S1.RNO
    WHERE S1.BRANCH=S.BRANCH
);

--22. Display the students whose SPI is greater than their average SPI of their branch and greater than overall
--average SPI.
--Part – C:
--23. Display the students whose SPI is greater than at least one student of every branch.
--24. Display the students whose SPI is less than all students of CE branch.
--25. Display the branch that contains the student with highest SPI.
--26. Display the students whose SPI is less than the SPI of every student in CE branch and greater than every
--student in ME branch. 