# 🎓 Student Placement Analysis

## Project Overview
Analyzes academic and placement records for 10,000 students to find what actually predicts placement outcomes — CGPA, internships, aptitude scores, and soft-skills training. The goal was to move past assumptions and quantify which factors correlate most strongly with getting placed, using SQL, Excel, and an interactive Tableau dashboard.

## 🛠️ Tech Stack
* **Database & Querying:** SQL (Aggregations, Subqueries, CASE statements, Filtering, Grouping)
* **Data Processing & Analysis:** Microsoft Excel (Pivot Tables)
* **Data Visualization:** Tableau Public (Interactive Dashboard)

## 🔍 Key Objectives & Workflow

**1. Data Validation (SQL & Excel)**
* Loaded 10,000 student records into SQL and checked for null values and duplicate `StudentID`s before analysis.
* Verified category consistency for boolean-style fields (Extracurricular Activities, Placement Training) to ensure accurate grouping.

**2. Exploratory Data Analysis (SQL & Excel)**
* Built SQL aggregations and Excel pivot tables to segment students by CGPA band, internship count, and placement training status.
* Compared placement outcomes across CGPA brackets and internship/training combinations to isolate which factors moved the needle most.

**3. Dashboard Development (Tableau)**
* Built a 3-panel interactive Tableau dashboard: placement rate by CGPA band, internship × training impact, and a skill-gap comparison (aptitude score, soft-skills rating) between placed and not-placed students.

## 📊 Key Findings
* Placement rate climbs from **17.6%** in the lowest CGPA band (6.5–7.0) to **87.5%** in the highest (9.0+) — nearly a 5x difference.
* Placement training nearly triples the placement rate for students with zero internships (**14.6% → 44.2%**), and combined with 2+ internships pushes it to **76%**.
* Placed students average **84.5** on aptitude tests vs. **75.8** for students not placed, and **4.5** vs. **4.2** (out of 5) on soft-skills rating.

## 📁 Repository Structure
* `Student_Placement_Analysis_data.csv` — Dataset of 10,000 student records
* `database_setup.sql` — SQL script for table creation, data validation, and aggregation queries
* `Student_Placement_Analysis_Workbook.xlsx` — Excel workbook with pivot table analysis
* `Student_Placement_Analytics_Dashboard.twb` — Tableau workbook (interactive dashboard)
* `Student_Placement_Dashboard_Preview.png` — Static snapshot of the dashboard

## 👨‍💻 Author
**Akash H K**
*Aspiring Data Analyst*
[LinkedIn](https://www.linkedin.com/in/your-profile-here) | [GitHub](https://github.com/AkashHK2004)
