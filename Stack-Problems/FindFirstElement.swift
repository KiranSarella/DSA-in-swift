// For every element find first smaller element on right side

/*:

 Intead of maintaing values in stack, maintain indexes
 
 // ref: https://www.geeksforgeeks.org/next-greater-element/
 
Sample Input
5 3 8 20 11 9 1 8

Sample Output

3 1 1 11 9 1 - -

 
 findFirstSmallerOnRight:
 [5, 3, 8, 20, 11, 9, 1, 8]
 [3, 1, 1, 11, 9, 1, -1, -1]
 findFirstGreaterOnRight:
 [5, 3, 8, 20, 11, 9, 1, 8]
 [8, 8, 20, -1, -1, -1, 8, -1]
 findFirstSmallerOnLeft:
 [5, 3, 8, 20, 11, 9, 1, 8]
 [-1, -1, 3, 8, 8, 8, -1, 1]
 findFirstGreaterOnLeft:
 [5, 3, 8, 20, 11, 9, 1, 8]
 [-1, 5, -1, -1, 20, 11, 9, 9]

*/

import Foundation

public func findFirstSmallerOnRight(_ arr: [Int]) {
    var smallerArr = [Int](repeating: -1, count: arr.count)
    var stack = [Int]()
    // iterate each element
    for i in 0 ..< arr.count {
        let current = arr[i]
        // case 1: if stack is empty, push element
        if stack.isEmpty {
            stack.append(i)
        } else {
            // case 2: pop all elements that are greater then current value
            // for pop element, the first smaller is the current value
            while (arr[stack.last!] > current) {
                smallerArr[stack.last!] = current
                stack.removeLast()
                // break if stack is empty
                if stack.isEmpty {
                    break
                }
            }
            // case 3: after popping all greater elements from the stack, put current element on to the stack.
            stack.append(i)
        }
    }
    print("findFirstSmallerOnRight:")
    print(arr)
    print(smallerArr)
}

public func findFirstGreaterOnRight(_ arr: [Int]) {
    var smallerArr = [Int](repeating: -1, count: arr.count)
    var stack = [Int]()
    // iterate each element
    for i in 0 ..< arr.count {
        let current = arr[i]
        // case 1: if stack is empty, push element
        if stack.isEmpty {
            stack.append(i)
        } else {
            // case 2: pop all elements that are less then current value
            // for pop element, the first smaller is the current value
            while (arr[stack.last!] < current) {
                smallerArr[stack.last!] = current
                stack.removeLast()
                // break if stack is empty
                if stack.isEmpty {
                    break
                }
            }
            // case 3: after popping all smaller elements from the stack, put current element on to the stack.
            stack.append(i)
        }
    }
    print("findFirstGreaterOnRight:")
    print(arr)
    print(smallerArr)
}


public func findFirstSmallerOnLeft(_ arr: [Int]) {
    var smallerArr = [Int](repeating: -1, count: arr.count)
    var stack = [Int]()
    // iterate each element
    for i in (0 ..< arr.count).reversed() {
        let current = arr[i]
        // case 1: if stack is empty, push element
        if stack.isEmpty {
            stack.append(i)
        } else {
            // case 2: pop all elements that are greater then current value
            // for pop element, the first smaller is the current value
            while (arr[stack.last!] > current) {
                smallerArr[stack.last!] = current
                stack.removeLast()
                // break if stack is empty
                if stack.isEmpty {
                    break
                }
            }
            // case 3: after popping all greater elements from the stack, put current element on to the stack.
            stack.append(i)
        }
    }
    print("findFirstSmallerOnLeft:")
    print(arr)
    print(smallerArr)
}

public func findFirstGreaterOnLeft(_ arr: [Int]) {
    var smallerArr = [Int](repeating: -1, count: arr.count)
    var stack = [Int]()
    // iterate each element from right to left
    for i in (0 ..< arr.count).reversed() {
        let current = arr[i]
        // case 1: if stack is empty, push element
        if stack.isEmpty {
            stack.append(i)
        } else {
            // case 2: pop all elements that are less then current value
            // for pop element, the first greater is the current value
            while (arr[stack.last!] < current) {
                smallerArr[stack.last!] = current
                stack.removeLast()
                // break if stack is empty
                if stack.isEmpty {
                    break
                }
            }
            // case 3: after popping all smaller elements from the stack, put current element on to the stack.
            stack.append(i)
        }
    }
    print("findFirstGreaterOnLeft:")
    print(arr)
    print(smallerArr)
}



// USAGE

// Find First smaller/greater from left/right
let arr = [5, 4, 3, 3, 2, 1]
let arr2 = [5, 3, 8, 20, 11, 9, 1 ,8]

findFirstSmallerOnRight(arr2)
findFirstGreaterOnRight(arr2)
findFirstSmallerOnLeft(arr2)
findFirstGreaterOnLeft(arr2)














