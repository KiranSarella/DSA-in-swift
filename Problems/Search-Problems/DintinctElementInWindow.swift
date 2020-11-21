import Foundation

public func findDistinctElementsInWindow(_ arr: Array<Int>, _ k: Int, _ n: Int) {
    
    var distinctCount = 0
    var outputBuffer = [Int]()
    // find first window
    var dict = [Int:Int]()
    for i in 0 ..< k {
        let key = arr[i]
        if let count = dict[key] {
            dict[key] = count + 1
        } else {
            dict[key] = 1
            distinctCount += 1
        }
    }
    outputBuffer.append(distinctCount)
    // print(distinctCount, terminator: " ")
    
    for i in k ..< n {
        // remove old
        let oldKey = arr[i - k]
        let oldCount = dict[oldKey]!
        if oldCount == 1 {
            dict[oldKey] = nil
            distinctCount -= 1
        } else {
            dict[oldKey] = oldCount - 1
        }
        // insert new
        let newKey = arr[i]
        if let count = dict[newKey] {
            dict[newKey] = count + 1
        } else {
            dict[newKey] = 1
            distinctCount += 1
        }
        //print(distinctCount, terminator: " ")
        outputBuffer.append(distinctCount)
    }
    
    for i in outputBuffer {
        print(i, terminator: " ")
    }
    print()
}


// usage


/*
 
 Given an array of integers and a window size K, find the number of distinct elements in every window of size K of the given array.
 
 
 Sample Input
 
 3
 5 3
 -2 -4 -2 4 -2
 10 7
 3 -4 -3 -4 -2 0 2 -2 6 0
 17 13
 -5 -1 4 8 -5 -3 -4 7 4 -4 0 8 0 -2 3 2 5
 
 Sample Output
 
 2 3 2
 6 5 6 5
 8 9 9 10 11
 
 
 */



findDistinctElementsInWindow([3, -4, -3, -4, -2, 0, 2, -2, 6, 0], 7, 10)



/*
// Test Cases
let t = Int(readLine()!)!
for _ in 0 ..< t {
    
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
    let elements = readLine()!.split(separator: " ").map { Int($0)! }
    
    findDistinctElementsInWindow(elements, inputs[1], inputs[0])
}

*/




