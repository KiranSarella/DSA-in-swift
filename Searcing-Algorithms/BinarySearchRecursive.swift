import Foundation


/// Binary Search Recursive

public func binarySearchRecursive(_ arr: [Int], _ low: Int, _ high: Int, _ target: Int) -> Int? {
    // base condition
    if low > high {
        return nil
    }
    // mid
    let mid = low + (high - low) / 2
    print(mid)
    // reduce search space using: ==, <, >
    if arr[mid] == target {
        return mid
    } else if arr[mid] < target {
        return binarySearchRecursive(arr, mid + 1, high, target)
    } else {
        return binarySearchRecursive(arr, low, mid - 1, target)
    }
}

// usage

let arr = [3, 5, 2, 5, 7, 8 , 12, 14, 200].sorted()
binarySearchRecursive(arr, 0, arr.count - 1, 14)


