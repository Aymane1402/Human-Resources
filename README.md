# 👥 Human Resources Data Analysis with SQL

This project focuses on cleaning and analyzing employee data from a Human Resources dataset using SQL. The dataset includes demographic information, job roles, hire and termination dates, and employee locations.

---

## 📌 Objective

The primary goal is to uncover insights that can help HR teams understand workforce composition, trends, and key performance indicators such as turnover rates, age distribution, and employment history.

---

## 🧹 Data Cleaning Process

- Renamed incorrectly encoded columns.
- Converted date columns (`birthdate`, `hire_date`, `termdate`) to proper `DATE` format.
- Standardized null values (e.g., used `'1970-01-01'` as a placeholder for active employees).
- Calculated employee `age` using the `birthdate`.
- Handled incorrect or future birthdates.

---

## 🧠 Key Business Questions Answered

- What is the gender and race/ethnicity breakdown of current employees?
- What is the age distribution across the company?
- How many employees are remote vs. at headquarters?
- What is the average length of employment for terminated employees?
- What are the most common job titles?
- Which departments have the highest turnover rates?
- How is employee distribution spread across states?
- How has the workforce changed over time?
- What is the average tenure by department?

---

## 🛠️ Technologies Used

- SQL (MySQL)
- Excel (for initial data exploration)
- Power BI (optional for visualizations)

---

## 📁 Repository Contents

- `data_cleaning.sql`: SQL scripts for cleaning and preparing the dataset.
- `hr_analysis.sql`: SQL queries used to answer business questions.
- `README.md`: Project overview and documentation.

---

## 📬 Contact

**Aymane Barakat**  
📧 Email: barakataymane77@gmail.com  


