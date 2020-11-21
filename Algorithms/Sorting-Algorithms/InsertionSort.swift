import Foundation

/// shift, insert

/// Implementation of insertion sort
public func insertionSort(_ arr: [Int]) -> [Int] {
    // return if one element
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    // Iterate from 2nd element.
    for i in 1 ..< arr.count {
        let currentElement = arr[i]
        var previous = i - 1   // previous index
        while (previous >= 0) && (arr[previous] > currentElement) {
            // shift previous to current.
            arr[previous + 1] = arr[previous]
            previous -= 1
        }
        // inserting element at correct position
        arr[previous + 1] = currentElement
    }
    
    return arr
}

// usage

//let arr = [20, 5, 3, 1]

let arr = [50, 5, 10, 7, 130, 60, 11, 10, 15, -1, 45, 90, 12]
let sorted = insertionSort(arr)
print(sorted)



















