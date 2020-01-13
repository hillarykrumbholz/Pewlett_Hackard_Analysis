# Pewlett Hackard Analysis

### Project Overview
Pewlett Hackard is about to have a surge of employees are retiring around the same time. Currently, the company does not have a concise database that will let them predict who will be leaving and how many job openings they will have in the coming years. They have requested that a local database be created that will house all of their information so that all datasets are centrally located.

### Resources
- Data source: departments.csv, employees.csv, managers.csv, dept_emp.csv, titles.csv, salaries.csv
- Software: PostgreSQL 11.6, Visual Studio Code 1.40.2

Written report:
Presents a cohesive written
report that includes the
following:
Summary of the results
✓ number of individuals retiring
✓ number of individuals being
hired
✓ number of individuals
available for mentorship role
Additionally, the summary
should include
✓ one recommendation for
further analysis on this data set

### The Entity Relationship Diagram:
![ERD](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/EmployeeDB.png)


## Module Objective
Find the number of employees that are eligible for retirement and the departments they work in. We also want to know how many managers are working at Pewlett Hackard. Lastly, the sales team wants specifics of their department, so they need to know how many how many of their employees will be leaving. 

Number of employees in each department eligible for retirement:<br/>
![emp_dept](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/emp_count_dept.png)<br/>

Number of managers working at Pewlett Hackard:<br/>
![managers](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/managers_in_each_dept.png)<br/>


## Challenge Objective
Pewlett Hackard is wanting to introduce a mentoring program where experienced employees step back into a part-time role, while they mentor newly hired employees. We already have a list of mentors for each department, but HR would also like a list of current employees who would be good candidates for a supervisory role, and ideally born in 1955. 

- Number of Individuals Retiring: 41,380<br/>

A breakdown of how many idividuals are retiring from each department:<br/>
![dept_retiring](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/mentor_list_count.png)

- Number of Individuals Available for a Mentorship Role: 1,549

A breakdown of idividuals available for the mentorship, and what departments they currently work in:<br/>
![ind_mentorship](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Images/emp_to_be_mentor_count.png)<br/>

- Number of Individuals Needing to be Hired: 39,831 (Found by subtracting individuals available for mentorship from the individuals retiring.)
 
## Links to queries:
[schema](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Queries/schema.sql)<br/>
[quereies](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Queries/queries.sql)<br/>
[challenge](https://github.com/hillarykrumbholz/Pewlett_Hackard_Analysis/blob/master/Queries/challenge.sql)<br/>

