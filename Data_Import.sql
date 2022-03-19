
DROP DATABASE IF EXISTS attrition;
CREATE DATABASE IF NOT EXISTS attrition;

USE attrition;

CREATE TABLE emp_info(
emp_no 			INT NOT NULL PRIMARY KEY,
age 			INT,
marital_status 	VARCHAR(16),
Educ_field 		VARCHAR(128),
Educ_level 		INT
);
 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Personal_Information.csv'
INTO TABLE emp_info
FIELDS TERMINATED BY ','   
LINES TERMINATED BY '\n'  
IGNORE 1 LINES;

CREATE TABLE work_info(
emp_no 			INT NOT NULL PRIMARY KEY,
Department 		VARCHAR(255),
BusinessTravel 	VARCHAR(128),
work_dist 		INT,
work_role 		VARCHAR(128)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/work_Information.CSV'
INTO TABLE work_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE attrition(
emp_no 						INT NOT NULL PRIMARY KEY,
NumCompaniesWorked 			INT,
PercentSalaryHike			VARCHAR(128),
EnvironmentSatisfaction		INT,
JobSatisfaction				INT,
RelationshipSatisfaction	INT,
WorkLifeBalance				INT,
TotalWorkingYears 			INT,
YearsAtCompany 				INT, 
YearsInCurrentRole 			INT,
YearsWithCurrManager 		INT, 
Attrition 					VARCHAR(16)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/attrition.CSV'
INTO TABLE attrition
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;