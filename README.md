# Pewlett Hackard Analysis

### Project Overview
Pewlett Hackard is about to have a surge of employees are retiring around the same time. Currently, the company does not have a concise database that will let them predict who will be leaving and how many job openings they will have in the coming years. They have requested that a local database be created that will house all of their information so that all datasets are centrally located.

### Resources
- Data source: departments.csv, employees.csv, managers.csv, dept_emp.csv, titles.csv, salaries.csv
- Software: PostgreSQL 11.6, Visual Studio Code 1.40.2

### The Entity Relationship Diagram:
![ERD](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/EmployeeDB.png)

## Module Objective
Find the number of employees that are eligible for retirement and the departments they work in. We also want to know how many managers are working at Pewlett Hackard. Lastly, the sales team wants specifics of their department, so they need to know how many how many of their employees will be leaving. 

We first filtered our list to show who would be retiring in the near future; we did this by looking at employees born between 1952 and 1955, and who were hired between 1985 and 1988. This gave us the cound of 41,380 employees. From this information, I wanted to see what departments these employees were currently working in. So a count was created for each of the nine departments.

Number of employees in each department eligible for retirement:<br/>
![emp_dept](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/emp_count_dept.png)<br/>

Next, it was important to see how many managers were working at Pewlett Hackard and what departments they were in. Interestingly, we found that there are only five managers working throughout the nine different departments. This seems unusual, and is something that should be addressed soon especially before there in an influx of new hires to the company. 

Number of managers working at Pewlett Hackard:<br/>
![managers](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/managers_in_each_dept.png)<br/>

The sales team requested information specifically to their department, so a list was generated estimating that 7,301 individuals would potentially be retiring soon, (the list also states the individuals' names). This prompted the manager from the Development department to request the same information, especially since in a joint effort with the Sales team, the two managers are looking to start up a new mentoring program. It was found that between their two departments, 18,928 individuals may be retiring soon. The mentorship program was looked into further during the challenge.

## Challenge Objective
Pewlett Hackard is wanting to introduce a mentoring program where experienced employees step back into a part-time role, while they mentor newly hired employees. We already have a list of mentors for each department, but HR would also like a list of current employees who would be good candidates for a supervisory role, and ideally born in 1965. 

- Number of Individuals Retiring: 41,380.<br/>
It should be noted that this information was previoulsy found. It was important to make sure that there were not any duplicate names in the list, caused by employees holding a prior position in the company.  however, I wanted to see what positions these individuals currently had. <br/>
![dept_retiring](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/mentor_list_count.png)<br/>

Snapshot of the table created:<br/>
![titles_retiring](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/mentor_list.png)

- Number of Individuals Available for a Mentorship Role: 1,549<br/>
Next, I wanted to generate a list of current employees that would be eligible candidates for the mentorship program. The limitations put on this list were that they needed to be current employees and to have been born in the year 1965. From this we found 1,549 employees that met the criteria. I was interested in seeing what positions these individuals currently held. <br/>
![ind_mentorship](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/emp_to_be_mentor_count.png)<br/>

Snapshot of the table created:<br/>
![mentor_ready](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/mentor_ready.png)

- Number of Individuals Needing to be Hired: 39,831<br/>
To find this information, I subtracted individuals available for mentorship from the individuals retiring. 

- Recommendation for further analysis:<br/>
I think it would be beneficial to have more filters as to who is eligible for the mentorship program. Rather than limiting it to employees born in the year 1965, I think it would be better to look at how long an employee has been working at the company. I believe it is more indicitive how successful an individual will be based on their past experience, rather than just their age.
 
## Links to queries:
[Schema](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Queries/schema.sql)<br/>
[Queries from Module](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Queries/queries.sql)<br/>
[Challenge](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Queries/challenge.sql)<br/>

## CSV Files
All tables and csv files are located in the data folder.
