import Foundation

public func mergeSort(_ arr: inout [Int], _ begin: Int, _ end: Int) {
    // Base condition
    if begin >= end {
        return
    }
    // Split
    let mid = (begin + end) / 2
    mergeSort(&arr, begin, mid)     // left
    mergeSort(&arr, mid + 1, end)   // right
    // Merge
    merge(&arr, begin, mid, end)
}

func merge(_ arr: inout [Int], _ begin: Int, _ mid: Int, _ end: Int) {
    var buffer = [Int]()
    // create new sorted list with arr[begin to mid], arr[mid+1 to end]
    var first = begin
    var second = mid + 1
    var current = 0
    let size = end - begin + 1
    while current < size {
        // check if first arr is empty
        if first == mid + 1 {
            // append second arr
            buffer.append(contentsOf: arr[second ... end])
            current += end - second
        } else if second == end + 1 { // check if second arr is empty
            // append first arr
            buffer.append(contentsOf: arr[first ... mid])
            current += mid - first
        } else if arr[first] > arr[second] { // take min value from arrays
            buffer.append(arr[second])
            second += 1
        } else { // handles duplicate values also
            buffer.append(arr[first])
            first += 1
        }
        
        current += 1
    }
    print(buffer)
    // update in given array
    arr.replaceSubrange(begin ... end, with: buffer)
}


// usage

var arr = [3, 2, 1, 10, 100, 45, 101, 5, 3, 0, -25]
mergeSort(&arr, 0, arr.count - 1)
arr



