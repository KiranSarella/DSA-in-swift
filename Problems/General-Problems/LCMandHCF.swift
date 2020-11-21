import Foundation

public func HCF(_ a: Int, _ b: Int) -> Int {
    
    if (a == 0) {
        return b
    }
    return HCF(b % a, a)
}

public func LCM(_ a: Int, _ b: Int) -> (Int, Int) {
    
    let hcf = HCF(a, b)
    if a > b {
        return ((a / hcf) * b, hcf)
    } else {
        return ((b / hcf) * a, hcf)
    }
    
}



// usage


import Foundation

/*

 basics ref:
 https://www.youtube.com/watch?v=cx1q2e7-u04
 LCM: https://www.khanacademy.org/math/algebra2/rational-expressions-equations-and-functions/adding-and-subtracting-rational-expressions/v/least-common-multiple-exercise
 LCF: https://www.youtube.com/watch?v=uE9O8N5JYB4

 The least common multiple (lcm) of a and b is their product divided by their greatest common divisor (gcd) ( i.e. lcm(a, b) = ab/gcd(a,b)).
 
 Euclidean algorithm:
 https://www.geeksforgeeks.org/euclidean-algorithms-basic-and-extended/
 
 1 <= A,B <= 109
 
 Given 2 numbers, find their LCM and HCF.
 
 Sample Input 0
 
 4
 4 710
 13 1
 6 4
 605904 996510762
 
 Sample Output
 
 1420 2
 13 1
 12 2
 7740895599216 78
 */




let (lcm, hcf) = LCM(605904, 996510762)
print(lcm, hcf)
