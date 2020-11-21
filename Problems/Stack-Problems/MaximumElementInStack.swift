//: Find Maximum Element in stack

import Foundation

public struct Stack<Element> {
    
    fileprivate var array = [Element]()
    fileprivate var index: Int = -1
    
    public init() {
        
    }
    
    public mutating func push(_ element: Element) {
        index += 1
        self.array.insert(element, at: index)
    }
    
    public mutating func pop() -> Element? {
        if index != -1 {
            let popedElement = self.array[index]
            self.array.remove(at: index)
            index -= 1
            return popedElement
        } else {
            return nil
        }
    }
    
    public var top: Element? {
        if index != -1 {
            return array[index]
        } else {
            return nil
        }
    }
    
    public var isEmpty: Bool {
        return index == -1 ? true : false
    }
    
    public var size: Int {
        return index + 1
    }
}



let operations = Int(readLine()!)!
// Create stacks
var maxStack = Stack<Int>()
var countStack = Stack<Int>()
var fastIO = [Int]()
for _ in 0 ..< operations {
    
    let lineString = readLine()!.trimmingCharacters(in: .whitespaces)
    let inputArr = lineString.components(separatedBy: " ").map{ $0 }
    
    if inputArr.count == 2 {
        let mangoSize = Int(inputArr[1])!
        
        // push to maxStack is greater then maxStack top element
        if let top = maxStack.top {
            if mangoSize > top {
                maxStack.push(mangoSize)
                countStack.push(0)
            } else {
                let currentCount = countStack.top!
                _ = countStack.pop()
                countStack.push(currentCount + 1)
            }
        } else { // empty stack
            maxStack.push(mangoSize)
            countStack.push(0)
        }
        
    } else {
        let operation = inputArr[0]
        if operation == "3" {   // Find out the biggest size mango
            if let top = maxStack.top {
                fastIO.append(top)
            }
        } else { // Throw out last picked up mango from basket
            
            if let topCount = countStack.top {
                if topCount == 0 {
                    _ = maxStack.pop()
                    _ = countStack.pop()
                } else {
                    _ = countStack.pop()
                    countStack.push(topCount - 1)
                }
            }
        }
    }
}

for out in fastIO {
    print(out)
}






