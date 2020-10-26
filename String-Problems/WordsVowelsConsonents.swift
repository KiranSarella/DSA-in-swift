import Foundation

/*
Given a sentence containing only uppercase/lowercase english alphabets and spaces, you have to count the number of words, vowels and consonants.

 Sample Input
 
 4
 Hi
 Hello World
 Exception
 Hi there
 
 Sample Output
 
 1 1 1
 2 3 7
 1 4 5
 2 3 4
 
*/
 
public func isVowel(_ char: Character) -> Bool {
    
    switch char {
    case "A", "E", "I", "O", "U":
        return true
    case "a", "e", "i", "o", "u":
        return true
    default:
        return false
    }
}

public func printWordsVowelsConsonants(_ str: String) {
    
    var words = 0
    var vowels = 0
    var consonants = 0
    var isPreviousIsSpace = true    // used to calculate number of words
    
    for char in str {
        
        if char == " " {
            isPreviousIsSpace = true
            continue
        } else if isVowel(char) {
            vowels += 1
        } else {
            consonants += 1
        }
        
        if isPreviousIsSpace {
            words += 1
            isPreviousIsSpace = false
        }
    }
    
    print(words, vowels, consonants, separator: " ")
}

// usage


printWordsVowelsConsonants("    kiran    asdf   ")