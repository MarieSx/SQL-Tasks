JOIN
<https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true>

QUESTION:
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

STEPS:
#1 join to make temp tables with col: id,name,friend_id,salary_for_id, salary_for_friend_id
#2 select from #1 add conditioning salary2 > salary1
#3 Combine


SELECT s.name
FROM (students s JOIN friends f USING(ID) /*USING becuase s has id,name; f has id,friends_id, and friends_id sometimes are same with id, so hard to match both*/
     JOIN packages p1 ON s.id = p1.id
     JOIN packages p2 ON p2.id = f.friend_id)
WHERE p2.salary > p1.salary
ORDER BY p2.salary
