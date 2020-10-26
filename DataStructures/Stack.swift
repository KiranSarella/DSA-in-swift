/// Stack
/*
 Last In Last Out
 
 Operations: Push, Pop, Peek, isEmpty, size, isFull
 
 Time, Space: O(1), O(n)
 
 */
// Stack using array

import Foundation


public struct Stack<Element> {
    
    fileprivate var array = ContiguousArray<Element>()//[Element]()
    fileprivate var top: Int = -1
    
    public init() {
        
    }
    
    public var isEmpty: Bool {
        return top == -1 ? true : false
        //        return array.isEmpty
    }
    
    public var size: Int {
        return top + 1
        //        return array.count
    }
    
    public var isFull: Bool {
        return top == size - 1
    }
    
    public mutating func push(_ element: Element) {
        top += 1
        self.array.insert(element, at: top)
        // self.aarray.append(element)
    }
    
    public mutating func pop() -> Element? {
        if top != -1 {
            let popedElement = self.array[top]
            self.array.remove(at: top)
            top -= 1
            return popedElement
        } else {
            return nil
        }
        //        return array.popLast()
    }
    
    // Function to get top item from stack
   public var peek: Element? {
        if top != -1 {
            return array[top]
        } else {
            return nil
        }
//        return array.last
    }
    
    public func printStack() {
        print(array)
    }
    
   
}

























