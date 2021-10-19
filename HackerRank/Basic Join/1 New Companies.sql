INNER JOIN ... ON ... GROUP BY (full group by required)
<https://www.hackerrank.com/challenges/the-company/problem?h_r=next-challenge&h_v=zen&isFullScreen=false>

SELECT 
    c.company_code, c.founder, 
    count(DISTINCT lm.lead_manager_code) total_lead_manager_code, 
    count(DISTINCT sm.senior_manager_code) total_senior_manager,
    count(DISTINCT mn.manager_code) total_manager, 
    count(DISTINCT ep.employee_code) total_employee
FROM Company c JOIN Lead_Manager lm ON c.company_code = lm.company_code
JOIN Senior_Manager sm ON sm.company_code = lm.company_code
JOIN Manager mn ON mn.company_code = sm.company_code 
JOIN Employee ep ON ep.company_code = mn.company_code
GROUP BY  c.company_code, c.founder

ORDER BY c.company_code asc;

OUTPUT:

C1 Angela 1 2 5 13 
C10 Earl 1 1 2 3 
C100 Aaron 1 2 4 10 
C11 Robert 1 1 1 1 
C12 Amy 1 2 6 14 
C13 Pamela 1 2 5 14 
C14 Maria 1 1 3 5 
C15 Joe 1 1 2 3 
C16 Linda 1 1 3 5 
C17 Melissa 1 2 3 7 
C18 Carol 1 2 5 6 
C19 Paula 1 2 4 7 
C2 Frank 1 1 1 3 
C20 Marilyn 1 1 2 2 
C21 Jennifer 1 1 3 7 
C22 Harry 1 1 3 6 
C23 David 1 1 1 2 
C24 Julia 1 1 2 6 
C25 Kevin 1 1 2 5 
C26 Paul 1 1 1 3 
C27 James 1 1 1 3 
C28 Kelly 1 2 5 9 
....
