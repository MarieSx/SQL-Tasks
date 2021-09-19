JOIN & SUBQUERY
<https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen>

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

SELECT 
    w.id, p.age, w.coins_needed, w.power 
FROM Wands AS w 
JOIN Wands_Property AS p 
    ON (w.code = p.code) 
WHERE p.is_evil = 0 
AND w.coins_needed = (SELECT MIN(coins_needed) 
                        FROM Wands AS w1 join Wands_Property AS p1 ON (w1.code = p1.code)                          
                        WHERE w1.power = w.power AND p1.age = p.age) 
ORDER BY w.power DESC, p.age DESC

OUTPUT:

1038 496 4789 10 
1130 494 9439 10 
1315 492 4126 10 
9 491 7345 10 
858 483 4352 10 
1164 481 9831 10 
1288 464 4952 10 
861 462 8302 10 
....
