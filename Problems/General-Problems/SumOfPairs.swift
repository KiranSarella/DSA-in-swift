//: [Previous](@previous)

import Foundation

// Sum of Pairs

/*
 Given an array of integers and a number K, check if their exist a pair of indices i,j s.t. a[i] + a[j] = K and i!=j.
 
 Sample Input
 
 3
 5 -15
 -30 15 20 10 -10
 2 20
 10 10
 4 7
 -4 0 10 -7
 
 Sample Output
 
 True
 True
 False
 */

func sumOfPairs(_ arr: [Int], _ k: Int, _ n: Int) -> Bool {
    
    if k < arr[0] + arr[1] {
        return false
    }
    if k > arr[n - 1] + arr[n - 2] {
        return false
    }
    
    var p1 = 0, p2 = n - 1
    
    while p1 < p2 {
        let sum = arr[p1] + arr[p2]
        if sum < k {
            p1 += 1
        } else if sum > k {
            p2 -= 1
        } else {
            return true
        }
    }
    
    return false
}

let arr = [-30, 15, 20, 10, -10].sorted(by: <)

sumOfPairs(arr, -15, arr.count)
//
//let inputs = [5, -15, 11, 100]

// test cases

//let t = Int(readLine()!)!
//for _ in 0 ..< t {
//    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
//    let sortedArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <) // introsort
//    let n = inputs[0]
//    var result = sumOfPairs(sortedArr, inputs[1], n)
//    result ? print("True") : print("False")
//}



//let arr = [1, 4, 45, 6, 10, -8].sorted(by: <)
//var inputs = [16, 8, 5]
//var result = true
//for k in inputs {
//    result = sumOfPairs(arr, k, arr.count)
//    if result {
//        print("break")
//        break
//    }
//}

//print(result)
















//: [Next](@next)
