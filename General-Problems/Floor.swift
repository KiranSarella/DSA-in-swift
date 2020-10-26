import Foundation

// Finding the Floor

/*
 Sample Input
 
 6
 -6 10 -1 20 15 5
 5
 -1
 10
 8
 -10
 -4
 
 Sample Output
 
 -1
 10
 5
 -2147483648
 -6
 
 */

public func findFloor(_ k: Int, _ ar: [Int], _ n: Int) {
    
    var low = 0
    var hi = n - 1
    var mid = 0
    
    while low < hi {
        mid = low + (hi - low + 1) / 2
        
        if ar[mid] <= k {
            low = mid
        } else {
            hi = mid - 1
        }
    }
    print("index:", low)
    ar[low] <= k ? print(ar[low]) : print(Int32.min)
}


// usage


// Frequency of K

let freq = [1, 2, 3, 4, 5, 6, 6, 6, 9, 10].sorted(by: <)
findFloor(6, freq, freq.count)

