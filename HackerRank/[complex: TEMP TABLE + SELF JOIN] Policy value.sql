/*
Problem: Write a query to print the sum of all total investment values in 2015 (TIV_2012) toa scale of 2 decimal places, for all policyholders who meet the following criteria:

1) Have the same TIV_2011 value as one or more other policyholders.
2) Are not located in the same city as another policy holder (i.e. (latitude, longitude) attribute pair must be unique,

the input format is like this , The table is
Insurance table is described as follows:

Column Name     Type 
PID           INTEGER 
TIV_2011      NUMERIC 
TIV_2012      NUMERIC 
LAT           NUMERIC 
LON           NUMERIC

where PID is the policyholder's policy ID, TIV_2011 is the total investment in 2011,TIV_2012 is the total investment in 2012, LAT is the latitude of the policy holder's city and LON is the longitude of the policy holder's city.

For example if thhe data is PID, TIV_2011, TIV_2012, lat, lon
1, 300, 400.5, 60, 70

2, 300, 500.7, 70, 80

3, 400, 400, 60, 90

4, 500, 600, 80, 80

5, 400, 300.1, 6, 6

The answer would be 1601.30. Sum of (300.1, 400, 500.7, 400.5)


Process:
1. the problem is: Write a query to print the sum of all total investment values in 2015 (TIV_2012) toa scale of 2 decimal places.
2. there are two more condtions 
    #1 Have the same TIV_2011 value as one or more other policyholders.
    #2 Are not located in the same city as another policy holder (i.e. (latitude, longitude) attribute pair must be unique
3. To meet the #1 condition, we need another temp table with this condition met:
    t2: SELECT TIV_2011 FROM insurance GROUP BY TIV_2011 HAVING COUNT(*) > 1 -- this means same TIV_2011 after group by then if count(*) > 1 then there is one or more other policiholders that have the same TIV_2011 value (not sure about if it needs >= 1)
4. To meed the #2 condition, we need another temp talbe with this condition met:
    t3: SELECT lat, lon FROM insurance GROUP BY lat, lon HAVING COUNT(*) = 1 -- this means when retrieving only lat, lon value and group by like distinct retreiving, if count(* = 1, then the pair is unique)
5. after settling down two conditions. we can safely create SELECT sum(t1.TIV_2012), and adjust decimal point by using CAST(# AS DECIMAL(10,2)) FROM insurance t1


*/

Solution:
SELECT CAST(SUM(t1.TIV_2012) as DECIMAL(10,2))
FROM Insurance t1
INNER JOIN
(
    SELECT TIV_2011
    FROM Insurance
    GROUP BY TIV_2011
    HAVING COUNT(*) > 1
) t2
    ON t1.TIV_2011 = t2.TIV_2011
INNER JOIN
(
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
) t3
    ON t1.lat = t3.lat AND
       t1.lon = t3.lon
       

Thinking of the context:

