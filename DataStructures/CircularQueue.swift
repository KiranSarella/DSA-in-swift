// Impmentation of Queue using Arrays

/*
 
 Last In Last Out
 
 Operations:
 - enqueue
 - dequeue
 - isEmpty
 - isFull
 - size
 - front

 ref: https://www.youtube.com/watch?v=okr-XE8yTO8
 */

import Foundation


public struct Queue<Element> {
    
    fileprivate var array = [Element]()
    fileprivate var front: Int = -1
    fileprivate var rear: Int = -1
    fileprivate var n: Int
    
    public init(capacity: Int) {
        self.n = capacity
    }
    
    public var isEmpty: Bool {
        
        if (front == -1) && (rear == -1) {
            return true
        } else {
            return false
        }
    }
    
    public var isFull: Bool {
        
        if (rear + 1) % n == front {
            return true
        } else {
            return false
        }
    }
    
    public var size: Int {
        
        if isEmpty {
            return 0
        } else {
            return ((rear - front + n) % n) + 1
        }
    }
    
    public func frontElement() -> Element? {
        if isEmpty {
            return nil
        } else {
            return array[front]
        }
    }

    mutating public func enqueue(_ data: Element) {
        if isFull {
            return
        } else if isEmpty {
            front = 0
            rear = 0
        } else {
            rear = (rear + 1) % n
        }
        array.insert(data, at: rear)
    }
    
    mutating public func dequeue() -> Element? {
        
        if isEmpty {
            return nil
        }
        
        let currentFront = front
        
        if (front == rear) { // if only one element in the queue
            front = -1
            rear = -1
        } else {
            front = (front + 1) % n
        }
        return array[currentFront]
    }
}














