
/*
 Find First Repeating Character
 
 Given a string of characters, find the first repeating character.
 
 Sample Input
 
 3
 smartinterviews
 algorithms
 datastructures
 
 Sample Output
 
 s
 .
 a
 
 */

import Foundation


public func printFirstRepeatingCharacter(_ str: String) {
    
    var letters = [Character : Bool]()
    for c in str {
        if let state = letters[c] {
            if state == false {
                letters[c] = true
            }
        } else {
            letters[c] = false
        }
    }
    
    //print(letters)
    
    for c in str {
        
        if let state = letters[c] {
            if state == true {
                print(c)
                return
            }
        }
    }
    print(".")
}


// test cases

//let t = Int(readLine()!)!
//for _ in 0 ..< t {
//
//    let str = readLine()!
//    printFirstRepeatingCharacter(str)
//}



// USAGE
printFirstRepeatingCharacter("abcba")