// Repeated Numbers
/*
You are given an array of n+2 elements. All elements of the array are in range 1 to n. All elements occur once except two numbers, which occur twice. Your task is to find the two repeating numbers.

 Output Format
 
 Print the 2 repeated numbers in sorted manner, for each test case, separated by new line.
 
 Sample Input
 
 2
 8
 1 3 2 3 4 6 5 5
 10
 1 5 2 8 1 4 7 4 3 6
 
 Sample Output
 
 3 5
 1 4
*/

import Foundation

func printRepeatedNumbers(_ arr: [Int], _ n: Int) {
    // count array
    var countArray = [Int](repeating: 0, count: n + 1)
    for i in arr {
        countArray[i] += 1
    }
    // print repeated elements
    for i in 0 ..< n + 1 {
        let c = countArray[i]
        if c == 2 {
            print(i, terminator: " ")
        }
    }
    print()
}

// Test cases
/*
let t = Int(readLine()!)!
for _ in 0 ..< t {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    printRepeatedNumbers(arr, n - 2)
}*/


