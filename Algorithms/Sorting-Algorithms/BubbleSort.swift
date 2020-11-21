import Foundation

// pair, swap

/// Implemention of bubble sort
public func bubbleSort(_ arr: [Int]) -> [Int] {
    // return if one element
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    var swapped = false
    
    repeat {
        swapped = false
        // Traverse all the elements
        for i in 0 ..< arr.count - 1 {
            // Swap if the element found is greater than the next element
            if arr[i] > arr[i + 1] {
                (arr[i], arr[i + 1]) = (arr[i + 1], arr[i]) // swap(current, next)
                swapped = true
            }
        }
    } while (swapped == true)   // Loop until no swaps done
    
    return arr
}


// usage
let arr = [50, 5, 10, 7, 130, 60, 11, 10, 15, -1, 45, 90, 12]
//let arr = [1, 2, 3, 4, 5, 6]
let result = bubbleSort(arr)
result