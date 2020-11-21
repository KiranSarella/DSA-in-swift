//: [Previous](@previous)

import Foundation

// Maximum Contiguous Subsequence
/*
 
 - find the length of the longest subsequence whose elements can be re-arranged in a contiguous manner, without duplicates.
 
 Sample Input
 
 3
 8
 21 -22 -22 5 -31 -24 5 -23
 10
 18 -33 31 33 30 -14 32 30 16 17
 6
 6 3 8 5 2 5
 
 Sample Output
 
 3
 4
 2
 
 */

func findMaxContiguousSubsequence(_ arr: [Int], _ n: Int) {
    
    var max = 1, currentMax = 1 // counts
    var sequence = [Int](), currentSeq = [Int]() // sequence
    var i = 0
    // add first element
    currentSeq.append(arr[i])
    sequence = currentSeq
    
    // iterate each element
    while i < n - 1 {
        i += 1
        // if current element is immediate next value of previous.
        if arr[i] - 1 == arr[i - 1] {
            // then add current to seq., increment seqMax count.
            currentSeq.append(arr[i])
            currentMax += 1
        }
        // if current is equal to previous
        else if arr[i] == arr[i - 1] {
            // move to next element
            continue
        } else {
            // current value is not next of previous or equal,
            // update max if current seq count is greater then previous max.
            if currentMax > max {
                max = currentMax
                sequence = currentSeq
            }
            // reset current sequence, (to state new sequence count).
            currentMax = 1
            currentSeq.removeAll()
            currentSeq.append(arr[i])
        }
    }
    // check last sequence count
    if currentMax > max {
        max = currentMax
        sequence = currentSeq
    }
    print(max)
    print(sequence)
}



//let input = [21, -22, -22, 5, -31, -24, 5, -23]
//let input = [18, -33, 31, 33, 30, -14, 32, 30, 16, 17]

let input = [6, 3, 8, 5, 2, 5]

//let input = [1, 2, 3, 4, 4, 5, 5, 6]
let sored = input.sorted(by: <)

findMaxContiguousSubsequence(sored, input.count)
//: [Next](@next)
