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

2. 




## Summary

I will respond to the following two questions to best ability:

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?


2. Are there enough qualified, retirement ready employees in the departments to mentor the next generation of Pewlett Hackard employees?