//: [Previous](@previous)

import Foundation


public func sortZerosOnce(_ arr: inout [Int], _ i: Int,_ j: Int) {
    
    if i >= j {
        return
    }
    var i = i, j = j
    (arr[i], arr[j]) = (arr[j], arr[i])
    // move i till i == 1 (direction ->)
    while arr[i] == 0 {
        i += 1
    }
    // move j till j == 0 (direction <-)
    while arr[j] == 1 {
        j -= 1
    }
    
    sortZerosOnce(&arr, i, j)
    
}

//var arr = [0, 1, 0, 0, 1, 0, 1, 0, 0]
//var arr = [0, 0, 0, 0, 0, 0, 1, 1, 1]
var arr = [0]
sortZerosOnce(&arr, 0, arr.count - 1)























//: [Next](@next)
