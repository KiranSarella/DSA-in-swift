import Foundation

// ref: https://www.youtube.com/watch?v=kx8NokUZnmg

/*
 3
 2
 5
 20
 
 0
 1
 4
 */

func countTrailingZeros(_ n: Int) -> Int {
    var count = 0
    // prime factor 5: (n / 5) + (n / 5^2) + ...
    var i = 5
    
    var result = n / i
    while result >= 1 {
        count += result
        i *= 5
        result = n / i
    }
    
    return count
}

// test cases
/*
let t = Int(readLine()!)!
for _ in 0 ..< t {
    let n = Int(readLine()!)!
    let count = countTrailingZeros(n)
    print("\(count)")
}*/
