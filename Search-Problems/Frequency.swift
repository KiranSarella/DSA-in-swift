import Foundation

/**
 Find frequency of K
 
 */

// Frequency of K


/// return the index of the first element in the array, which is greater than or equal to the target value.


func findLowerBound(_ arr: [Int], _ k: Int, _ n: Int) -> Int {
    
    var lo = 0
    var hi = n - 1
    var mid = 0
    
    while lo < hi {
        // dont round up mid
        mid = lo + (hi - lo) / 2
        
        if arr[mid] == k {
            hi = mid
        } else if arr[mid] > k {
            hi = mid - 1
        } else {
            lo = mid + 1
        }
    }
    print(#function, lo, hi)
    return hi
}

func findUpperBound(_ arr: [Int], _ k: Int, _ n: Int) -> Int {
    
    var lo = 0
    var hi = n - 1
    var mid = 0
    
    while lo < hi {
        // round up mid
        mid = lo + (hi - lo + 1) / 2
        
        if arr[mid] == k {
            lo = mid
        } else if arr[mid] > k {
            hi = mid - 1
        } else {
            lo = mid + 1
        }
    }
    print(#function, lo, hi)
    return hi
}

public func findFrequency(_ arr: [Int], _ k: Int, _ n: Int) -> Int? {
    
    if k < arr.first! || k > arr.last! {
        print(0)
        return nil
    }
    
    // find lower bound
    let lowerBoundIndex = findLowerBound(arr, k, n)
    
    // check if element not present
    if arr[lowerBoundIndex] != k {
        print(0)
        return nil
    }
    
    print("lowerBoundIndex", lowerBoundIndex)
    // find upper bound
    let upperBoundIndex = findUpperBound(arr, k, n)
    print("upperBoundIndex", upperBoundIndex)
    let frequency = upperBoundIndex - lowerBoundIndex + 1
    print(frequency)
    return frequency
}


// usage


let freq = [-6, 10, -1, 20, -1, 15, 5, -1, 15].sorted(by: <)

findFrequency(freq, 8, freq.count)

//findLowerBound(freq, 6, freq.count)
//findUpperBound(freq, 6, freq.count)

