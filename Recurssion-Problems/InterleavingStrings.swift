import Foundation


/*
 
 Given 2 strings A and B, print all the interleavings of the 2 strings. An interleaved string of given two strings preserves the order of characters in individual strings and uses all the characters of both the strings. For simplicity, you can assume that the strings have unique characters.
 
 Sample Input
 
 2
 nkb gl
 bn zh
 
 Sample Output
 
 Case #1:
 glnkb
 gnkbl
 gnklb
 gnlkb
 ngkbl
 ngklb
 nglkb
 nkbgl
 nkgbl
 nkglb
 Case #2:
 bnzh
 bzhn
 bznh
 zbhn
 zbnh
 zhbn
 
 
 
 */


public func interleaving(_ A:[Character], _ B: [Character], _ ans:[Character]) {
    
    var ans = ans
    
    // base conditions
    if A.count == 0 {
        // if B only contains elements, then simply append to ans
        if B.count != 0 {
            ans.append(contentsOf: B)
        }
        // print ans
        for c in ans {
            print(c, terminator:"")
        }
        print()
        return
    }
    
    if B.count == 0 {
        // if A only contains elements, then simply append to ans
        if A.count != 0 {
            ans.append(contentsOf: A)
        }
        // print
        for c in ans {
            print(c, terminator:"")
        }
        print()
        return
    }
    
    // to print in lexigraphical order, compare first elements and choose smaller one.
    // remove smaller element from list and add to ans.
    if A.first! < B.first! {
        
        interleaving(Array(A[1...]), B, ans + [A.first!])
    } else {
        interleaving(A, Array(B[1...]), ans + [B.first!])
    }
    // compare first elements and choose greater one.
    // remove greater element from list and add to ans.
    if A.first! < B.first! {
        interleaving(A, Array(B[1...]), ans + [B.first!])
    } else {
        interleaving(Array(A[1...]), B, ans + [A.first!])
    }
    
    
}

// Test cases

//let t = Int(readLine()!)!
//
//for tc in 0 ..< t {
//
//    let input = readLine()!.split(separator:" ")
//    let a = Array(input[0])
//    let b = Array(input[1])
//    print("Case #\(tc + 1):")
//    interleaving(a, b, [])
//}



// usage


let a = Array("nkb")
let b = Array("gl")
interleaving(a, b, [])





