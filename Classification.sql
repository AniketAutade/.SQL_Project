# This dataset is used to connect different factors that lead to employee attrition in the business.
# This .sql file focuses to find those insights related to attrition. 

USE attrition;

# Table 1
SELECT 
    a.JobSatisfaction, a.WorkLifeBalance, a.attrition, count(a.emp_no) as 'Total_employee'
FROM
    attrition a
         JOIN
    emp_info e ON a.emp_no = e.emp_no
    where a.JobSatisfaction= 4 OR a.JobSatisfaction= 5 
    group by a.JobSatisfaction, a.WorkLifeBalance, a.attrition
    ORDER BY a.WorkLifeBalance DESC;

# This table provides an insight about employees with higher job satisfaction and higher work-life balance. Still few employees left the company.
# Let us delve deeper into this group of employees. 

SELECT 
    a.JobSatisfaction,
    a.WorkLifeBalance,
    a.EnvironmentSatisfaction,
    ROUND(AVG(w.work_dist), 2) AS 'Work_distance',
    ROUND(AVG(a.PercentSalaryHike), 2) as 'Avg_Hike',
        ROUND(AVG(a.YearsInCurrentRole), 2) as 'Avg_Years in Current Role',
    COUNT(a.emp_no) AS 'Total_employee',
    a.attrition
FROM
    attrition a
        JOIN
    emp_info e ON a.emp_no = e.emp_no
        JOIN
    work_info w ON w.emp_no = a.emp_no
WHERE
    a.JobSatisfaction = 4
        OR a.JobSatisfaction = 5
GROUP BY a.JobSatisfaction , a.WorkLifeBalance , a.attrition , a.EnvironmentSatisfaction
ORDER BY a.WorkLifeBalance DESC , a.EnvironmentSatisfaction DESC;
    
# This table definitely provides an important insight. Those employees, with better work-life balance, higher job 
# satisfaction and environmental satisfaction, who left the company, had the highest average salary hike in that 
# role compared to anyone else. These employees had highest average years in that role compared to any other groups.
# These employees probably felt trapped even though the company offered a higher increase rather than a promotion.


# Let us take another look at different section of this dataset. Let us compare experience, percentage hike and average years with current manager. 

SELECT 
    w.Department,
    e.marital_status,
    a.JobSatisfaction,
    ROUND(AVG(a.YearsAtCompany), 2) as 'Years at Company',
    ROUND(AVG(a.PercentSalaryHike), 2) as 'Avg Salary Hike',
    ROUND(AVG(a.YearsWithCurrManager),2) as 'Years with Current Manager',
    ROUND(AVG(a.YearsInCurrentRole),2) as 'Years in Current role',
    ROUND(AVG(w.work_dist),2) as 'Avg_Work_Distace',    
    COUNT(e.emp_no) as 'Total_employees',
    a.attrition
FROM
    attrition a
        JOIN
    emp_info e ON e.emp_no = a.emp_no
        JOIN
    work_info w ON a.emp_no = w.emp_no
    GROUP BY w.Department, e.marital_status, a.JobSatisfaction, a.attrition
    ORDER BY w.Department DESC, e.marital_status DESC, a.JobSatisfaction DESC;  

# In this table, a specific group stands out compared to others. Across departments, people with relatively better job satisfaction valued work
# distance majorly than any other group. Average distance to work was significantly higher among employees who decided to leave the company. 

# Above-mentioned group is an interesting bunch of dataset. Let's observe work-life balance and relationship satisfaction levels. 

SELECT 
    w.Department,
    e.marital_status,
    a.JobSatisfaction,
    a.WorkLifeBalance,
    ROUND(AVG(a.YearsAtCompany), 2) as 'Years at Company',
    ROUND(AVG(a.PercentSalaryHike), 2) as 'Avg Salary Hike',
    ROUND(AVG(a.YearsWithCurrManager),2) as 'Years with Current Manager',
    ROUND(AVG(a.YearsInCurrentRole),2) as 'Years in Current role',
    ROUND(AVG(w.work_dist),2) as 'Avg_Work_Distace',    
    COUNT(e.emp_no) as 'Total_employees',
    a.attrition
FROM
    attrition a
        JOIN
    emp_info e ON e.emp_no = a.emp_no
        JOIN
    work_info w ON a.emp_no = w.emp_no
    where 
    a.JobSatisfaction=3 or a.JobSatisfaction=4
    GROUP BY w.Department, e.marital_status, a.JobSatisfaction,a.WorkLifeBalance, a.attrition
    ORDER BY w.Department DESC, e.marital_status DESC, a.JobSatisfaction DESC, a.WorkLifeBalance DESC; 