module ex8_todo
import StdEnv


/**1 Write a function, that takes a list of functions, 
 and a list of tuples (Int, Int) where the first
 Int indicates which function to use and the 
 second Int acts as a parameter and returns a list of the results.

For example: Router [isEven,isOdd] [(1,2),(2,4),(1,57)] = [True, False, False] */


//Router :: [(a->b)] [(Int,a)] -> [b]
Router [] = []
Router a [] = []
  

//Start = Router [isEven,isOdd] [(1,2),(2,4),(1,57)] //[True, False, False]
//Start = Router [((+)1),((*)2),((^)2),((rem) 100)] [(4,13),(2,23),(3,5),(1,1336),(4,23)] //[9,46,32,1337,8]
//Start = Router [(\ x = [1..x]),(\ x = [n \\ n<-[1..x] | x rem n ==0]),(\ x = [x,x*2..x*10])] [(2,36),(1,13),(3,5),(2,128),(3,1)] //[[1,2,3,4,6,9,12,18,36],[1,2,3,4,5,6,7,8,9,10,11,12,13],[5,10,15,20,25,30,35,40,45,50],[1,2,4,8,16,32,64,128],[1,2,3,4,5,6,7,8,9,10]]
//Start = Router [] [(4,13),(2,23),(3,5),(1,1336),(4,23)] //[]
//Start = Router [isEven,isOdd] [] //[]   



/**2 Write a function that takes a list of integers and returns a list 
of result integers based on how many integers were in the parameter list.

For 1 integer ‘a’, it will return that integer modulus 2. (a rem 2)

For 2 integers ‘a’,‘b’ , it will return a list of all integers from the first 
to the second. [a..b]

For 3 integers ‘a’,‘b’,‘c’ , it will return (a*(b^c))

For 4 integers ‘a’,‘b’,‘c’,‘d’, it will return a list of the sum of 
‘a’ and ‘b’ and the sum of ‘c’ and ‘d’. */


//Listing :: [Int] -> [Int]

//Start = Listing [5] //[1]
//Start = Listing [4,10] //[4,5,6,7,8,9,10]
//Start = Listing [3,5,2] //[75]
//Start = Listing [13,29,1030,307] //[42,1337]
//Start = Listing [] //[]



/**3 Write a function that checks if a list of numbers is odd,even,odd,even…

For exmaple: SeqCheck [1,2,3,4,6] = False because 4 is even, but 6 is not odd. */


//SeqCheck :: [Int] -> Bool

//Start = SeqCheck [1..10] //True
//Start = SeqCheck [1,2,3] //True
//Start = SeqCheck [2,3,4] //False
//Start = SeqCheck [1,3,4,5] //False
//Start = SeqCheck [1,2,3,4,6,7] //False
//Start = SeqCheck [] //False



/**4 Write a function that checks if each elements in the list appear even times.

For example, checkEven [1,1,2,2,2,2,3,5,3,5] = True */


//checkEven :: [Int] -> Bool

//Start= checkEven [1,1,2,2,2,2,3,5,3,5] // True
//Start = checkEven [1,1,2,2,1] // False
//Start = checkEven [] //False



/**5 Write a function that takes two vectors, represented as lists,
 and returns their dot product.

The dot product of two vectors can be computed as: 
< xa, xb, xc, …> * < ya, yb, yc, …> = (xa*ya) + (xb*yb) + (xc*yc) + …

For example: DotProd [4,6,3] [6,3,7] = 24+18+21 = 63 */


//DotProd :: [Int] [Int] -> Int

//Start = DotProd [4,6,3] [6,3,7] //63
//Start = DotProd [6,3,7] [4,6,3] //63
//Start = DotProd [5,2,6,8,3] [5,-8,5,-3,-5] //0



/**6 Given a list of characters, split it into a tuple in which the first part
 only contains digits (‘0’..’9’), the second part contains the rest. */
 
//TwoLists :: [Char] -> ([Char], [Char])

//Start = TwoLists ['1', 'a', '2', 'b', '3'] //([‘1’,‘2’,‘3’],[‘a’,‘b’])
//Start = TwoLists [] //([],[])



/**7 Given a list of lists, for each list, extract the first, middle and last element. */
//middle :: [Int] -> Int

//Points3 :: [[Int]] -> [(Int, Int, Int)]

//Start = Points3 [[1..9], [], [3..11], [1..10]] // [(1,5,9),(2,4,6),(3,7,11),(1,6,10)]
//Start = Points3 [[]] //[]



/**8 Find the ‘unique’ right triangle in the list eg. (3,4,5) and (4,3,5) are the same triangle,
 only one will appear in the answer list [(3,4,5),(4,3,5)] -> [(3,4,5)] */


//f8 :: [(Int,Int,Int)] -> [(Int,Int,Int)]

//Start = f8 [(3,4,5),(4,5,6),(4,5,3),(6,8,10),(10,5,8),(-3,4,5)] //[(3,4,5),(6,8,10)]
//Start = f8 [(1,1,1),(5,4,3),(3,4,5),(0,0,0)] //[(5,4,3)]



/**9 Use foldr to check if the square root of each integer in a list are all integers. */



//f9 :: [Int] -> Bool


//Start = f9 [] //True
//Start = f9 [4,16,9] //True
//Start = f9 [1,8] //False



/**10 Insert sum and product of elements as last element in every sublist of a list. */


//addSum :: [[Int]] -> [[Int]]

//Start = addSum [[1,2], [3,4,5], [6,5,9,7], [], [8]] //[[1,2,3],[3,4,5,12],[6,5,9,7,27],[0],[8,8]]


/*11. List ends
 Given a list of lists, append to the end of every sublist 
 the sum and the length of the sublist. */

//append :: [[Int]] -> [[Int]]


//Start = append1 [[1..5],[1..4],[],[5,6]]  // [[1,2,3,4,5,15,5],[1,2,3,4,10,4],[0,0],[5,6,11,2]]
//Start = append [[(-1),(-2)..(-10)],[12],[5]]  // [[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-55,10],[12,12,1],[5,5,1]]
//Start = append []  // []



/*12. Fractions
 
 Given a list of real numbers, keep only the fraction part of the numbers.
*/

//fraction :: [Real] -> [Real]

//Start = fraction [1.2,1.5,0.6,1.0] //[0.2,0.5,0.6,0]
//Start = fraction [1.25, 8.2115548896, 53.21,45.58,0.005] //[0.25,0.2115548896,0.21,0.58,0.00005]
//Start = fraction [] // []



/*13. Famous nums

 Given a list of integers, write a function which gets rid of the numbers that is occurring
 less than 5 times in the list.
*/

//occurs :: Int [Int] -> Int

//famousNum :: [Int] -> [Int]

//Start = famousNum [1,1,1,1,1,1,2,3,4,4,4,4,5,5,5,5,5] // [1,1,1,1,1,1,5,5,5,5,5]
//Start = famousNum [] // []
//Start = famousNum [1,2,3,4,5,6,1,1,1,2,2,2,2,1,1,5,10,3] // [1,2,1,1,1,2,2,2,2,1,1]



/*14. Search
 
 Implement a search algorithm that searches through a list for Int n and returns the value in the list before n. 
 If there is no value, or the list is empty, return -1. e.g., findPrev 5 [1,2,3,4,5,6] should return 4, 
 while findPrev 5 [0, 10, 20, 30] returns -1. If there are multiple of such element, consider the first.
*/

//findPrev :: Int [Int] -> Int

//Start = findPrev 5 [1,2,3,4,5,6] // 4
//Start = findPrev 1 [1,2,3,4,5,6] // -1
//Start = findPrev 1 [] // -1 

 

/*15. Symmetric difference 

 Given two lists of integer numbers , return a sorted list containing the symmetric difference of the two lists; 
 The symmetric difference of two lists A and B is the list (A – B) U (B – A); 
 where A - B is The difference of two lists  defined as follows:  
 The List A-B consists of elements that are in A but not in B.
 And (U) the union of two lists is a list containing all the elements of A and B without duplicates 
*/

//symmetricDif :: [Int] [Int] -> [Int]

//Start = symmetricDif  [1,2,3,4,5] [2,4,6] //  [1,3,5,6]
//Start = symmetricDif  [1..5] [1..10] // [6,7,8,9,10]
//Start = symmetricDif  [1..5] [] // [1,2,3,4,5]



/*16. Not N

 Given a list of integers and an integer N, 
 eliminate from the list elements that are positioned before N in the list and are not equal to N,
 then compute the biquadrate of the numbers left in the list.
*/

//notN :: Int [Int] -> [Int]

//Start = notN 3 [1..5] // [1,16]
//Start = notN 10 [] // []
//Start = notN 6 [10,8..1] // [10000,4096]



/*17.  Gap2 continued 

 Given a list of numbers, return True if the  
 the difference between two consecutive elements is always 2
 otherwise return False
*/

//gap2C :: [Int] -> Bool

//Start = gap2C [1,3,5,7] // True
//Start = gap2C [1,3,5,7,9,11,13,15,17] // True
//Start = gap2C [1,5,8] // False
//Start = gap2C [] // False



/*18. Good Lists
 Given the list of lists and a list of unique numbers. 
 Numbers that are given in this second unique number list are considered to be good numbers. 
 A List is considered good if at least half of its numbers are good. Count how many good lists 
 are in the given list of lists.

 Ex. If you are given [[1,2,3], [1,3,3,4,9,6], [3..6]]  and [1,2,3], good numbers are 1, 2 and 3. 
 First list [1,2,3] has 3 good numbers out of total 3 numbers, hence it is good. 
 Next one [1,3,3,4,9,6] has 3 good numbers (1,3,3) which is half of total length, hence it is a good one as well.
 Last list [3..6] has only one good number and is not a good list. Therefore, answer for this example is 2.
*/

//isGoodList :: [Int] [Int] -> Bool

//goodLists :: [[Int]] [Int] -> Int

//Start = goodLists [[1,2,3], [1..6], [3..6]] [1,2,3] // 2
//Start = goodLists [[1], [1..6], [3,8,5]] [1,2,3,8] // 3
//Start = goodLists [[], [3,2,5], [1,1,2,2]] [1] // 1
//Start = goodLists [] [1,2,3] // 0



/*19. CoPrimes
 Given 2 numbers, check if they are co-prime.
 Numbers are called co-prime if they do not have
 common divisor.
*/

//coPrimes :: Int Int -> Bool

//Start = coPrimes 12 9 // False
//Start = coPrimes 12 12 // False
//Start = coPrimes 12 13 // True
//Start = coPrimes 5 7 // True



/*20. Clean Sequence
 The Clean sequence is defined in following way:
 s(0) = a
 s(1) = b
 s(2) = c
 and for every k greater than 2:
 s(k) = ( s(k-1)*s(k-2) + s(k-3) ) rem 1000
 
 Given n, a, b and c - generate first n numbers from Clean sequence.
*/

//cl :: Int Int Int Int -> Int

//clean :: Int Int Int Int -> [Int]
 
//Start = clean 5 1 2 3 // [1,2,3,7,23]
//Start = clean 11 123 79 3 // [123,79,3,360,159,243,997,430,953,787,441]
//Start = clean 2 1 2 3 // [1,2]
//Start = clean 1 1 2 3 // [1]













