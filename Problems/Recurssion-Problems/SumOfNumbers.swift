import Foundation


// Sum Of Numbers

func sumOfNumbers(_ n: Int) -> Int {
    // base case
    if n == 0 {
        return 0
    }
    
    return n + sumOfNumbers(n - 1)
}

sumOfNumbers(5)
