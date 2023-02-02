module midterm3

import StdEnv 


// Please fill the data required below.
//<Ammar Yildirim>
//<Fa27qm>
//Functional Programming & mid-term
//2021.September.14 
//This solution was submitted and prepared by <Name, Neptun_code> 
//for the mid-term assignment of the Functional Programming course.
//I declare that this solution is my own work.
//I have not copied or used third party solutions.
//I have not passed my solution to my classmates, neither made it public.
//Students’ regulation of Eotvos Lorand University 
//(ELTE Regulations Vol. II. 74/C.) 
//states that as long as a student presents another student’s work - 
//or at least the significant part of it - as his/her own performance, 
//it will count as a disciplinary fault. 
//The most serious consequence of a disciplinary fault can be 
//dismissal of the student from the University.


/* 1. Parasitic Number
 A Parasitic number (in base 10) is a positive number which can be multiplied 
 by a certain n by moving the rightmost digit of its decimal representation 
 to the front.
 e.g. 102564 × 4 = 410256
 Given a positive integer number and n, write a function to determine whether 
 it is a Parasitic number or not.
*/
toDigit :: Int -> [Int]
toDigit x
| x<10 = [x]
= toDigit(x/10) ++ [x rem 10]

parasitic :: Int Int -> Bool
parasitic no mult 
| toDigit(no * mult) == [last (toDigit(no))] ++ init(toDigit(no)) = True
=False

//Start = parasitic 102564 4 // True
//Start = parasitic 142857 5 // True
//Start = parasitic 714285 8 // False
//Start = parasitic 105263157894736842 2 // True


/* 2. Double Ones

 Given a list of integers, write a function which will keep only the numbers
 that contain at least two '1' digits. For example:
 [1,2,21,121,11,234131,111111,123,0,334] -> [121,11,234131,111111]
*/

oneChecker :: Int [Int] Int -> Int
oneChecker num [] accum = accum
oneChecker num [x:xs] accum
| num == x = oneChecker num xs (accum+1)
= oneChecker num xs accum

doubleOne :: [Int] -> [Int]
doubleOne x = [num \\ num<-x | (oneChecker 1 (toDigit(num))0)>=2  ]

// Start = doubleOne [1,2,21,121,11,234131,111111,123,0,334] // [121,11,234131,111111]
//Start = doubleOne [12,1,11,33] // [11]
//Start = doubleOne [11,111,21] // [11,111]
//Start = doubleOne [] // []
//Start = doubleOne [21,3,1] // []


/* 3. Multiples

 Given an n>0 integer value, write a function that creates the double, the triple
 and so on n-th multiple of the number.
*/

multiple :: Int -> [Int]
multiple x = [ x*num \\ x<-[x] , num<-[2..x] ]  

//Start = multiple 5 // [10,15,20,25]
//Start = multiple 2 // [2]
//Start = multiple 1 // []


/* 4. List difference
 
 Given two lists (A and B) containing sublists of integer numbers, 
 both A and B are of the same length,
 for every sublist in A and B, return the difference of the two sublists.  

 The difference is defined as follows:  
 The List L1-L2 consists of elements that are in L1 but not in L2. 
 For example if L1=[1,2,3] and L2=[3,5], then L1-L2=[1,2].
*/
/*
Checks for one list against one
cheq :: [Int] [Int] -> [Int]
cheq x y = [num \\ num<-x  | (isMember num x) && not(isMember num y)]
*/


difference :: [[Int]] [[Int]] -> [[Int]] 
difference [] [] = []
difference [x:xs] [y:ys] = [[num \\ num<-x  | (isMember num x) && not(isMember num y)] : difference xs ys]

//Start = difference [[1..5]] [[4..7]] // [[1,2,3]]
//Start = difference [[1..10] , [10..15] , [1..4]] [[1..10] , [11..20] , [5]] // [[],[10],[1,2,3,4]]
//Start = difference [] [] // [] 

 
/* 5. Replace middle

 Given a list of lists of integers and an integer, write a function that replaces 
 the middle element with the given integer in every sublist. 
*/

oneMid :: [Int] Int -> [Int]
oneMid [] x = [x]
oneMid list x = take ((length list)/2) list ++ [x] ++ drop (((length list)/2)+1) list

repMid :: [[Int]] Int -> [[Int]]
repMid x num = map (\x = oneMid x num) x

//Start = repMid [[1,2,3],[1..4]] 10 // [[1,10,3],[1,2,10,4]]
//Start = repMid [[1..6], [9,8..1], [(-1),(-2)..(-10)]] 5 
          // [[1,2,3,5,5,6],[9,8,7,6,5,4,3,2,1],[-1,-2,-3,-4,-5,5,-7,-8,-9,-10]]
//Start = repMid [[1,3],[]] 5 // [[1,5],[5]]


/* 6. Primes7

 Given a list of numbers, keep only the prime numbers that end with the digit 7
*/
/*
isPrime :: Int Int -> Bool 
isPrime x 0 = False
isPrime x 1 = True
isPrime x n
| x rem n == 0 = False
= isPrime x (n-1)

// X REM 0 GIVES OFF ERROR!!!!

lastDigit :: Int -> Int
lastDigit x 
| x<0 = x
= x rem 10 

primes7 :: [Int] -> [Int]
primes7 [] = []
primes7 list = [num \\ num<-list | (isPrime num (num-1)) && ((lastDigit num) == 7)]
*/
//Start = primes7 [1..10] // [7]
//Start = primes7 [1..100] // [7,17,37,47,67,97]
//Start = primes7 [1..6] // []


/* 7. Property check

 Given a list of tuples, write a function to determine
 whether all of the tuples inside of the list hold the (Even, Odd) property.
 [(2,1),(2,3),(4,1)] = True
*/

oneTrue :: (Int,Int) -> Bool
oneTrue (x,y) = isEven x && isOdd y

holdsTrue :: [(Int, Int)] -> Bool
//holdsTrue x = and (map (\x = oneTrue x) x)
holdsTrue x = and (map (\ (x,y) = isEven x && isOdd y) x)

//If you want to get result in tuples, you use filter
//here youre trying to find whether its true or false so you have to use map

//Start = holdsTrue [(2,1),(2,3),(4,1)] // True
//Start = holdsTrue [(1,3),(2,3),(3,4)] // False
//Start = holdsTrue [] // False


/* 8. Super Digit

 We define super digit of an integer x using the following rules.
 If x has only 1 digit, then its super digit is x.
 Otherwise, the super digit of x is equal to the super digit of the digit-sum of x.
 Here, the digit-sum of a number is defined as the sum of its digits.

 E.g  : super_digit(9875) = super_digit(9+8+7+5) 
                          = super_digit(29) 
                          = super_digit(2+9)
                          = super_digit(11)
                          = super_digit(1+1)
                          = super_digit(2)
                          = 2

 Given a list of integers, return a list containing the super digit
 of every number in the list.  
*/
digitAdd :: Int -> Int
digitAdd x
| x < 10 = x
= digitAdd(x rem 10 + digitAdd (x/10))

super_digit :: [Int] -> [Int]
super_digit x = [digitAdd num \\ num<- x ]

//!!!! THIS CAN BE USED INSTEAD OF MAPPING !!!!!

//Start = super_digit [148148148 , 9875 ] // [3,2]
//Start = super_digit [884555 , 456 , 2351 , 21587 , 88 ] // [8,6,2,5,7]
//Start = super_digit [] // [] 


/* 9. Powers 
 Given a list of integers and an integer, write a function which returns a list 
 which only contains the powers of the integer.
*/

isPower :: Int [Int] -> [Int]
isPower num list = [y^x \\ y<-[num] , x<-list]

powersList :: [Int] Int -> [Int]
powersList list num = filter (\x = isMember x (isPower num [1..10])) list

//Start = powersList [2,4,8,16,32,33,55] 2 // [2,4,8,16,32]
//Start = powersList [] 3 // []
//Start = powersList [1..10] 3 // [1,3,9]
//Start = powersList [-1,-2,4,8] 4 // [4]


/* 10. Twin primes
 
 Twin primes is a pair of primes, such that it contains a prime number that is either 
 2 less or 2 more than the pair prime number.
 For example, (41, 43) is a twin prime pair.
 Given a range of numbers left..right write a function that returns the count of 
 twin primes within the range.

 E.g: between 1 and 50 there are 6 pairs of twin prime numbers:
 [(3,5),(5,7),(11,13),(17,19),(29,31),(41,43)].
*/

/*
isPrime :: Int [Int] -> Bool
isPrime 1 x = False
isPrime num [] = True
isPrime num [x:xs]
| num rem x == 0 = False
= True && isPrime num xs
*/

isPrime :: Int -> Bool
isPrime x = length[num \\ num <- [1..x] | x rem num == 0] == 2

twinPrimes :: Int Int 


/*
twinPrimes1 :: Int Int -> Bool
twinPrimes1 x y = isPrime x [2..x-1] && isPrime y [2..x-1] 

listMaker :: [Int] -> Int
listMaker [] = 0
listMaker [x,y,z:xs]
| twinPrimes1 x z = 1 + listMaker xs
= 0 + listMaker xs

twinPrimes :: Int Int -> Int
twinPrimes x y = listMaker [x..y]
*/
//Start = twinPrimes 1 50 // 6
//Start = twinPrimes 1 1000 // 35
//Start = twinPrimes 0 2 // 0
//Start = twinPrimes 0 -5 // 0





