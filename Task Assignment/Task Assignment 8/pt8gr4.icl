module pt8gr4
import StdEnv


/*
    write an instance * for two strings 
    such that the result has all the consonants of both strings in order
    i.e consonants of first string followed by consonants of second string
    * repetition of consonants is allowed

    * consonants are all letters except a,e,i,o,u

    eg:
    "abc" * "def" = "bcdf"

    "Functional" * "Programming" = "FnctnlPrgrmmng"
    
    Name : Ammar Yildirim fa27qm
*/

isVowel :: Char -> Bool
isVowel a = isMember a ['a','e','i','o','u']

checker :: String -> String
checker a = { c \\ c<-:a | not(isVowel c)}

instance * String
where
	(*) x y = checker x +++ checker y

//Start = "abc" * "def" // "bcdf"
//Start = "Functional" * "Programming" // "FnctnlPrgrmmng"


