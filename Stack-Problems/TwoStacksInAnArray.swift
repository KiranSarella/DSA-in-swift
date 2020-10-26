import Foundation



protocol StorageStackUsage {
    associatedtype Element
    var stack: StorageStack<Element> { get set }
    func push(_ data: Element)
    func pop() -> Element?
}

public class StorageStack<T> {
    
    private var storageArray: [T]
    fileprivate let size: Int
    fileprivate var top1: Int
    fileprivate var top2: Int
    private let defaultValue: T
    
    public init(size: Int, defaultValue: T) {
        
        storageArray = [T](repeating: defaultValue, count: size)
        self.size = size
        self.defaultValue = defaultValue
        top1 = -1
        top2 = size
    }
    
    var isFull: Bool {
        return !((top2 - top1) > 1)
    }
    
    var isFrontEmpty: Bool {
        return top1 == -1
    }
    
    var isRearEmtpy: Bool {
        return top2 == size
    }
    
    func pushFromFront(_ data: T) {
        //        print(isFull)
        if isFull == false {
            top1 += 1
            storageArray[top1] = data
        }
    }
    
    func pushFromRear(_ data: T) {
        if isFull == false {
            top2 -= 1
            storageArray[top2] = data
        }
    }
    
    func popFromFront() -> T? {
        if isFrontEmpty {
            return nil
        } else {
            defer { storageArray[top1] = defaultValue; top1 -= 1 }
            return storageArray[top1]
        }
    }
    
    func popFromRear() -> T? {
        if isRearEmtpy {
            return nil
        } else {
            defer { storageArray[top2] = defaultValue; top2 += 1 }
            return storageArray[top2]
        }
    }
    
    public func printStorage() {
        print(storageArray)
    }
}

public class StackA<T>: StorageStackUsage {
    
    var stack: StorageStack<T>
    
    var isEmpty: Bool {
        return stack.isFrontEmpty
    }
    
    public init(_ storageStack: StorageStack<T>) {
        self.stack = storageStack
    }
    
    public func pop() -> T? {
        return stack.popFromFront()
    }
    
    public func push(_ data: T) {
        stack.pushFromFront(data)
    }
    
    
}

public class StackB<T>: StorageStackUsage {
    
    var stack: StorageStack<T>
    
    var isEmpty: Bool {
        return stack.isRearEmtpy
    }
    
    public init(_ storageStack: StorageStack<T>) {
        self.stack = storageStack
    }
    
    public func pop() -> T? {
        return stack.popFromRear()
    }
    
    public func push(_ data: T) {
        stack.pushFromRear(data)
    }
}


// USAGE


let storageStack = StorageStack(size: 10, defaultValue: 0)

let s1 = StackA(storageStack)
let s2 = StackB(storageStack)

s1.push(1)
s1.push(2)
s2.push(100)
s2.push(200)

_ = s1.pop()
_ = s2.pop()


s1.push(3)
s1.push(4)
s1.push(5)
s1.push(6)


s2.push(300)
s2.push(400)
s2.push(500)


storageStack.printStorage()
s2.pop()
s2.pop()
s2.pop()
s2.pop()
s2.pop()


s1.pop()
s1.pop()


storageStack.printStorage()



