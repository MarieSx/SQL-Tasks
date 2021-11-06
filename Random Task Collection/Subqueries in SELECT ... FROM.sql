TASK:
Assign employee number 110022 as a manager to all employees from 10001 to 10020, and employee number 110039 as a manager to all employees from 10021 to 10040.

SOURCE: 365 Data Science
https://learn.365datascience.com/courses/sql/sql-subqueries-nested-in-select-and-from/

Dialect: 
MySQL

Thinking process:
1. 10001 to 10020 would be subset A with a manger 110022.
2. 10021 to 10040 would be subset B with a manger 110039.
3. UNION subset A and subset B. Schema: ![image](https://user-images.githubusercontent.com/89245931/140590497-a2932e8e-aeab-4a27-9379-acc07d091cfe.png)
4. Start from innermost query: 
  SELECT 
	  emp_no
  FROM 
	  dept_manager
  WHERE 
	  emp_no = 110022;
    
5. Add outer (take the minimum value bacuse more than one department could be associated with an employee, and by using MIN we will ensure we place only one value corresponding to an employee number) 
THIS IS SUBSET A:

    SELECT 
        e.emp_no AS employee_ID,
        MIN(de.dept_no) AS department_code,
        (SELECT 
               emp_no
            FROM
                dept_manager
            WHERE
                emp_no = 110022) AS manager_ID
    FROM
       employees e
            JOIN
       dept_emp de ON e.emp_no = de.emp_no
    WHERE
       e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no;
    
OUTPUT example:
10001	d005	110022
10002	d007	110022
10003	d004	110022
10004	d004	110022
10005	d003	110022
10006	d005	110022
    
6. Add parenthesis and rename as SUBSET A:
    (SELECT 
        e.emp_no AS employee_ID,
        MIN(de.dept_no) AS department_code,
        (SELECT 
               emp_no
            FROM
                dept_manager
            WHERE
                emp_no = 110022) AS manager_ID
    FROM
       employees e
            JOIN
       dept_emp de ON e.emp_no = de.emp_no
    WHERE
       e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS subset A;
    
7. Select everything from subset A:
SELECT 
    A.* 
FROM (SELECT 
        e.emp_no AS employee_ID,
        MIN(de.dept_no) AS department_code,
        (SELECT 
               emp_no
            FROM
                dept_manager
            WHERE
                emp_no = 110022) AS manager_ID
    FROM
       employees e
            JOIN
       dept_emp de ON e.emp_no = de.emp_no
    WHERE
       e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS subset A;
    
8. copy & create subset B by change emp_no and add limit, then UNION:
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
UNION 
SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;

