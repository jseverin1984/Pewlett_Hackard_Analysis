# Pewlett Hackard Retirement Analysis

## Overview of the Analysis

The overall goal of analyzing Pewlett Hackard's employee data was to see what the retirement outlook for their current employee looked
like in the near future.  Find out how many employees have the potential to retire and what departments and titles they would be retiring
from.  Allowing for managers of each department to prepare for the retirement of the baby boomers. Also, helping to establish a list
of employees who could be potential mentors for those replacing the retirees.  I used pgAdmin 4 to access the databases through PostgresSQL13.

## Results

After analyzing Pewlett Hackard's SQL database on their employees, there are four major points that need to be discussed.

1. After creating the appropriate table to get all employees who were born between 1952 and 1955, I used the following code
``` SELECT count(emp_no) FROM retirement_titles WHERE to_date = '9999-01-01'; ``` in order to get a count of current employees
whose age would give them the potential to retire.  The total is 72458 employees who are 65 or older and eligible to retire.

2. There are plenty of potential employees from each title in order to help with the transition. Below is an image showing those numbers.

![alt text](https://github.com/jseverin1984/Pewlett_Hackard_Analysis/blob/main/Data/mentorship_numbers.png)

3. Whomever is currently running the Pewlett Hakcard employee databases needs to keep a more fluid and updated current employee list.

4. The employees need to really share their salary numbers with each other. After looking over employee salaries, there are Senior engineers
   making less money than some regular staff employees. I know this has nothing to do with the deliverables, but I was running out of MAJOR
   points to discuss.



## Summary

I will respond to the following two questions to best ability:

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?

	Below is an image to show how many employees have the potential to retire from each title.

![alt text](https://github.com/jseverin1984/Pewlett_Hackard_Analysis/blob/main/Data/retiring_titles_numbers.png)


2. Are there enough qualified, retirement ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

	I believe there are plenty of current employees in each department that fit the role for mentorship to help those that will
	be replacing the employees that retire.  In the code block below, the query will allow for a table to be created giving the name
	of every employee in their respected department that is eligible to be a mentor. The WHERE clause and INTO statement are the only pieces
	that would need to be modified in order to produce the list of eligible mentors for every department.
```
SELECT me.emp_no,
	me.first_name,
	me.last_name,
	d.dept_name,
	me.title
INTO research_dept_mentors
FROM mentorship_eligibility AS me
JOIN dept_emp AS de
ON (me.emp_no = de.emp_no)
JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Research';
```