/*
Problem: You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
![image](https://user-images.githubusercontent.com/89245931/140915975-7667848c-ffc6-4cbf-a7e1-05d6f80605c8.png)

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
Binary tree explanation image:
![image](https://user-images.githubusercontent.com/89245931/140916042-319c895d-67c9-4090-894e-449122ef19a9.png)


Process:
1. to decide which node type they are, it needs case when
2. as n is child, and p is parent. If there is no p, then n is a ROOT
  CASE WHEN p IS NULL THEN CONCAT(N, ' ROOT')
3. if n is in the middle, which means there are both root upside and leaf downside, then it is a INNER
  WHEN n IN (SELECT DISTINCT p FROM bst) THEN CONCAT(n, ' INNER')   -- using DISTINCT to justify if any of the number satisfied, if no distinct, it reduces the speed
4. if n has a p value, not ROOT, meanwhile, this n is not in any of the p value, then it is a new value with not root and not behave as a parent = no children, so it is a leaf.
  ELSE CONCAT(n, ' Leaf')
  END


Thinking about the context:
in the real life case, I believe there might be like a case to calculate subsidaries or parent company, or ingredience that belongs to a parent category or it is a new one etc.

*/


Solution:
SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root')
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
    ELSE CONCAT(N, ' Leaf')
    END
FROM BST
ORDER BY N ASC


