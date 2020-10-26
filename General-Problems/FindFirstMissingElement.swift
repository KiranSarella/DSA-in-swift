//: [Previous](@previous)

import Foundation

/// Valid for range 1 to ...
/// using array elements as index
/// zero based index
//public func findFirstMissingElement(_ arr: [Int], _ low: Int, _ high: Int) -> Int {
//
//    // base condition
//    if low >= high {
//        return arr[high] - 1
//    }
//
//    if arr[low] != low + 1 {
//        return arr[low] - 1
//    }
//
//    let mid = (low + high) / 2
//
//    if arr[mid] == mid + 1 {
//       return findFirstMissingElement(arr, mid + 1, high)
//    } else {
//       return findFirstMissingElement(arr, low, mid)
//    }
//}

public func findFirstMissingElement(_ arr: [Int], _ low: Int, _ high: Int) -> Int {
    
    // base condition
    if low >= high {
        return arr[high] - 1
    }
    
    if arr[low] != low + 1 {
        return arr[low] - 1
    }
    
    let mid = (low + high) / 2
    
    if arr[mid] == mid + 1 {
        return findFirstMissingElement(arr, mid + 1, high)
    } else {
        return findFirstMissingElement(arr, low, mid)
    }
}

let arr = [-3, -2, -1, 0, 1, 2, 3, 5, 6, 7]

findFirstMissingElement(arr, 0, arr.count - 1)










//: [Next](@next)
