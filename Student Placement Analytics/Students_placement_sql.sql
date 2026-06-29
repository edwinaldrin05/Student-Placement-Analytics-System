CREATE SCHEMA placement_db;
USE placement_db;
CREATE TABLE Student_Placement (
    Student_ID VARCHAR(10) PRIMARY KEY,
    Department VARCHAR(30),
    CGPA DECIMAL(3,2),
    Internship VARCHAR(5),
    Certifications INT,
    Company_Name VARCHAR(50),
    Package_LPA DECIMAL(4,2),
    Placement_Status VARCHAR(20)
);
desc Student_placement;
SELECT * FROM Student_Placement;
SELECT COUNT(*)FROM Student_placement;
SELECT count(*) FROM Student_placement
WHERE Placement_Status= "Placed";
SELECT
ROUND(
COUNT(CASE WHEN Placement_Status='Placed' THEN 1 END)
*100.0/COUNT(*),2)
AS Placement_Percentage
FROM Student_Placement;
SELECT ROUND(AVG(CGPA),2) AS Average_CGPA
FROM Student_Placement;
SELECT ROUND(AVG(Package_LPA),2) AS Average_Package
FROM Student_Placement
WHERE Placement_Status='Placed';
SELECT MAX(Package_LPA) AS Highest_package
FROM Student_Placement;
SELECT Department,
COUNT(*) AS Students,
SUM(Placement_Status='Placed') AS Placed
FROM Student_Placement
GROUP BY Department;
SELECT Company_Name,
COUNT(*) AS Students_Hired
FROM Student_Placement
WHERE Placement_Status='Placed'
GROUP BY Company_Name
ORDER BY Students_Hired DESC;
SELECT Internship,
COUNT(*) AS Total,
SUM(Placement_Status='Placed') AS Placed
FROM Student_Placement
GROUP BY Internship;
SELECT *
FROM Student_Placement
WHERE CGPA>8.5;
SELECT Department,
ROUND(AVG(Package_LPA),2) AS Avg_Package
FROM Student_Placement
WHERE Placement_Status='Placed'
GROUP BY Department;