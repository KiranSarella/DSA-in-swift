import Foundation

// ref: https://www.youtube.com/watch?v=3DV8GO9g7B4

/// goal is to put pivot at its correct position,
/// suchthat all left elements have to be lessthen pivot value.
/// and all right elements have to be greaterthan pivot value.
func partition(_ arr: inout [Int], _ begin: Int, _ end: Int) -> Int {
    // Choose pivot as last element in the array.
    let pivot = arr[end]
    // Maintain index to separate lesser and greater values of pivot.
    var seperator = begin
    // Iterate elements from begin to before pivot.
    for j in begin ..< end {
        if arr[j] <= pivot {
            (arr[seperator], arr[j]) = (arr[j], arr[seperator]) // swap
            seperator += 1
        }
    }
    // Place pivot at its correct position
    (arr[seperator], arr[end]) = (arr[end], arr[seperator]) // swap
    // return pivot position
    return seperator
}

public func quicksort(_ arr: inout [Int], begin: Int, end: Int) {
    // Base condition
    if begin >= end {
        return
    }
    // Partition: put one element at its correct position.
    let pivotPosition = partition(&arr, begin, end)
    // Do partition for left of correctly placed element.
    quicksort(&arr, begin: begin, end: pivotPosition - 1)
    // Do partition for right of correctly placed element.
    quicksort(&arr, begin: pivotPosition + 1, end: end)
}


// usage


var arr = [3, 2, 1, 10, 100, 45, 101, 5, 3, 0, -25]
quicksort(&arr, begin: 0, end: arr.count - 1)
arr





