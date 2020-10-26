import Foundation


// Sorted Array
// Search Spaace - after each step, the search space is reduced till search space contain single element.
// Time Complexity: O (log N)  <-   T(n) = T(n/2) + O(1)
// Used to search multiple elements.

/// Iterative Binary Search Algorithm.
/// Returns Index if target found.
public func binarySearchLinear(_ arr: [Int], _ n: Int, _ target: Int) -> Int? {
    
    var low = 0
    var high = n - 1
    var mid = 0
    
    while low <= high {
        
        mid = low + (high - low) / 2
        
        if arr[mid] == target {
            return mid
        } else if arr[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return nil
}

// usage
let arr = [3, 5, 2, 5, 7, 8 , 12, 14, 200].sorted()
binarySearchLinear(arr, arr.count, 3)
