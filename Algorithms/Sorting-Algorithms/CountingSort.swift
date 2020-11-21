import Foundation


public func countingSorr(_ arr: inout [Int], _ n: Int, _ k: Int) {
    // create count arr with initial values as 0's
    var countArr = [Int](repeating: 0, count: k + 1)
    // count frequency for each value.
    for i in arr {
        countArr[i] += 1
    }
    
    var idx = 0
    // Iterate over each value from 0 to k + 1
    for i in 0 ..< k + 1 {
        // Iterate from 0 to frequency of each value; duplicate values
        for _ in 0 ..< countArr[i] {
            arr[idx] = i
            idx += 1
        }
    }
}

var arr = [6, 5, 4, 1, 0, 1]

countingSorr(&arr, arr.count, 6)
print(arr)

