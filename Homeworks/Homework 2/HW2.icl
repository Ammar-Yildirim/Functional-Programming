module HW2
import StdEnv

// Your Neptune code goes here : 

/*
A happy number is a number which eventually reaches 1 when replaced by the sum of the square of each digit.
      e.g: 13 is a happy number
            13 -> 1^2 + 3^2 = 10
           10 -> 1^2 + 0^2 = 1
      13 eventually reaches 1, so 13 is a happy number
      4 is not a happy number because it never reaches 1

      Write a function to check if a number is a happy number or not.

        ***Please dont use the abort function.***
        Neptun Code : fa27qm
*/

/*After many trials and errors, the below code is foolproof for any input. While most of my trials
especially struggled with three digit inputs such as 100, this way we can find ANY happy number*/

//Step 1: we split each digit and place it into a list
digits :: Int -> [Int]
digits x
| x<10 = [x]
= digits(x/10) ++ [x rem 10]

//Step 2: we calculate the sumsquare of the elements in a list 
digitsum :: [Int] -> Int
digitsum [] = 0
digitsum [x:xs] = x^2 + digitsum xs

//Step 3: This function combines the two upper functions
digitsq :: Int -> Int
digitsq x = digitsum(digits x)

//Step 4: Since all unhappy numbers except 0, reach 4 at some point we can write the following code
HappyNumber :: Int -> String
HappyNumber 4 = "Not Happy"
HappyNumber 0 = "Not Happy"
HappyNumber x 
| digitsq x == 1 = "Happy"
= HappyNumber(digitsq x)


//Start = HappyNumber 10 // "Happy"
//Start = HappyNumber 68 // "Happy"
//Start = HappyNumber 4 // "Not Happy"
//Start = HappyNumber 13 // "Happy"
//Start = HappyNumber 0 // "Not Happy"
//Start = HappyNumber 1 // "Happy"

//Bonus:Start = HappyNumber 100


/*
    Write a function that takes two Integer lists of the same length and returns a list containing 
    sublists having three elements each, where the first element is the sum of the elements 
    at the same index in the two lists, and the second element is the product of the elements.
    e.g: [1,2,3] [4,5,6] -> [[5,4],[7,10],[9,18]]
        from first list      from second list      result
        1                     4                     [1+4, 1*4] = [5,4]
        2                     5                     [2+5, 2*5] = [7,10]
        3                     6                     [3+6, 3*6] = [9,18]
*/

AllPairs :: [Int] [Int] -> [[Int]]
AllPairs [] [] = []
AllPairs _  [] =[]
AllPairs [] _ = []
AllPairs [x:xs] [y:ys] = [[(x+y),(x*y)]: AllPairs xs ys]



//Start = AllPairs [1,2,3] [4,5,6] // [[5,4],[7,10],[9,18]]
//Start = AllPairs [4,6,2,7] [8,3,5,1] // [[12,32],[9,18],[7,10],[8,7]]
//Start = AllPairs [] [] // []
//Start = AllPairs [] [1,2,3] // []
//Start = AllPairs [1,2,3] [] // []



