module pt4gr4
import StdEnv


/*
Write a function that takes a list of lists of integers and for every
sublist keeps only the odd elements in the sublist.

For example:
Input: [[1,2,3],[4,5,6],[7,8,9]]
Output: [[1,3],[4,6],[7,9]]



*****Your Function shouldn't use recursion and must use atleast two higher order functionsl*****

**Helper functions are allowed but shouldnt be recursive**

**partial marks will be given based on the number of requirements satisfied , but the function must compile**
*/
//After i asked the teacher she said we should keep only the odd numbers, thus this is the solution

PTfun :: [[Int]] -> [[Int]]
PTfun list = map (\x = filter isOdd x ) list


//Start = PTfun [[1,2,3],[4,5,6],[7,8,9]] // [[1,3],[4,6],[7,9]]
//Start = PTfun [[13,12,8,9],[44,35,72],[57,82,21,44],[31,66]] // [[13,9],[35],[57,21],[31]] 
//Start = PTfun [[2,4,6] ,[4,6,8]] // []
//Start = [] // []