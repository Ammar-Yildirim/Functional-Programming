module ex5_todo

import StdEnv


// 1. generate a list with 10 times of 13 : [13,13,13,13,13,13,13,13,13,13]
l1 :: [Int]
l1 = [13 \\ x<-[1..10] ]

//Start = l1


// 2. generate the following list [(1,1),(1,2),(2,1),(2,2)]
l2 :: [(Int, Int)]
l2 = [(x,y) \\ x<-[1..2], y<-[1..2] ]		//comma combinator, there is also and

//Start = l2


// 3. generate the following list [(1,3),(1,2),(1,1),(2,3),(2,2),(2,1),(3,3),(3,2),(3,1)]
l3 :: [(Int, Int)]
l3 = [(x,y)  \\ x<-[1..10] , y<-[3,2,1]]			//when you dont have variable in the left its just repeat

//Start = l3


// 4. generate the list [(1,5),(2,6),(3,7),(4,8),(5,9),(6,10)]
l4 :: [(Int, Int)]
l4 = [(x,y) \\ x<-[1..6] & y<-[5..10]] 

//Start = l4


// 5. generate the list [1,2,2,3,3,3,4,4,4,4,...,10,..,10]


l5 :: [Int]
l5 = flatten [(take y(repeat y)) \\ y<-[1..10]] 
//l5 = [ snd (x,y) \\ x<-[1..10] , y<-[1..10]]

//Start = l5


// 6. generate the list [[1],[2,2],[3,3,3],[4,4,4,4],...,[10,..,10]]
l6 :: [[Int]]
l6 = [ take x (repeat x) \\ x<-[1..10] ]

//Start = l6
  
  
// 7. generate 6 pythagoras numbers : [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20)]
//l7 :: [(Int, Int, Int)]
//l7 =  take 6 [(a,b,c) \\ c <- [1..], b<-[1..c], a<-[1..b] | a*a + b*b == c*c]
//l7 = [(a,b,c) \\ c <- [1..100], b<-[1..c], a<-[1..b] | a*a + b*b == c*c]
//l7 =  take 6 [(a,b,c) \\ a<-[1..100], b<-[1..100],c <- [1..100]  | a*a + b*b == c*c && a<b && b<c]

//Start = l7


tryhard :: [(String,Int)] -> [String]
tryhard list = [name \\ (name,grades)<-list | grades>10 ]


//Start = tryhard [("Ammar",10),("Yildirim",20)]


tryharder :: [Int] -> [Int]
tryharder [x] = [x]
tryharder list = tryharder[x \\ x<-list & i<-[1..] | i rem 2 == 0]

//Start = tryharder [1,2,3,4,5,6,7,8,9,10]






