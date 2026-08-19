-- ============================================================================
-- Project: Placement Readiness & Student Performance Analysis
-- Description: SQL script for cleaning and analyzing student placement data.
-- ============================================================================

-- 1. TABLE CREATION
CREATE TABLE student_placements (
    StudentID INT PRIMARY KEY,
    CGPA DECIMAL(3,2),
    Internships INT,
    Projects INT,
    Workshops_Certifications INT,
    AptitudeTestScore INT,
    SoftSkillsRating DECIMAL(3,2),
    ExtracurricularActivities VARCHAR(10),
    PlacementTraining VARCHAR(10),
    SSC_Marks INT,
    HSC_Marks INT,
    PlacementStatus VARCHAR(20)
);

-- 2. DATA CLEANING & STANDARDIZATION
-- Remove duplicate records (Keeping the latest)
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY StudentID ORDER BY StudentID) as row_num
    FROM student_placements
)
DELETE FROM CTE WHERE row_num > 1;

-- Standardize Yes/No flags to title case
UPDATE student_placements
SET ExtracurricularActivities = 'No' WHERE ExtracurricularActivities = 'no';

-- 3. AGGREGATIONS & ANALYSIS
-- 3.1: Placement Rate by CGPA Bracket
SELECT 
    CASE 
        WHEN CGPA >= 9.0 THEN '9.0+'
        WHEN CGPA >= 8.0 THEN '8.0 - 8.9'
        WHEN CGPA >= 7.0 THEN '7.0 - 7.9'
        ELSE 'Below 7.0'
    END AS CGPA_Bracket,
    COUNT(*) AS Total_Students,
    SUM(CASE WHEN PlacementStatus = 'Placed' THEN 1 ELSE 0 END) AS Placed_Count,
    ROUND(SUM(CASE WHEN PlacementStatus = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Placement_Rate_Pct
FROM student_placements
GROUP BY 1
ORDER BY CGPA_Bracket DESC;

-- 3.2: Impact of Internships & Placement Training on Success
SELECT 
    Internships,
    PlacementTraining,
    COUNT(*) AS Total_Students,
    ROUND(SUM(CASE WHEN PlacementStatus = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Placement_Rate_Pct
FROM student_placements
GROUP BY Internships, PlacementTraining
ORDER BY Placement_Rate_Pct DESC;
