//: Stack Problem

/*:
 Problem: Design a data structure for getMin(), getMax() and getAvg() operations
 along with push(), pop(), peek() in O(1) time complexity.
 
 Solution: Maintain main stack, min stack, max stack, one for the actual array elements and other for maintaining minimum and maximum element so far.
 
 Sample Input:
 8
 push 5
 push 3
 push 10
 push 3
 pop
 max
 min
 avg
 
 Sample Output:

 pop 3
 max 10
 min 3
 avg 4
 
*/
import Foundation


// Read number of operations
let operations = Int(readLine()!)!

// Create stacks
var mainStack = [Int]()
var maxStack = [Int]()
var minStack = [Int]()
var count = 0
var sum = 0

var outputButter = ""

for _ in 0 ..< operations {
    
    let lineString = readLine()!.trimmingCharacters(in: .whitespaces)
    let inputArr = lineString.components(separatedBy: " ").map{ $0 }
    
    
    if inputArr.count == 2 {
        // PUSH Operation
        let data = Int(inputArr[1])!
        // push to mainStack
        mainStack.append(data)
        // push to minStack
        if let minTop = minStack.last {
            if data <= minTop {
                minStack.append(data)
            }
        } else {    // if minStack is empty, then push item
            minStack.append(data)
        }
        // push to maxStack
        if let maxTop = maxStack.last {
            if data >= maxTop {
                maxStack.append(data)
            }
        } else { // empty stack
            maxStack.append(data)
        }
        // update sum
        count += 1
        sum += data
        
    } else {
        let operation = inputArr[0]
        // POP OPERATION
        if operation == "pop" {
            // mainStack
            if let top = mainStack.last {
                outputButter.append("pop \(top)\n")
                mainStack.removeLast()
                // check and remove current min.
                let min = minStack.last!
                if top == min {
                    minStack.removeLast()
                }
                // check and remove current max.
                let max = maxStack.last!
                if top == max {
                    maxStack.removeLast()
                }
                // update sum
                count -= 0
                sum -= top
            }
        } else if operation == "min" {
            if let min = minStack.last {
                outputButter.append("min \(min)\n")
            }
        } else if operation == "max" {
            if let max = maxStack.last {
                outputButter.append("max \(max)\n")
            }
        } else if operation == "avg" {
            let average = Int(sum / count)
            outputButter.append("avg \(average)\n")
        }
    }
    print(mainStack, minStack, maxStack, sum, count)
}

print(outputButter)






