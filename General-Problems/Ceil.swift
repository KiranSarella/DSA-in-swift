import Foundation

public func findCeil(_ k: Int, _ ar: [Int], _ n: Int) {
    
    var low = 0
    var hi = n - 1
    var mid = 0
    
    while low < hi {
        mid = low + (hi - low) / 2
        if ar[mid] >= k {
            hi = mid
        } else {
            low = mid + 1
        }
    }
    print(hi)
    ar[hi] >= k ? print(ar[hi]) : print(Int32.max)
}
