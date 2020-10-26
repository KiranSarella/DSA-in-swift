import Foundation


func computePower(_ a: Int, _ n: Int) -> Int {
    var a = a
    var ans = 1

    let m = Int(log2(Float(n)))
    for i in 0 ..< m {
        if n & (1 << i) == 1 {
            ans = ans * a
            print(ans, a)
        }
        a = a * a
       // print(ans, a)
    }
    return a
}


computePower(2, 5)
