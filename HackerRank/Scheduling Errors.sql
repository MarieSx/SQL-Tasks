/*
Conplex on finding and clear interpret the condition (teach outside of their deparment)

Problem: 
A university maintains data on professors, departments, courses, and schedules in four tables: DEPARTMENT, PROFESSOR, COURSE, and SCHEDULE.

Write a query to print the names of professors with the names of the courses they teach (or have taught) outside of their department. Each row in the results must be distinct (i.e., a professor teaching the same course over multiple semesters should only appear once), but the results can be in any order.  Output should contain two columns: PROFESSOR.NAME, COURSE.NAME

Process: 
1. structure: professor name | course teach outside deparment 
2. each row must be distinct, same professor, same course but different semester should only appear once
3. professor name from professor table, course name from course table
4. join table professor, schedule, course to get the target column
5. make condition of deparment_id in course table <> department_id in professor table to elimite inside department teaching
6. because the repeat same course in different semester shows in schedual table, should put DISTINCT from the begining of SELECT statement.
*/


Solution:
SELECT DISTINCT p.name AS professor_name, c.name AS course_name
FROM professor p
  	  JOIN schedule s ON s.professor_id = p.id
      JOIN course c ON s.course_id = c.id
WHERE c.department_id <> p.department_id
;


/*
Schema:
PROFESSOR
Name	            Type	  Description
ID	            Integer	  A professor's ID in the inclusive range [1, 1000]. This is a primary key.
NAME	          String	  A professor's name. This field contains between 1 and 100 characters (inclusive).
DEPARTMENT_ID	  Integer	  A professor's department ID. This is a foreign key to DEPARTMENT.ID.
SALARY	        Integer	  A professor's salary in the inclusive range [5000, 40000].

DEPARTMENT
DEPARTMENT
Name	            Type	    Description
ID	             Integer	A department ID in the inclusive range [1, 1000]. This is a primary key.
NAME	           String 	A department name. This field contains between 1 and 100 characters (inclusive).

COURSE
Name	            Type	    Description
ID	            Integer	  A course ID in the inclusive range [1, 1000]. This is a primary key.
NAME	          String	  A course name. This field contains between 1 and 100 characters (inclusive).
DEPARTMENT_ID	  Integer	  A course's department ID. This is a foreign key to DEPARTMENT.ID.
CREDITS	        Integer	  The number of credits allocated to the course in the inclusive range [1, 10].


SCHEDULE
Name	            Type	    Description
PROFESSOR_ID	  Integer	  The ID of the professor teaching the course. This is a foreign key to PROFESSOR.ID.
COURSE_ID	      Integer	  The course's ID number. This is a foreign key to COURSE.ID.
SEMESTER	      Integer	  A semester ID in the inclusive range [1, 6].
YEAR	          Integer	  A calendar year in the inclusive range [2000, 2017].

*/
