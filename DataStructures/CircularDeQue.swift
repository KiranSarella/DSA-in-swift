//: Circular Double Ended Queue
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
public struct CircularDeQue<Element> {
    
    private var array: [Element]!
    private var front = -1
    private var rear = 0
    private var size: Int
    
    public init(size: Int, defaultValue: Element) {
        self.size = size
        self.array = [Element](repeating: defaultValue, count: size)
        print("array size:", size)
    }
    
    public func printDeQue() {
        print(array)
    }
    
    public var isEmpty: Bool {
        
        return (front == -1)
    }
    
    public var isFull: Bool {
        
        return (front == 0) && (rear == size - 1) ||
               (front == rear + 1)
    }
    
    public var getFront: Element? {
        if isEmpty {
            return nil
        }
        return array[front]
    }
    
    public var getRear: Element? {
        
        if isEmpty || rear < 0 {
            return nil
        }
        return array[rear]
    }
    
    mutating public func insertAtFront(_ data: Element) {
        // check whether Deque is full or not
        if isFull {
            return
        }
        // If queue is initially empty
        if isEmpty {
            front = 0
            rear = 0
        }
        // Decrement front
        else if (front == 0) {
            // front is at first position of queue
            front = size - 1
        } else {
            // decrement front end by '1'
            front = front - 1
        }
        
        // insert current element into Deque
        array[front] = data
//        array.insert(data, at: front)
    }
    
    mutating public func insertAtRear(_ data: Element) {
        if isFull {
            return
        }
        // If queue is initially empty
        if isEmpty {
            front = 0
            rear = 0
        } else if rear == size - 1 {
            // rear is at last position of queue
           
            rear = 0
        } else {
            // increment rear end by '1'
            rear = rear + 1
        }
        // insert current element into Deque
        array[rear] = data
//        array.insert(data, at: rear)
    }
    
    mutating public func deleteFromFront() -> Element? {
        
        if isEmpty {
            return nil
        }
        
        print("front:", front)
        let deletedElement = array[front]
        print(array)
        if front == rear {
            // only one element exists
            front = -1
            rear = -1
        } else {
            // increment front
            // back to initial position
             print("front == size - 1", front)
            if front == size - 1 {
                front = 0
            } else {
                front += 1
            }
        }
        print(front, rear)
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
            
            if rear == 0 {
                rear = size - 1
            } else {
                rear -= 1
            }
        }
        return deletedElement
    }
    
}




























