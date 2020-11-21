import Foundation


/*
 ex:
 
 [| 5, 8, 3, 4, 6 ]
 // (start at bar |) find minumum element, from left to right: 3,
 // swap minimum element and first element,
 // increment bar
 [ 3 | 8, 5, 4, 6 ]
 // find minumum element from new bar position, ie index 1..n: 4
 // swap minumum element and second element ie (current bar index)
 // increment bar
 [ 3, 4 | 5, 8, 6 ]
 [ 3, 4, 5 | 8, 6 ]
 [ 3, 4, 5, 6, 8 |]
 
 */


public func selectionSort(_ arr:[Int]) -> [Int] {
    
    guard arr.count > 1 else {
        return arr
    }
    var arr = arr
    for i in 0 ..< arr.count - 1 {
        var min = i
        // find minimum from unsorted elements
        for j in i + 1 ..< arr.count {
            if arr[j] < arr[min] {
                min = j
            }
        }
        // swap if other minimum element found
        if min != i {
            arr.swapAt(min, i)
        }
    }
    
    return arr
}


// usage


let arr = [50, 5, 10, 7, 130, 60, 11, 10, 15, -1, 45, 90, 12]
let sorted = selectionSort(arr)
print(sorted)












