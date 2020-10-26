import Foundation

// http://cutting.io/posts/the-power-of-swift-enums/


public enum BinarySearchTree<T: Comparable> {
    
    case empty  // end of branch
    case leaf(T)   // node that has no children
    indirect case node(BinarySearchTree, T, BinarySearchTree)
    
    public var count: Int {
        switch self {
        case .empty: return 0
        case .leaf: return 1
        case let .node(left, _, right): return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        
        switch self {
        case .empty: return 0
        case .leaf: return 0 // 1
        case let .node(left, _, right): return 1 + max(left.height, right.height)
        }
    }
    
    // Level Order Traversal
    /// Iterative way, using Queue, and nil delimitor
    // https://www.youtube.com/watch?v=86g8jAQug04
    // https://www.youtube.com/watch?v=7uG0gLDbhsI
    public func traverseLevelOrder(process: (T?) -> ()) {
        // Empty tree
        if case .empty = self {
            process(nil)
        }
        
        var queue = [BinarySearchTree]()
        queue.append(self)  // push root.
        queue.append(.empty)
        
        while queue.isEmpty == false {
            
            let current = queue.first!
            
            switch current {
            case .empty:
                process(nil)
                if queue.count != 1 {
                    queue.append(.empty)
                }
            case .leaf(let value):
                process(value)  // print value
            case let .node(left, value, right):
                process(value)  // print value
                
                if case .empty = left {} else {
                    queue.append(left)  // push left child
                }
                
                if case .empty = right {} else {
                    queue.append(right) // push right child
                }
            }
            
            // pop current node
            queue.removeFirst()
            //print()
        }
    }
    
    
    // zigzag / spiral traversal, using two stacks
    // ref: https://www.youtube.com/watch?v=vjt5Y6-1KsQ
    // level 1 .. n; even: left -> right; odd: right -> left
    public func traversaZigZag(process: (T?) -> ()) {
        
        if case .empty = self {
            process(nil)
        }
        // create two stacks
        var s1 = [BinarySearchTree<T>]()
        var s2 = [BinarySearchTree<T>]()
        s1.append(self) // push root to s1
        while (s1.isEmpty == false) || (s2.isEmpty == false) {
//            print("s1 :", s1, "s2:", s2)
            // s1
            while s1.isEmpty == false {
//                print("s1:", s1)
                let current = s1.last!
                
                switch current {
                case .leaf(let value):
                    process(value)
                case let .node(left, value, right):
                    process(value)
                    // even: left -> right
                    if case .empty = right {} else {
                        s2.append(right)
                    }
                    if case .empty = left {} else {
                        s2.append(left)
                    }
                    
                default:
                    break
                }
                s1.removeLast()
            }
            // s2
            while s2.isEmpty == false {
//                print("s2: ", s2)
                let current = s2.last!
                
                switch current {
                case .leaf(let value):
                    process(value)
                case let .node(left, value, right):
                    process(value)
                    // odd: right -> left
                    if case .empty = left {} else {
                        s1.append(left)
                    }
                    if case .empty = right {} else {
                        s1.append(right)
                    }
                    
                default:
                    break
                }
                s2.removeLast()
            }
        }
    }
    
    
    
    
}






extension BinarySearchTree {
    
    // MARK: - Operations
    
    public func insert(_ newValue: T) -> BinarySearchTree {
        switch self {
        case .empty:
            return .leaf(newValue)
        case .leaf(let value):
            if newValue < value {
                return .node(.leaf(newValue), value, .empty)
            } else {
                return .node(.empty, value, .leaf(newValue))
            }
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.insert(newValue) , value, right)
            } else {
                return .node(left, value, right.insert(newValue))
            }
        }
    }
    
}

extension BinarySearchTree {
    
    // MARK: - Traversal
    
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        } else if case .leaf(let value) = self {
            process(value)
        }
    }
    
    public func traversePreOrder(_ process: (T) -> Void) {
        
        switch self {
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process)
            right.traversePreOrder(process)
        case .leaf(let value):
            process(value)
        default:
            break
        }
    }
    
    public func traversePostOrder(_ process: (T) -> Void) {
        
        switch self {
        case let .node(left, value, right):
            left.traversePostOrder(process)
            right.traversePostOrder(process)
            process(value)
        case .leaf(let value):
            process(value)
        default:
            break
        }
    }
}

extension BinarySearchTree: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .empty:
            return "."
        case .leaf(let value):
            return "\(value)"
        case let .node(left, value, right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}



// USAGE



var tree = BinarySearchTree<Int>.empty
//tree = tree.insert(1)
//tree = tree.insert(2)
//tree = tree.insert(3)
//tree = tree.insert(4)
//tree = tree.insert(5)
//tree = tree.insert(6)
//tree = tree.insert(7)


// 4 5 15 0 1 7 17
tree = tree.insert(4)
tree = tree.insert(5)
tree = tree.insert(15)
tree = tree.insert(0)
tree = tree.insert(1)
tree = tree.insert(7)
tree = tree.insert(17)

//3 2 4 1 5
//tree = tree.insert(3)
//tree = tree.insert(2)
//tree = tree.insert(4)
//tree = tree.insert(1)
//tree = tree.insert(5)


tree.traversaZigZag { (value) in
    if let value = value {
        print(value, terminator: " ")
    } else {
        print()
    }
}

//tree.traverseLevelOrder { (value) in
//    if let value = value {
//        print(value, terminator:" ")
//    } else {
//        print()
//    }
//}

//tree.insert(2)
//tree.insert(5)
//tree.insert(10)
//tree.insert(9)
//tree.insert(1)

print(tree)


tree.height
tree.count
//tree.traverseInOrder(process: { print($0) })

//tree.traversePreOrder( { print($0) } )

//tree.traversePostOrder({ print($0, terminator: " ") } )
print()

/*
// read test cases
let t = Int(readLine()!)!
for _ in 0 ..< t {
    _ = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var tree = BinarySearchTree<Int>.empty
    for value in arr {
        tree = tree.insert(value)
    }
    
    print(tree.height)
}*/



