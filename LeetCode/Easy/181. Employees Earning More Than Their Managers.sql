-- MySQL query statement below

SELECT
    a.Name AS 'Employee'
FROM
    Employee AS a,
    Employee AS b
WHERE
    a.ManagerId = b.Id
        AND a.Salary > b.Salary
;

-- process ManagerId shows which Id is both employee and manager
-- need to self join
-- a.Id | a.Name | a.Salary | a.ManagerId | b.Id | b.Name | b.Salary | b.ManagerId 
-- match a.ManagerId = b.Id
-- so b.Salary shows salary based on a.ManagerId
-- when a.Salary > b.Salary means this employee earns higher than his manager
-- select a.Name 
