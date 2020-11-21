import Foundation


/*
 
 You are given a series of daily price quotes for a stock and you need to calculate span of stock’s price for each day. The span Si of the stock’s price on current day i is defined as the maximum number of consecutive days just before the current day[including the current day], on which the price of the stock is less than or equal to its price on the current day.
 
 2
 7
 100 80 60 70 60 75 85
 10
 0 7 3 6 6 9 18 0 16 0
 
 
 1 1 1 2 1 4 6
 1 2 1 2 3 6 7 1 2 1
 
 */

public func calculateSpan(price: [Int], n: Int) {
    
    var stack = [Int]()
    var span = [Int]()
    
    // Span value of first element is always 1
    stack.append(0)
    span.append(1)
    for i in 1 ..< n {
        // Pop elements from stack while stack is not empty and top of
        // stack is smaller than price[i]
        while !stack.isEmpty && price[stack.last!] <= price[i] {
            stack.removeLast()
        }
        // If stack becomes empty, then price[i] is greater than all elements
        // on left of it, i.e., price[0], price[1],..price[i-1].  Else price[i]
        // is greater than elements after top of stack
        let value = stack.isEmpty ? (i + 1) : (i - stack.last!)
        span.append(value)
        stack.append(i)
    }

    let outputBuffer = span.map { String($0) }.joined(separator: " ")
    print(outputBuffer)
}


// USGAE

// ref: https://www.geeksforgeeks.org/the-stock-span-problem/

import Foundation


//let n = 7
//let arr = [100, 80, 60, 70, 60, 75, 85]
// 1 1 1 2 1 4 6
let n = 10
let arr = [0, 7, 3, 6, 6, 9, 18, 0, 16, 0]

calculateSpan(price: arr, n: n)


/*
// read number of test cases
let t = Int(readLine()!)!
// run each test case
for _ in 0 ..< t {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    let span = calculateSpan(price: arr, n: n)
    let outputBuffer = span.map { String($0) }.joined(separator: " ")
    print(outputBuffer)
}
*/

