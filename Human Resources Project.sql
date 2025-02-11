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













