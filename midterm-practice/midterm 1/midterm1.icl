module midterm1
import StdEnv

// Please fill the data required below.
//<Ammar Yildirim>
//<fa27qm>
//Functional Programming & mid-term
//2021.September.14 
//This solution was submitted and prepared by <Name, Neptun_code> for the mid-term assignment of the Functional Programming course.
//I declare that this solution is my own work.
//I have not copied or used third party solutions.
//I have not passed my solution to my classmates, neither  made it public.
//Students� regulation of E�tv�s Lor�nd University (ELTE Regulations Vol. II. 74/C.) 
//states that as long as a student presents another student�s work - 
//or at least the significant part of it - as his/her own performance, it will count as a disciplinary fault. 
//The most serious consequence of a disciplinary fault can be dismissal of the student from the University.



/*1. List ends
 Given a list of lists, append to the end of every sublist 
 the sum and the length of the sublist
*/
sumof :: [Int] -> Int
sumof x = sum x
// or you can use foldr

append :: [[Int]] -> [[Int]]
//append x = map (\x = x++[sumof x]++[length x]) x
append x = [a++[sum a]++[length a]\\a <-x] 


//Start = append [[1..5],[1..4],[],[5,6]]  // [[1,2,3,4,5,15,5],[1,2,3,4,10,4],[0,0],[5,6,11,2]]
//Start = append [[(-1),(-2)..(-10)],[12],[5]]  // [[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-55,10],[12,12,1],[5,5,1]]
//Start = append []  // []

/* 2. Fractions
 
 Given a list of real numbers, keep only the fraction part of the number
*/


keeper :: Real -> Real
//keeper x
//| x < 1.0 = x
//= keeper (x - 1.00)
keeper x 
| toReal(toInt(x)) > x = x - toReal(toInt(x)-1) 
= x - toReal(toInt(x)) 

fraction :: [Real] -> [Real]
fraction x = map (\x = keeper x) x


//Start = fraction [1.2,1.5,0.6] //[0.2,0.5,0.6]
//Start = fraction [1.25, 8.2115548896, 53.21,45.58,0.005] //[0.25,0.2115548896,0.21,0.58,0.00005]
//Start = fraction [] // []


/*3. Famous nums

 Given a list of integers, write a function which gets rid of the numbers that is occurring
 less than 5 times in the list.
*/
//This prints me the amount of times a number occurs in a list
helper :: Int [Int] Int -> Int
helper num [] counter = counter
helper num [x:xs] counter 
| num == x = helper num xs (counter+1)
= helper num xs counter

//Start = helper 1 [1,1,1,1] 0

famousNum :: [Int] -> [Int]
famousNum [] = []
//famousNum [x:xs] = filter (\x=(helper x [x:xs] 0)>5) [x:xs]

famousNum  [x:xs] = [a \\ a<- [x:xs] | (helper a [x:xs] 0)>=5  ]


//Start = famousNum [1,1,1,1,1,1,2,3,4,4,4,4,5,5,5,5,5] // [1,1,1,1,1,1,5,5,5,5,5]
//Start = famousNum [] // []
//Start = famousNum [1,2,3,4,5,6,1,1,1,2,2,2,2,1,1,5,10,3] // [1,2,1,1,1,2,2,2,2,1,1]




/*4. Search
 
 Implement a search algorithm that searches through a list for Int n and returns the value in the list before n. 
 If there is no value, or the list is empty, return -1. e.g., findPrev 5 [1,2,3,4,5,6] should return 4, 
 while findPrev 5 [0, 10, 20, 30] returns -1.
*/

//findPrev :: Int [Int] -> Int 
findPrev num [] = -1
findPrev num [x] = -1 
findPrev num [x,y:xs]
| num == y = x
= findPrev num [y:xs] 
 

//Start = findPrev 5 [1,2,3,4,5,6] // 4
//Start = findPrev 1 [1,2,3,4,5,6] // -1
//Start = findPrev 1 [] // -1 

 

/* 5. Symmetric difference 

 Given two lists of integer numbers , return a sorted list containing the symmetric difference of the two lists; 
 The symmetric difference of two lists A and B is the list (A � B) U (B � A); 
 where A - B is The difference of two lists  defined as follows:  
 The List A-B consists of elements that are in A but not in B.
 And (U) the union of two lists is a list containing all the elements of A and B without duplicates 
*/

/*
remDuplicate :: Int [Int] -> [Int]
remDuplicate num [] = []
remDuplicate num x = filter (\x= x<>2) x
*/

exists :: Int [Int] -> Bool
exists num [] = False
exists num [x:xs]
| num == x = True
= exists num xs

//symmetricDif :: [Int] [Int] -> [Int]
//symmetricDif a b = filter(\x = ((exists x a)&&(exists x b) )== False) (a++b)	//allows me to check for both lists 

/*
List comprehension OP
symmetricDif :: [Int] [Int] -> [Int]
symmetricDif x a = [num \\ num<-x | not(isMember num a)] ++  [num \\ num<-a | not(isMember num x) ] 
*/



//Start = symmetricDif  [1,2,3,4,5] [2,4,6] //  [1,3,5,6]
//Start = symmetricDif  [1..5] [1..10] // [6,7,8,9,10]
//Start = symmetricDif  [1..5] [] // [1,2,3,4,5]



/*6. Not N

 Given a list of integers and an integer N, 
 eliminate from the list elements that are positioned before N in the list and are not equal to N,
 then compute the biquadrate of the numbers left in the list.
*/


notN :: Int [Int] -> [Int]
notN num [x:xs] = map (\x=x^4) (takeWhile (\x=num<>x) [x:xs])


//Start = notN 3 [1..5] // [1,16]
//Start = notN [] // []
//Start = notN 6 [10,8..1] // [10000,4096]




/* 7.  Gap2 continued 

 Given a list of numbers, return True if the  
 the difference between two consecutive elements is always 2
 otherwise return False
*/

consec :: [Int]-> Bool
consec [] = False
consec [x] = True
consec [x,y:xs] 
|(y-x) == 2 = True && consec [y:xs]
= False

//Start = consec [1,3..11]

//gap2C :: [Int] -> Bool
//gap2C x = map 


//Start = gap2C [1,3,5,7] // True
//Start = gap2C [1,3,5,7,9,11,13,15] // True
//Start = gap2C [1,5,8] // False
//Start = gap2C [] // False




/* 8. Good Lists
 Given the list of lists and a list of unique numbers. 
 Numbers that are given in this second unique number list are considered to be good numbers. 
 A List is considered good if at least half of its numbers are good. Count how many good lists 
 are in the given list of lists.

 Ex. If you are given [[1,2,3], [1,3,3,4,9,6], [3..6]]  and [1,2,3], good numbers are 1, 2 and 3. 
 First list [1,2,3] has 3 good numbers out of total 3 numbers, hence it is good. 
 Next one [1,3,3,4,9,6] has 3 good numbers (1,3,3) which is half of total length, hence it is a good one as well.
 Last list [3..6] has only one good number and is not a good list. Therefore, answer for this example is 2.
*/


trr :: [Int] [Int] -> [Int]
trr x y = [num \\ num <-x | isMember num y]


goodLists :: [[Int]] [Int] -> Int
goodLists [] good = 0
goodLists [x:xs] good
| length(trr x good) >= (length x)/2 = 1 + goodLists xs good
= goodLists xs good


Start = goodLists [[1,2,3], [1..6], [3..6]] [1,2,3] // 2











/*

trr :: [Int] [Int] -> Bool
trr x a = length[n \\ n<-a | isMember n x] >= (length x/2)
*/
/*
removeDup :: [Int] -> [Int]
removeDup [] = []
removeDup [x:xs] = [x: removeDup (filter (\a = a <>x) xs)]

goodOne :: [Int] [Int] -> Bool
goodOne x y = (length(removeDup(filter (\a = (exists a x)&&(exists a y)) (x++y))) )>= (length x/2)
*/
/*
goodLists : : [[Int]] [Int] -> Int
goodLists [] y = 0
goodLists [x:xs] y
| trr x y = 1 + goodLists xs y
= goodLists xs y
*/

//Start = goodLists [[1,2,3], [1..6], [3..6]] [1,2,3] // 2
//Start = goodLists [[1], [1..6], [3,8,5]] [1,2,3,8] // 3
// Start = goodLists [[], [3,2,5], [1,1,2,2]] [1] // 2
// Start = goodLists [] [1,2,3] // 0


/*9. CoPrimes
 Given 2 numbers, check if they are co-prime.
 Numbers are called co-prime if they do not have
 common divisor.
*/

coPrimes :: Int Int -> Bool
coPrimes x y 
| gcd 12 9 == 1 = True
= False


//Start = coPrimes 12 9 // False
// Start = coPrimes 12 12 // False
// Start = coPrimes 12 13 // True
// Start = coPrimes 5 7 // True


/* 10. Clean Sequence
 The Clean sequence is defined in following way:
 s(0) = a
 s(1) = b
 s(2) = c
 and for every k greater than 2:
 s(k) = ( s(k-1)*s(k-2) + s(k-3) ) rem 1000
 
 Given n, a, b and c - generate first n numbers from Clean sequence.
*/

/*
clean :: Int Int Int Int -> [Int]
clean 0 a b c = [a]
clean 1 a b c = [b]
clean 2 a b c = [c]
clean n a b c
= [valuecalc n a b c : clean (n-1) a b c]
*/

//Start = clean 5 1 2 3 // [1,2,3,5,11]
//Start = clean 11 123 79 3 // [123,79,3,720,957,117,157,126,495,277,647]
//Start = clean 2 1 2 3 // [1,2]
// Start = clean 1 1 2 3 // [1]


