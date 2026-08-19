# 🎓 Placement Readiness & Student Performance Analysis

## Project Overview
This project analyzes the academic and placement records of 10,000 students to uncover meaningful patterns in CGPA, aptitude test scores, internship experiences, and final placement outcomes. The goal is to identify the quantitative and qualitative drivers of successful campus placements and provide actionable insights for student placement readiness.

## 🛠️ Tech Stack
* **Database & Querying:** SQL (CTEs, Window Functions, Aggregations, CASE statements)
* **Data Processing & Analytics:** Microsoft Excel (Pivot Tables, Data Cleaning)
* **Data Visualization:** Tableau (Calculated Fields, Dynamic Binning, Interactive Dashboards)

## 🔍 Key Objectives & Workflow

### 1. Data Cleaning & Structuring (Excel & SQL)
* Processed a raw dataset of 10,000 student records, validating data types and handling potential duplicates using SQL Window Functions.
* Standardized boolean flags (e.g., Extracurriculars, Placement Training) to ensure accurate grouping and seamless visualization.

### 2. Exploratory Data Analysis (SQL & Excel)
* Created Excel pivot tables and complex SQL aggregations to evaluate core performance metrics.
* Segmented students into **CGPA brackets**, revealing a sharp statistical increase in placement rates for students crossing the 8.0 CGPA threshold.
* Analyzed the compounding impact of multiple **internships** and formal **placement training** on a student's likelihood of securing a role.
* Evaluated the skill gap by comparing the average **Aptitude Test Scores** and **Soft Skills Ratings** between placed and unplaced students.

### 3. Dashboard Development (Tableau)
* Built an interactive Tableau dashboard to synthesize the SQL and Excel findings.
* Developed custom calculated fields (e.g., `Placement Rate %`) to generate dynamic, percentage-based visual metrics.
* Implemented cross-filtering, allowing users to click on a specific CGPA bracket and dynamically update the internship and skill gap charts.

## 📁 Repository Structure
* `placementdata.csv`: The raw dataset containing 10,000 student academic and extracurricular records.
* `placement_analysis.sql`: The SQL script used for data deduplication, cleaning, and advanced aggregation queries.
* `Placement_Analysis_Dashboard.twbx`: The packaged Tableau workbook containing the interactive visualizations.
* `Dashboard_Screenshot.png`: A high-quality snapshot of the final Tableau dashboard for quick viewing.

## 👨‍💻 Author
**Akash H K**  
*Aspiring Data Analyst*  
[LinkedIn](https://www.linkedin.com/) | [GitHub](https://github.com/AkashHK2004)
