//: Balance Brackets
/*
 Sample Input:
 3
 {[()]}
 {[(])}
 {{[[(())]]}}
 
 Sample Output:
 YES
 NO
 YES
 */

import Foundation

func isBalance(_ sequence: String) -> String {
    
    var stack = [Character]()
    
    for c in sequence {
        
        switch c {
        case "{", "[", "(":
            stack.append(c)
        case "}":
            if (stack.count == 0) || (stack.last != "{") {
                return "NO"
            }
            stack.removeLast()
        case "]":
            if (stack.count == 0) || (stack.last != "[") {
                return "NO"
            }
            stack.removeLast()
        case ")":
            if (stack.count == 0) || (stack.last != "(") {
                return "NO"
            }
            stack.removeLast()
        default:
            break
        }
    }
    
    return stack.count == 0 ? "YES" : "NO"
}


let n = Int(readLine()!)!

for _ in 0 ..< n {
    
    let sequence = readLine()!
    print(isBalance(sequence))
}





