module hello
import StdEnv	


f :: Int -> Int
f x  = x*2

//Start = f 3

//f(x) = x*x  2*x + 1

eq :: Real -> Real
eq x = x*x + 2.0 * x + 1.0

//Start = eq 4.0

div :: Int -> Int
div x = x/2

divr :: Real Real -> Real
divr x y = x/y

//Start = (div 7, divr 7.0 2.0)

even :: Int -> Bool
even x = x rem 2 == 0

//Start = even 7

even2 :: Int-> Bool
even2 x = (x/2)*2 == x

//Start = (even7, even2 7)

//  power ^ caret
g :: Int -> Int
g x= x^6 + 2*x^4 + 4*x^2 + 8

//Start = g 1
granma :: Real Real Real -> Real
granma a o p = a*300.0 + o*800.0 + p*150.5

//Start = granma 5.0 8.0 3.0
ME = 8848
K2 = 8611

dist :: Int-> Int
dist x = ME - K2 + x

//Start = dist 1000

//apple on monday 200ft, everyday +10%. On sunday ?
//200, + 22 + 24.2

price :: Real Real -> Real 
price x y = x*1.1^y

//Start = price 200.0 6.0

maxi :: Int Int -> Int
maxi x y 
| x>y = x
= y

// = otherwise | if

//Start = maxi 5 55

//maxi3 :: Int Int Int -> Int
//maxi3 x y z
//| (x > y ) && * (x>z) = x



maxi32 :: Int Int Int -> Int
maxi32 x y z = maxi((maxi x y) z ) 

//Start = maxi32 4 6 8

power :: Int Int -> Int
power x y = x^y

//Start = power 2 5

ab :: Int Int -> Int
ab x y 
| abs(x-y) < 10 = x + 10
| abs(x-y) > 10 = x*3
=x

//Start = ab 10 20

divisible :: Int Int -> Int
divisible x y 
| x rem y == 0 = x/y 
| y rem x == 0 = y/x
=abort " not divisible"

//Start = divisible 4 6










 > 