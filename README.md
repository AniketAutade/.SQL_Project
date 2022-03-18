# SQL-Project-2

This repository contains three .sql files. Attrition file mentions database creation and data import. Remaining two .sql files (insights.sql and classification.sql) showcase different insights about the datasets. Much like the EDA with only SQL queries.  

# Data import and regarding issues:

    1. I began with table creation and data import from csv files. 
    2. Unfortunately, the stackoverflow solutions to accessing csv files from any folders are not working on windows 11.
    3. Therefore, I used the folder location for secure_file_priv option in my.ini file and uploaded all the csv files in that folder. 
    4. LOAD DATA INFILE method to directly insert the data into the tables has been succesfully implemented.


# Basic Information about this dataset:

    1. This database has three tables depicting one to one relationship.
    2. Employment number is a common denominator that connects these three datasets.
    3. This dataset is extracted from Kaggle. 
    4. link: https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset  

Uncover the factors that lead to employee attrition and explore important questions such as ‘show me a breakdown of distance from home by job role and attrition’ or ‘compare average monthly income by education and attrition’. This is a fictional data set created by IBM data scientists.

Education
- 'Below College'
- 'College'
- 'Bachelor'
- 'Master'
- 'Doctor'

EnvironmentSatisfaction
- 'Low'
- 'Medium'
- 'High'
- 'Very High'

JobInvolvement
- 'Low'
- 'Medium'
- 'High'
- 'Very High'

JobSatisfaction
- 'Low'
- 'Medium'
- 'High'
- 'Very High'

PerformanceRating
- 'Low'
- 'Good'
- 'Excellent'
- 'Outstanding'

RelationshipSatisfaction
- 'Low'
- 'Medium'
- 'High'
- 'Very High'

WorkLifeBalance
- 'Bad'
- 'Good'
- 'Better'
- 'Best'
