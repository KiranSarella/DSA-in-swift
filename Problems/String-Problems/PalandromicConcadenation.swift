import Foundation

/*
 
 Given two strings A and B, consisting of lower case alphabets, check if it is possible to choose some non empty strings s1 and s2 where s1 is a substring of A, s2 is a substring of B such that concat(s1, s2) is a palindromic string.
 
 Sample Input
 
 3
 abc abc
 a b
 abba baab
 
 Sample Output
 
 Yes
 No
 Yes
 
 */


extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}
extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

public func palindromicConcatenation(_ str1: String, _ str2: String) {
    
    var c1 = [Int](repeating:0, count: 26)
    var c2 = [Int](repeating:0, count: 26)
    //    print(c1, c2)
    let v = "a".asciiArray.first!
    for ascii in str1.asciiArray {
        
        c1[Int(ascii - v)] += 1
    }
    //    print(c1, c2)
    for ascii in str2.asciiArray {
        c2[Int(ascii - v)] += 1
    }
    //    print(c1, c2)
    var exists = false
    for i in 0 ..< 26 {
        if c1[i] > 0 && c2[i] > 0 {
            exists = true
            break
        } else {
            exists = false
        }
    }
    
    if exists {
        print("Yes")
    } else {
        print("No")
    }
}


//
//// test cases
//let t = Int(readLine()!)!
//for _ in 0 ..< t {
//
//    let inputs = readLine()!.split(separator:" ").map { String($0) }
//    palindromicConcatenation(inputs[0], inputs[1])
//}






