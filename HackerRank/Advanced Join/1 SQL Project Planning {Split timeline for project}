HOW TO SPLIT TIMELINE
<https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true>

STEPS:
/*#1 Write outline*/
SELECT Start_Date, [?]
FROM [some start_dates is not equal to any end_dates as if equal, then it belongs to somewhere the same project],
     [some end dates not equal to any start_date, to make sure the two direction logic]
WHERE start_date < end_date /*make sure the time sequence of any project*/
GROUP BY start_date /* as required*/
ORDER BY datediff(start_date, [the closest end date])) DESC, start_date

/*#2 Write the confrmation part after FROM*/
FROM (SELECT start_date FROM Projects WHERE start_date NOT IN (SELECT end_date FROM Projects)) AS a, 
     (SELECT end_date FROM Projects WHERE end_date NOT IN (SELECT start_date FROM Projects)) AS b

/*#3 Fill all blank */
SELECT start_date, MIN(end_date)
FROM (SELECT start_date FROM Projects WHERE start_date NOT IN (SELECT end_date FROM Projects)) AS a, 
     (SELECT end_date FROM Projects WHERE end_date NOT IN (SELECT start_date FROM Projects)) AS b
WHERE start_date < end_date
GROUP BY start_date
ORDER BY datediff(start_date, MIN(end_date)) DESC, start_date
;



