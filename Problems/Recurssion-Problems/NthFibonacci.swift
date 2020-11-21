import Foundation


func nthFibonacci(_ n: Int) -> Int {
    
    if n <= 2 {
        return 1
    }
    
    return nthFibonacci(n - 2) + nthFibonacci(n - 1)
}


nthFibonacci(6)






