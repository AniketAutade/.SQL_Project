# At first I extract different insights from each table.
# Afterwards, I aim to implement subqueries to delve deep and detect different insights using advanced SQL queries. 

USE attrition;

# Provide the count of employees as per their education field backgrounds and seperate this count against marital status as well. 

SELECT 
    Educ_field, marital_status, COUNT(emp_no) AS total_employees
FROM
    emp_info
GROUP BY Educ_field , marital_status
ORDER BY Educ_field, marital_status;

# Provide the total number employees group by their educational levels accross all the departments.

SELECT 
    Educ_level, COUNT(emp_no)
FROM
    emp_info
GROUP BY Educ_level
ORDER BY Educ_level;

# Provide the total number of employees in different age groups where age group is formed 10-19,20-29, ... etc.

ALTER TABLE emp_info
ADD age_group VARCHAR(16);

update emp_info
set age_group= (
	CASE 
		WHEN AGE<20 AND AGE>=15 THEN '10-19'
        WHEN AGE<30 AND AGE>=20 THEN '20-29'
        WHEN AGE<40 AND AGE>=30 THEN '30-39'
        WHEN AGE<50 AND AGE>=40 THEN '40-49'
        WHEN AGE<60 AND AGE>=50 THEN '50-59'
        WHEN AGE<70 AND AGE>=60 THEN '60-69'
        WHEN AGE<80 AND AGE>=70 THEN '70-79'
        WHEN AGE<90 AND AGE>=80 THEN '80-89'
        END
        );

SELECT 
    age_group, COUNT(emp_no)
FROM
    emp_info
GROUP BY age_group
ORDER BY age_group ASC;

# Query total employees by the different age groups and by their marital_status. 

SELECT 
    age_group AS 'Age_Group',
    marital_status AS 'Marital_status',
    COUNT(emp_no) AS 'Total_employees'
FROM
    emp_info
GROUP BY age_group , marital_status
ORDER BY age_group , marital_status DESC;


# Query to find total employees in the company groupped by their business departments and their roles.

SELECT 
    department AS 'Department', work_role, COUNT(emp_no)
FROM
    work_info
GROUP BY department , work_role
ORDER BY department , work_role;

# The dataset shows that few employees have business travel requirements. Query to find total number of employees with different travel requirements.

SELECT 
    BusinessTravel, COUNT(emp_no) AS 'Total_employees'
FROM
    work_info
GROUP BY BusinessTravel
ORDER BY Total_employees DESC;

# Count the total employees who travel more than 10KM/ 20KM in order to reach work place. 

SELECT 
    COUNT(emp_no)
FROM
    work_info
WHERE
    work_dist > 20;

SELECT 
    COUNT(emp_no)
FROM
    work_info
WHERE
    work_dist > 10;


# Calculate the total employees that had lower job satisfaction but higher work-life balance. Find the number of such employess which lead/did not lead to an attrition  

SELECT 
    JobSatisfaction,
    WorkLifeBalance,
    Attrition,
    COUNT(emp_no) AS 'Total_Employees'
FROM
    attrition
GROUP BY JobSatisfaction , WorkLifeBalance , Attrition
ORDER BY JobSatisfaction , WorkLifeBalance , Attrition DESC;

# Query to find average salary hikes with increasing job satisfaction levels. Count the number of employees which did and did not leave the company. 

SELECT 
    JobSatisfaction,
    attrition AS 'Attrition',
    COUNT(emp_no) AS 'Total_employees',
    ROUND(AVG(PercentSalaryHike), 2) AS 'Average_Salary_Hike'
FROM
    attrition
GROUP BY JobSatisfaction , attrition
ORDER BY JOBSatisfaction DESC , attrition DESC;  
		#Interesting observations in this table. 
        
# Query to find attrition numbers by their departments and age groups. 

SELECT 
    w.department AS 'Departments',
    e.age_group AS 'Age_Groups',
    attrition as 'Attrition',
    COUNT(e.emp_no) as 'Total_Employees'
FROM
    emp_info e
        INNER JOIN
    work_info w
    ON e.emp_no=w.emp_no
		INNER JOIN 
        attrition a
	ON w.emp_no=a.emp_no
    GROUP BY w.department, e.age_group, attrition
    ORDER BY w.department DESC;
    

# Create a view that depicts information about average salary hikes for every work role accross all departments. Arrange the table by descending salary hike averages. 

DROP VIEW IF EXISTS salary_hike;
CREATE VIEW salary_hike AS
    SELECT 
        w.work_role,
        w.department,
        ROUND(AVG(a.PercentSalaryHike), 2) AS 'Avg_Salary_Hike'
    FROM
        attrition a
            INNER JOIN
        work_info w ON a.emp_no = w.emp_no
    GROUP BY w.work_role
    ORDER BY w.department, Avg_Salary_Hike DESC; 









 







