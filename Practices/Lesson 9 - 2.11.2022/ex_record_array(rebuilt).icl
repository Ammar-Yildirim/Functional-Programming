 module records
import StdEnv

/*
A way to collect multiple pieces of data toether, usually different types


:: Point = { x :: Int , y :: Int}

//Start = {x = 3, y = 5}

//This is how to create a simple records, you dont need to write point

p1 :: Point
p1 = {x = 3, y = 4}
origin :: Point
origin = {x=0,y=0}

distance :: Point Point -> Real
distance a b = sqrt(toReal((x1-x2)^2 + (y1-y2)^2))
where 	
	x1 = a.x				// you can extract elements from a record like this
	y1 = a.y
	x2 = b.x
	y2 = b.y
	
//Start = distance origin p1


:: Q = { nom :: Int , den :: Int}

qzero :: Q
qzero = { nom = 0, den = 0}

simplify :: Q -> Q
simplify {nom = x, den = y}
| y == 0 = abort "dat some bullshit"
| y > 0 = {nom = x/g , den = y/g}
where
	g = gcd x y
	
	
//Start = simplify {nom = 81,den = 90}

array :: {Int}
array = {1,2,3,4}

//Start = array.[2]

*/

// the above were for video, this is continuation

//1 -> Two versions

::Student = { name :: String, 
			  birthday :: (Int,Int,Int),
			  programmer :: Bool }
/*
isProgrammer :: Student -> String
isProgrammer {programmer = True} = "Yes he is"
isProgrammer _ = "No he is lame"
*/
isProgrammer :: Student -> String
isProgrammer st
| st.programmer == True = "Yes he is"
= "He is Lame"
Ahmet :: Student
Ahmet = {name = "Ahmet", birthday = (31,31,31), programmer = False}

//Start = isProgrammer Ahmet

:: MyPoint = {nom :: Int , den :: Int}

qOne :: MyPoint
qOne = {nom = 1, den = 1}

simplify :: MyPoint -> MyPoint
simplify a
| a.den == 0 = abort "0 koyma salak"
| a.den < 0 = {nom = ~a.nom/g , den=a.den/g}
= {nom = a.nom/g , den=a.den/g}
where
	g = gcd a.nom a.den
//this is one way but you can also pattern match, by saying simplify {nom = n, den = d}

mkQ :: Int Int -> MyPoint
mkQ a b = simplify {nom = a, den = b}

//Start = mkQ 12 16
//Start = simplify {nom = 81, den = 90}

//Equality of rational numbers

:: Rational = {nominator :: Int, denominator :: Int}

isEqual :: Rational Rational -> Bool
isEqual a b = a.nominator * b.denominator == a.denominator * b.nominator

//Start = isEqual {nominator = 1, denominator = 2} {nominator =2, denominator =4}

// 3. Given the University algebraic type of 3 university names
// and the Student record type of id, university and list of grades.
// Select from an array of students the ones that have more then n grades,
// and return a list of (id,uni) pairs of such students.


:: University = Elte | Corvinus | BME

:: Kerata={id::Int
           ,uni::University
           ,grades::[Int]}
 
moreThanN :: {Kerata} Int -> {Kerata}
moreThanN a num = { b \\ b<-:a | length(b.grades)>num} 
 
 
arrSt = {{id=1,uni=Elte,grades=[]},{id=2,uni=BME,grades=[5,5,5]},{id=3,uni=Corvinus,grades=[5,5,5,5]}}

//Start = moreThanN arrSt 3

//TREEEEEEEES

:: Tree a = Node a (Tree a) (Tree a)
		  | Leaf 

Tree1 :: Tree Int
Tree1 = Node 8 Leaf Leaf

Tree2 :: Tree Int
Tree2 = Node 8 (Node 5) (Node 6)

Start = Tree2








