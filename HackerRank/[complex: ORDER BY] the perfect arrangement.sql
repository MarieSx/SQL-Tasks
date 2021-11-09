/*
Complex on ORDER BY 

Problem:
Information about customers is stored in the CUSTOMER table. Write a query to print the ID, FIRST_NAME, and LAST_NAMEs of the customers whose combined name length, i.e., the sum of the length of the FIRST_NAME and LAST_NAME, is less than 12. The IDs and names should be printed in the ascending order of the combined name length. If two or more customers have the same combined name length, sort the result in lexicographical order of the full names, ignoring case. If two or more customers have the same full name, sort those results by ID, ascending.


Process:
1. outcome structure: id | full name
2. to make full name, use concat(first_name, last_name)
3. to generate length, sue length(concat(first_name, last_name))   -- do not add ' ' space in between, as it is not counted as length of a name.
4. length < 12 is a condition
5. order rule has three run, 1st order by length, if length same, 2nd order by name (full name), if full name same, 3rd order by id. All of them in ASC

Context consider:
calculate the length of name might not be popular, but may useful when organising book code in a library. For example, in order to make the index clear and convenience to customers to find a book (they may remember the approximate length of a book name, or parts or the words, then this work would be useful)

e.g. let's organise books start with A letter, because we need to assign work flow for each day, we can organise names that within 5 words today. WE will ombine each name to get the length, make a condition for length () < 5. and order into three runs, like length min --> max, same length then name ASC, same name then id ASC (might because of different version or revise) 
*/

Solution:
SELECT id, CONCAT(first_name, ' ', last_name)
FROM customer
WHERE LENGTH(CONCAT(first_name, last_name)) < 12
ORDER LENGTH(CONCAT(first_name, last_name)), CONCAT(first_name, ' ', last_name), id
;
