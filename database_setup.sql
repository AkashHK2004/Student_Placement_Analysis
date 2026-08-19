-- ============================================================================
-- Project: Placement Readiness & Student Performance Analysis
-- Description: SQL script for cleaning and analyzing student placement data.
-- Skills Demonstrated: CTEs, Window Functions, CASE statements, Aggregations.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- PART 1: TABLE CREATION
-- ----------------------------------------------------------------------------
CREATE TABLE student_placements (
    Student_ID VARCHAR(10) PRIMARY KEY,
    Department VARCHAR(50),
    CGPA DECIMAL(3,2),
    Internship_Experience INT,
    Core_Skills VARCHAR(100),
    Placement_Status VARCHAR(20),
    Package_LPA DECIMAL(5,2)
);

-- ----------------------------------------------------------------------------
-- PART 2: DATA CLEANING & STANDARDIZATION
-- ----------------------------------------------------------------------------
-- 2.1 Remove Duplicate Entries (Keep the latest record)
WITH CTE AS (
    SELECT *, 
           ROW_NUMBER() OVER(PARTITION BY Student_ID ORDER BY Student_ID) as row_num
    FROM student_placements
)
DELETE FROM CTE WHERE row_num > 1;

-- 2.2 Handle Missing Values (Set NULL packages for unplaced students to 0)
UPDATE student_placements
SET Package_LPA = 0
WHERE Placement_Status = 'Not Placed' AND Package_LPA IS NULL;

-- 2.3 Standardize Inconsistent Skill Categories
UPDATE student_placements
SET Core_Skills = UPPER(TRIM(Core_Skills));

-- ----------------------------------------------------------------------------
-- PART 3: AGGREGATIONS & ANALYSIS
-- ----------------------------------------------------------------------------
-- 3.1 Compare placement rate and average package across departments
SELECT 
    Department,
    COUNT(Student_ID) AS Total_Students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS Placed_Students,
    ROUND((SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) * 100.0) / COUNT(Student_ID), 2) AS Placement_Rate_Pct,
    ROUND(AVG(NULLIF(Package_LPA, 0)), 2) AS Avg_Package_LPA
FROM student_placements
GROUP BY Department
ORDER BY Placement_Rate_Pct DESC;

-- 3.2 Analyze placement outcomes across CGPA brackets
SELECT 
    CASE 
        WHEN CGPA >= 9.0 THEN '9.0+'
        WHEN CGPA >= 8.0 THEN '8.0 - 8.9'
        WHEN CGPA >= 7.0 THEN '7.0 - 7.9'
        ELSE 'Below 7.0'
    END AS CGPA_Bracket,
    ROUND(AVG(NULLIF(Package_LPA, 0)), 2) AS Avg_Package_LPA,
    COUNT(*) AS Total_Students
FROM student_placements
GROUP BY 
    CASE 
        WHEN CGPA >= 9.0 THEN '9.0+'
        WHEN CGPA >= 8.0 THEN '8.0 - 8.9'
        WHEN CGPA >= 7.0 THEN '7.0 - 7.9'
        ELSE 'Below 7.0'
    END
ORDER BY CGPA_Bracket DESC;
