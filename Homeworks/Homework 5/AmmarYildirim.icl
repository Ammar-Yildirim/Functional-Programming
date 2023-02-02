module HW5
import StdEnv

/*
Rename the file as YourNameHW5.icl
You can make as many functions as you want but the second and third task shouldnt use any function with recursion.
The first function can use recursion.
*/

/////////Task 1///////// 

/*
write a function that takes three lists , where first list contains names of students, second list contains their grades and third list contains their ages.
The function should return a list of tuples, where each tuple contains name, grade and age of a student.
If the lists are of unequal length, the data upto the length of the shortest list should be returned.
*/


ZipData :: [String] [Int] [Int] -> [(String, Int, Int)]
ZipData names grades ages = [(name,grade,age) \\ name<-names & grade<-grades & age<-ages ]


//Start = ZipData ["John", "Jane", "Jack"] [90, 80, 70] [20, 21, 22] // [("John",90,20),("Jane",80,21),("Jack",70,22)]
//Start = ZipData ["John", "Jane", "Jack"] [90, 80, 70] [20, 21] // [("John",90,20),("Jane",80,21)]

/*
Write another function that takes the list of tuples returned by the above function and creates
a new list of tuples having four elements Name,grade,age and funscore
funscore is calculated as : (grade * 100) / age
****You Should Not use Recursion for this Problem****

*/

AuxData :: [(String, Int, Int)] -> [(String, Int, Int, Int)]
AuxData lists = [(fst3 list,snd3 list,thd3 list,((snd3 list)*100/(thd3 list))) \\ list<-lists]

/*
The School wants to Award Students who's funscore is more than 350.

Write the Award Function that takes the three lists and returns a list of names of students who are awarded.

****You Should Not use Recursion for this Problem****
***You Should Use the functions defined above***
*/

AwardStudents :: [String] [Int] [Int] -> [String]
AwardStudents names grades ages = map (\(x,t,z,s) = x) (filter (\(name,grade,age,fun) = fun>350)(AuxData (ZipData names grades ages)))

/*Extra : Instead of 3 functions combined, we couldve written everything in one function*/
//AwardStudents names grades ages = [name \\ name<-names & grade<-grades & age<-ages | grade*100/age > 350]



//Start = AwardStudents ["John", "Jane", "Jack"] [90, 80, 70] [20, 21, 22] // ["John","Jane"]
//Start = AwardStudents ["John", "Jane", "Jack","Peter"] [90, 80, 70] [20, 21] // ["John","Jane"]


