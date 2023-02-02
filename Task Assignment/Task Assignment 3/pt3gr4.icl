module pt3gr4
import StdEnv

/*
    Given a list of lists of integers and a number , return a list of Boolean values
    If all numbers of the sublist are divisible by the number then return true
    else return false.

    Example:
    Input : [[3,6,9,12], [4,8,12], [5,10,15,20]] 3
    Output: [True, False, False]
    explanation: [3,6,9,12] are all divisible by 3, [4,8,12] are not, [5,10,15,20] are not
*/
div::[Int] Int -> [Bool]
div [] n = []
div[x:xs] n
| x rem n == 0 = [True] ++ div xs n
= [False]



PTfun  :: [[Int]] Int -> [Bool]
PTfun [] n = []
PTfun [x:xs] n
| and(div x n) == True = [True] ++ PTfun xs n
= [False] ++ PTfun xs n


Start = PTfun [[3,6,9,12], [4,8,12], [5,10,15,20]] 3 // [True, False, False]
//Start = PTfun [[3,6,9,12], [4,8,12], [5,10,15,20]] 4 // [False, True, False]
//Start = PTfun [[1,4,2,3],[],[3,6,2,4]] // [False, False, False]
//Start = PTfun [] 2 // []
//Start = PTfun [] 0 // []
