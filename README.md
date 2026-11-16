# E-Learning Platform – SQL Data Analysis Project

## Project Overview
This project focuses on analysing an E-Learning Platform database using **MySQL**. The objective is to explore learner information, course details, and purchase transactions using SQL queries and joins.

The analysis helps understand learner purchasing behaviour, course popularity, category-wise revenue, and overall course performance.

## Tools Used
- MySQL
- MySQL Workbench
- SQL

## Database Structure
The project contains three tables:

1. **Learners** – Stores learner ID, full name, and country.
2. **Courses** – Stores course ID, course name, category, and unit price.
3. **Purchases** – Stores purchase ID, learner ID, course ID, quantity, and purchase date.

## SQL Concepts Used
- CREATE DATABASE and CREATE TABLE
- INSERT INTO
- Primary Key and Foreign Key
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY and HAVING
- Aggregate Functions (SUM, COUNT)
- DISTINCT
- ORDER BY
- LIMIT

## Data Exploration Using Joins
The project uses different types of joins to explore relationships between learners, courses, and purchases.

- **INNER JOIN:** Displays matching learner, course, and purchase records.
- **LEFT JOIN:** Displays all learners along with their purchase details.
- **RIGHT JOIN:** Displays all courses along with their purchase details.

## Analytical Queries
The following business questions were analysed:

1. What is the total spending of each learner?
2. Which are the top 3 most purchased courses based on quantity sold?
3. What is the total revenue and number of unique learners in each course category?
4. Which learners have purchased courses from more than one category?
5. Which courses have not been purchased?

## Key Insights
- Machine Learning is the most purchased course in the sample dataset.
- Artificial Intelligence generates the highest category-wise revenue.
- Two learners have purchased courses from multiple categories.
- All five courses have received at least one purchase.
- The analysis helps identify popular courses and learner purchasing patterns.

## Recommendations
- Focus marketing efforts on popular courses, especially Machine Learning.
- Promote high-performing course categories.
- Introduce related course recommendations to encourage learners to explore multiple categories.
- Monitor course performance to identify opportunities for improvement.

## Project Files
- `Elearning_Platform_Analysis.sql` – Contains database creation, table creation, sample data insertion, joins, and analytical queries.
- `One_Page_Project_Summary.docx` – Contains key insights and recommendations.

## Conclusion
This project helped me gain practical knowledge of MySQL and understand how SQL joins and analytical queries can be used to explore data and generate meaningful business insights.

**Created as part of my Data Analytics learning journey.**
