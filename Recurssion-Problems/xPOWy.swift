//: [Previous](@previous)

import Foundation

// x^y using divide and conquer
// https://www.geeksforgeeks.org/write-a-c-program-to-calculate-powxn/

// O(log n)

/*

 ref: https://www.youtube.com/watch?v=4ivUTBDnki0
 
 ex: 2^5 = 2 * 2 * 2 * 2 * 2
 
 (2 * 2) * (2 * 2) * 2
 
 2 * 2 = 4 // calculating only once, and resuing it.
 
 4 * 4 * 2 = 32
 
 */

// Recursive
func power(_ x: Int, _ y: Int) -> Int {
    // base condition
    if y == 0 {
        return 1
    }
    let z = power(x, y >> 1)    // power(x, y / 2)
    // if y is even
    if (y & 1) == 0 {     //  y % 2 == 0
        // even power
        return z * z
    } else {
        // odd power
        return x * z * z
    }
}

power(2, 5)



// ref: https://www.geeksforgeeks.org/write-an-iterative-olog-y-function-for-powx-y/
/* Iterative Function to calculate (x^y) in O(logy) */
func powerIterative(x: Int, y: Int) -> Int {
    var x = x, y = y
    var res = 1     // Initialize result
    
    while y > 0 {
        // If y is odd, multiply x with result
        if y & 1 == 1 {
            res = res * x
        }
        
        // y must be even now
        y = y >> 1 // y = y/2
        x = x * x  // Change x to x^2
    }
    return res
}

powerIterative(x: 2, y: 31)



// Modular
// ref: https://www.geeksforgeeks.org/modular-exponentiation-power-in-modular-arithmetic/

/// Iterative
func powerModulo(x: Int, y: Int, p: Int) -> Int {
    var x = x, y = y
    var result = 1
    
    x = x % p // reduce x to p
    
    while y > 0 {
        // handle odd case, add extra x to result
        if y & 1 == 1 {
            result = (result * x) % p
        }
        // reusing calculated x * x
        x = (x * x) % p
        // reduce y, and repeat
        y = y >> 1  // y = y / 2
    }
    
    return result
}


powerModulo(x: 2, y: 5, p: 217)








//: [Next](@next)
