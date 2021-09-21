SELF JOIN
<https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true>

QUESTIONS:
You are given a table, Functions, containing two columns: X and Y.
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.


STEPS:

SELECT f1.X, f1.Y 
FROM Functions f1
INNER JOIN Functions f2 ON f1.X=f2.Y AND f1.Y=f2.X /*find symmetric pairs*/
GROUP BY f1.X, f1.Y /*eliminate duplicate pair*/
HAVING COUNT(f1.X)>1 or f1.X<f1.Y
ORDER BY f1.X 
