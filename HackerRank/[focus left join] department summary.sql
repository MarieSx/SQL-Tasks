/*
Complex in left join

Problem:
Given two tables, Employee and Department, generate a summary of how many employees are in each department. Each department should be listed, whether they currently have any employees or not. The results should be sorted from high to low by number of employees, and then alphabetically by department when departments have the same number of employees. The results should list the department name followed by the employee count. The column names are not tested, so use whatever is appropriate.

Process:
1. structure: department name | employee count
2. notice, even a department does not have any employee, we still need to list them. So, it needs left join department table.
3. order by COUNT(employee) DESC, then department name ASC when count employee are same, notice the order in order by.


Context consider:
This criteria is popular in the real case to calculate department vs. employee number. Or, other criteria like customer vs. product purchased, date vs. promotion event etc.


*/

Solution:
SELECT 
  d.name, COUNT(DISTINCT e.id)
FROM department d
LEFT JOIN 
employee e ON d.id = e.dept_id
GROUP BY d.name
ORDER BY COUNT(e.id) DESC, d.name ASC
;



/*
Schema:
EMPLOYEE
Name	        Type	        Description
ID	         Integer	    Employee ID number. This is a primary key.
NAME	       String	      Employee name
SALARY	     Integer	    Employee salary
DEPT_ID	     Integer	    ID of the employee's department, a foreign key to DEPARTMENT.ID.

DEPARTMENT
Name	        Type	        Description
ID	         Integer	    Department ID. This is a primary key.
NAME	       String	      Department name.
LOCATION	   String	      Department location.

*/
