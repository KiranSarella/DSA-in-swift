import Foundation

public func anagrams(_ s1: String, _ s2: String) -> Bool {
    
    if s1.count != s2.count {
        return false
    }
    
    let str1 = Array(s1)
    let str2 = Array(s2)
    
    var letters = [Character : Int]()
    
    for i in 0 ..< s1.count {
        let c1 = str1[i]
        if let frequency = letters[c1] {
            letters[c1] = frequency + 1
        } else {
            letters[c1] = 1
        }
        
        let c2 = str2[i]
        if let frequency = letters[c2] {
            letters[c2] = frequency - 1
        } else {
            letters[c2] = -1
        }
    }
    
    for (_ , value) in letters {
        if value != 0 {
            return false
        }
    }
    return true
}

//// test cases
//let t = Int(readLine()!)!
//for _ in 0 ..< t {
//    let arr = readLine()!.split(separator: " ").map { String($0) }
//
//    let isAnagrams = anagrams(arr[0], arr[1])
//    if isAnagrams {
//        print("True")
//    } else {
//        print("False")
//    }
//}


// USAGE

/*
 
 Given 2 strings, check if they are anagrams. An anagram is a rearrangement of the letters of one word or phrase to form another word or phrase.
 
 Sample Input
 
 4
 a a
 b h
 stop post
 hi hey
 
 Sample Output
 
 True
 False
 True
 False
 
 */

let s1 = "stop"
let s2 = "post"
anagrams(s1, s2)


