//: Double Ended Queue
// ref: https://www.youtube.com/watch?v=kLBuJ1Hle8g

/*:
 
 Operations
 * insertAtFront
 * insertAtRear
 * deleteFromFront
 * deleteFromRear
 
 * getFront
 * getRear
 * isEmpty
 * isFull
 
 */



import Foundation

// DeQue using Arrays
public struct DeQue<Element> {
    
    private var array = [Element]()
    private var front = -1
    private var rear = -1
    private var capacity: Int
    
    public init(capacity: Int) {
        self.capacity = capacity
    }
    
    public var isEmpty: Bool {
        if (front == -1) && (rear == -1) {
            return true
        } else {
            return false
        }
    }
    
    public var getFront: Element? {
        if front == -1 {
            return nil
        }
        return array[front]
    }
    
    public var getRear: Element? {
        
        if rear == -1 {
            return nil
        }
        return array[rear]
    }
    
    mutating public func insertAtFront(_ data: Element) {
        
        if isEmpty {
            front = 0
            rear = 0
        } else if front > 0 {
            front -= 1
        }
        print(front, rear)
        array.insert(data, at: front)
    }
    
    mutating public func insertAtRear(_ data: Element) {
        
        if isEmpty {
            front = 0
            rear = 0
        } else if rear < capacity {
            rear += 1
        }
        array.insert(data, at: rear)
    }
    
    mutating public func deleteFromFront() -> Element? {
        
        if isEmpty {
            return nil
        }
        
        let deletedElement = array[front]
        
        if front == rear {
            // only one element exists
            front = -1
            rear = -1
        } else {
            front += 1
        }
        return deletedElement
    }
    
    mutating public func deleteFromRear() -> Element? {
        
        if isEmpty {
            return nil
        }
        let deletedElement = array[rear]
        if front == rear {
            // only one element exists
            front = -1
            rear = -1
        } else {
            rear -= 1
        }
        return deletedElement
    }
    
    
    
}




























