module HW4
import StdEnv

/*
write a function that takes a matrix as list of lists and returns the transpose of the matrix
eg :
Input : [[1,2,3],
         [4,5,6],
         [7,8,9]]
Output : [[1,4,7],
          [2,5,8],
          [3,6,9]]
If there is an empty list or a list of different length, return an empty list

***Needs to use atleast one higher order function***
*/

header :: [a] [a] [a] -> [(a,a,a)]
header x y z = [ (x,y,z) \\ x<-x & y<-y & z<-z]

splitter :: [(a,a,a)] -> [a]
splitter [(x,y,z)] = [x,y,z]

funTran :: [[a]] -> [[a]]
funTran [] = []
funTran [x,y,z:xs] = map (\(x,y,z) = splitter[(x,y,z)]) (header x y z)

//Start = funTran [[1,2,3],[4,5,6],[7,8,9]] // [[1,4,7],[2,5,8],[3,6,9]]
//Start = funTran [[1,2],[3,4],[5,6]] // [[1,3,5],[2,4,6]]
//Start = funTran [['a','b','c'],['d','e','f'],['g','h','i']] // [['a','d','g'],['b','e','h'],['c','f','i']]


/*
Write a function that takes two matrices and returns the sum of the two matrices
If the matrices are not of the same order, return an error message
eg :
Input : [[1,2,3],     [[1,2,3],
         [4,5,6],      [4,5,6],
         [7,8,9]]      [7,8,9]]
Output : [[2,4,6],
          [8,10,12],
          [14,16,18]]
Needs to use atleast one higher order function
*/

adder :: [[Int]] [[Int]] -> [([Int],[Int])]
adder [] [] = []
adder [x:xs] [y:ys] = [(x,y): adder xs ys] 

sumer :: [Int] [Int] -> [Int]
sumer x [] = abort "Error"
sumer [] y = abort "Error"
sumer x y = [a+b \\ a<-x & b<-y]

funSum :: [[Int]] [[Int]] -> [[Int]]
funSum x y 
| length x <> length y = abort "Error"
= map (\ (x,y) = sumer x y) (adder x y) 


//Start = funSum [[1,2,3],[4,5,6],[7,8,9]] [[1,2,3],[4,5,6],[7,8,9]] // [[2,4,6],[8,10,12],[14,16,18]]
//Start = funSum [[1,2],[3,4],[5,6]] [[1,2],[3,4],[5,6]] // [[2,4],[6,8],[10,12]]
//Start = funSum [[1,2],[3,4],[5,6]] [[1,2],[3,4]] // Error
//Start = funSum [[],[1,3]] [[1,2],[4,5]] // Error






