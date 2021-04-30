select * from current_dep_emp

select c.emp_no, c.first_name, c.last_name, c.dept_no, s.salary
into practice_table
from current_dep_emp as c
join salaries as s
on c.emp_no = s.emp_no

select * from practice_table

select dept_no, first_name, last_name, salary
from practice_table
where salary = (select max(salary) from practice_table) -- only displays overall highest salary

select *
from practice_table
where salary in (select max(salary) from practice_table)
group by dept_no -- fails because other columns not part of aggregate function

select dept_no, max(salary)
from practice_table
group by dept_no -- returns max salary for each department

select first_name, last_name, dept_no, salary
from practice_table -- returns max salary for each department with employee info
where (dept_no, salary) in (select dept_no, max(salary) from practice_table group by dept_no)
order by salary desc

select c.dept_no, max(s.salary)
from current_dep_emp as c
join salaries as s
on c.emp_no = s.emp_no
group by c.dept_no



Select first_name, last_name, dept_no, max(salary) over (partition by dept_no) as top_salary
from practice_table -- returns new column with max salary put in each row for each department


with pt as (Select first_name, last_name, dept_no, salary, dense_rank() over (partition by dept_no order by salary desc) as top_salary
from practice_table)
select first_name, last_name, dept_no, salary
from pt
where top_salary = 1 -- returns max salary for each department and will include matching salary numbers for the rank requested


WITH fingers_crossed AS (
	SELECT *
	FROM (select c.first_name, c.last_name, c.dept_no, s.salary
	from current_dep_emp as c
	join salaries as s
	on c.emp_no = s.emp_no) AS foo) 
SELECT *
FROM fingers_crossed
WHERE (dept_no, salary) in (select dept_no, max(salary) from fingers_crossed group by dept_no)
ORDER BY salary DESC;