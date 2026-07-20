CREATE DATABASE placement_analysis;

SHOW DATABASES;

USE placement_analysis;

SELECT DATABASE();

CREATE TABLE students (
    StudentID INT PRIMARY KEY,
    CGPA DECIMAL(3,2),
    Internships INT,
    Projects INT,
    Workshops_Certifications INT,
    AptitudeTestScore INT,
    SoftSkillsRating DECIMAL(3,2),
    ExtracurricularActivities VARCHAR(10),
    PlacementTraining VARCHAR(10),
    SSC_Marks DECIMAL(5,2),
    HSC_Marks DECIMAL(5,2),
    PlacementStatus VARCHAR(20)
);
SELECT * FROM students;
SELECT COUNT(*) AS Total_Students
FROM students;
DESCRIBE students;
SELECT *
FROM students
WHERE StudentID IS NULL;
SELECT StudentID, COUNT(*)
FROM students
GROUP BY StudentID
HAVING COUNT(*) > 1;
SELECT PlacementStatus, COUNT(*) AS Count
FROM students
GROUP BY PlacementStatus;



