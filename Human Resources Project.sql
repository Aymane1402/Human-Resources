SELECT * 
FROM human.humans;

describe human.humans;

ALTER TABLE humans
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

select birthdate 
FROM human.humans;

alter table human.humans
modify column birthdate date;

update human.humans
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

alter table human.humans
modify column hire_date date;

UPDATE human.humans  
SET termdate = '1970-01-01'  
WHERE termdate IS NULL;


update human.humans
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

select termdate 
from human.humans;

UPDATE human.humans 
SET termdate = DATE(STR_TO_DATE(REPLACE(termdate, ' UTC', ''), '%Y-%m-%d %H:%i:%s'))
WHERE termdate IS NOT NULL AND termdate != ' ';

alter table human.humans
modify column termdate date;

ALTER TABLE human.humans  
ADD COLUMN age INT;

UPDATE human.humans  
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

SELECT * 
FROM human.humans;

SELECT *  
FROM human.humans  
WHERE birthdate > CURDATE();

UPDATE human.humans  
SET age = ABS(age)  
WHERE age < 0;



-- What is the gender breakdown of employees in the company?
 select 
 gender,
 count(*) as count
 from human.humans
 where age >= 18 and termdate = '1970-01-01'
 group by 1;

-- What is the race/ethnicity breakdown of employees in the company?

select 
race,
count(*) as count 
 from human.humans
 where age >= 18 and termdate = '1970-01-01'
group by 1 ;

-- What is the age distribution of employees in the company?
select 
min(age) as Youngest,
max(age) as oldest
from human.humans;

-- How many employees work at headquarters versus remote locations?
select location ,
count(*) as count
from human.humans
group by 1;

-- What is the average length of employment for employees who have been terminated?
SELECT 
round(AVG(DATEDIFF(termdate, hire_date)) / 365,0) AS avg_years_employed
FROM human.humans
where termdate <> '1970-01-01' and age >= 18 and termdate <= curdate();

-- How does the gender distribution vary across departments and job titles?
SELECT department, gender, COUNT(*) AS count
FROM human.humans
 where age >= 18 and termdate = '1970-01-01'
GROUP BY department, gender
ORDER BY department;

-- What is the distribution of job titles across the company?
select 
jobtitle,
count(*) as count
 FROM human.humans
 where age >= 18 and termdate = '1970-01-01'
 group by 1
 order by 1 desc;
 
 -- Which department has the highest turnover rate?
 SELECT department, COUNT(*) as total_count, 
    SUM(CASE WHEN termdate <= CURDATE() AND termdate <> '1970-01-01' THEN 1 ELSE 0 END) as terminated_count, 
    (SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END) / COUNT(*)) as termination_rate
FROM human.humans
GROUP BY department
ORDER BY termination_rate DESC;

-- What is the distribution of employees across locations by state?
SELECT location_state, COUNT(*) as count
FROM human.humans
GROUP BY location_state
ORDER BY count DESC;

-- How has the company's employee count changed over time based on hire and term dates?
SELECT 
    YEAR(hire_date) AS year, 
    COUNT(*) AS hires, 
    SUM(CASE WHEN termdate <> '1970-01-01' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations, 
    COUNT(*) - SUM(CASE WHEN termdate <> '1970-01-01' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS net_change,
    ROUND(((COUNT(*) - SUM(CASE WHEN termdate <> '1970-01-01' AND termdate <= CURDATE() THEN 1 ELSE 0 END)) / COUNT(*) * 100),2) AS net_change_percent
FROM human.humans
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date) ASC;

-- What is the tenure distribution for each department?
SELECT department, ROUND(AVG(DATEDIFF(CURDATE(), termdate)/365),0) as avg_tenure
FROM human.humans
WHERE termdate <= CURDATE() AND termdate <> '1970-01-01' AND age >= 18
GROUP BY department
