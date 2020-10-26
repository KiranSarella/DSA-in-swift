import Foundation



// tail recursion
func fact(_ n: Int) -> Int {
    
    func aux(_ n: Int, _ acc: Int) -> Int {
        if n == 0 {
            return acc
        }
        return aux(n - 1, acc * n)
    }
    
    return aux(n, 1)
}

fact(5)


