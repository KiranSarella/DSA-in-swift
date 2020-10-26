import Foundation

// Find the number of set bits in a given integer

func numberOfSetBits(n: Int) -> Int {
    
    var n = n
    var count = 0
    while n > 0 {
        // unset the Least Set Bit
        n  = n & (n - 1)
        count += 1
    }
    return count
}

numberOfSetBits(n: 5)
numberOfSetBits(n: 7)
