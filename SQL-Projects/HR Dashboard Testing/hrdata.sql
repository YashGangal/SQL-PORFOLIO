#create database hr_database -
create database hr_database;

#import data hrdata.csv in hr database 

#select all data from the table - 
select * from hrdata;

#total number of emloyees -
select sum(employee_count) from hrdata;

#total number with education filter -

#High School -
select sum(employee_count) from hrdata
where education = 'High School';

#Associates Degree -
select sum(employee_count) from hrdata
where education = 'Associates Degree';

#Bachelor's Degree -
select sum(employee_count) from hrdata
where education = "Bachelor's Degree";

#Master's Degree -
select sum(employee_count) from hrdata
where education = "Master's Degree";

#Doctoral Degree -
select sum(employee_count) from hrdata
where education = "Doctoral Degree";

#Total employees according to department -

#HR -
select sum(employee_count) from hrdata
where department = "HR";

#R&D -
select sum(employee_count) from hrdata
where department = "R&D";

#Sales -
select sum(employee_count) from hrdata
where department = "Sales";

#Total employees according to education field - 

#Medical -
select sum(employee_count) from hrdata
where education_field = "Medical";

#Life Sciences -
select sum(employee_count) from hrdata
where education_field = "Life Sciences";

#Marketing -
select sum(employee_count) from hrdata
where education_field = "Marketing";

#Technical Degree -
select sum(employee_count) from hrdata
where education_field = "Technical Degree";

#Other -
select sum(employee_count) from hrdata
where education_field = "Other";

#count total number of attrition - 
select count(attrition) from hrdata
where attrition = "yes";

#we can apply and select different condition according to our requirement for example -
select count(attrition) from hrdata
where attrition = "yes" and education_field = "medical" and department = "sales" and gender = "male";

#attrition rate -
select (select count(attrition) from hrdata where attrition = "yes")/sum(employee_count) * 100 from hrdata;

#attrition rate with different conditions - 
select (select count(attrition) from hrdata where attrition = "yes" and department = 'sales')/
sum(employee_count) * 100 from hrdata where department = 'sales';

select (select count(attrition) from hrdata where attrition = "Yes" and department = 'Sales' and education_field = "Medical")/
sum(employee_count) * 100 from hrdata where department = 'Sales' and education_field = "Medical";

#active employee count -
select sum(employee_count) - (select count(attrition) from hrdata
where attrition = "yes") from hrdata;

#active employee count with gender condition -
select sum(employee_count) - (select count(attrition) from hrdata
where attrition = "yes"and gender = 'Male') from hrdata where gender = 'Male';

#average age of employees 
select round(avg(age),0) as Age_average from hrdata;

#chart testing

#Attrition by Gender - 
select gender, count(attrition) from hrdata
where attrition = 'Yes'
group by gender 
order by count(attrition) desc;

#Attrition by Gender and with filter exmaple - 
select gender, count(attrition) from hrdata
where attrition = 'Yes' and education = 'High School'
group by gender 
order by count(attrition) desc;

#Department wise Attrition - 
select department, count(attrition) as department_wise_attrition, 
round((count(attrition) 
/ (select count(attrition) from hrdata where attrition  = 'yes')) * 100, 2) as percentage
from hrdata
where attrition = 'Yes'
group by department
order by count(attrition) desc;

#Department wise Attrition with gender filter - 
select department, count(attrition) as male_attrition, 
round((count(attrition) 
/ (select count(attrition) from hrdata where attrition  = 'yes' and gender = 'Male')) * 100, 2) as percentage
from hrdata
where attrition = 'Yes' and gender ='Male'
group by department
order by count(attrition) desc;

#Department wise Attrition with gender filter - 
select department, count(attrition) as female_attrition, 
round((count(attrition) 
/ (select count(attrition) from hrdata where attrition  = 'yes' and gender = 'Female')) * 100, 2) as percentage
from hrdata
where attrition = 'Yes' and gender ='Female'
group by department
order by count(attrition) desc;

#Education Field wise Attrition - 
select education_field, count(attrition),
round((count(attrition) 
/ (select count(attrition) from hrdata where attrition  = 'yes')) * 100, 2) as percentage
from hrdata
where attrition = 'Yes'
group by education_field
order by count(attrition) desc;

#Number of employees by age group -
select age, sum(employee_count) as agewise_employees from hrdata
group by age
order by age 

#Number of employees by age group and with different filter -
select age, sum(employee_count) as agewise_employees 
from hrdata 
where department = 'Sales'
group by age
order by age








