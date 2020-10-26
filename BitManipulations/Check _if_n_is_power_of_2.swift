

import Foundation

// Check if a given number is power of 2 or not

func checkIfNumberisPowerOfTwo(n: Int) -> Bool {
    
    return n & (n - 1) == 0
}

checkIfNumberisPowerOfTwo(n: 4)
checkIfNumberisPowerOfTwo(n: 5)