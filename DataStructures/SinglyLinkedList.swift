/// Single Linked List
/*
 - Size; size(head)
 - Print linked list; print(head)
 - Print linked list in reverse order; printInReverse(head)
 - Insert new element; insert(data, atIndex, head)
 - delete element; delete(atIndex, head)
 - delete all occurences of data; delete(data, head)
 - remove duplicates; removeDuplicates(head); sorted list
 - reverse linked list (iterative)
 - reverse linked list (recurssive)
 */


import Foundation


public struct SinglyLinkedList<T: Comparable> {
    // Node class
    class Node<T: Comparable> {
        var data: T
        var next: Node?
        public init(data: T) {
            self.data = data
        }
    }
    
    // Head
    var head: Node<T>?
    
    public init() {
        
    }
    
    // MARK: - public methods
    public func sizeOfList() -> Int {
        
        return sizeOfLinkedList(head: head)
    }
    
    public func printList() {
        
        printLinkedList(head: head)
    }
    
    public func printListReversed() {
        printLinkedListInReverseOrder(head: head)
    }
    
    mutating public func append(_ data: T) {
        
        self.head = append(data: data, head: self.head)
    }
    
    mutating public func insert(_ data: T, atIndex index: Int) {
        
        self.head = insert(data: data, atIndex: index, head: self.head)
    }
    
    mutating public func delete(atIndex index: Int) {
        
        self.head = delete(atIndex: index, head: self.head)
    }
    
    mutating public func deleteAll(occurencesOf data: T, sorted: Bool) {
        
        self.head = deleteAll(occurencesOf: data, sorted: sorted, head: self.head)
    }
    
    mutating public func removeDuplicatesInSortedList() {
        self.head = removeDuplicatesInSortedList(head: self.head)
    }
    
    mutating public func reverseList() {
        self.head = reverseLinedList(head: self.head)
    }
    
    
    
    
//  reverse linked list (recurssive)
    
}

// MARK: - private methods
extension SinglyLinkedList {
    
    fileprivate func sizeOfLinkedList<T>(head: Node<T>?) -> Int {
        // return if head is nil
        guard
            head != nil
            else {
                return 0
        }
        
        var current = head
        var count = 0
        while (current != nil) {
            count += 1
            current = current?.next
        }
        
        return count
    }
    
    // Print linked list; print(head)
    fileprivate func printLinkedList<T>(head: Node<T>?) {
        
        guard
            head != nil
            else {
                return
        }
        var current = head
        while current != nil {
            print(current!.data, terminator: " -> ")
            current = current?.next
        }
        print("nil")
    }
    
    // Print linked list in reverse order; printInReverse(head)
    func printLinkedListInReverseOrder<T>(head: Node<T>?) {
        
        guard
            head != nil
            else {
                return
        }
        printLinkedListInReverseOrder(head: head?.next) // Recursive call
        print(head!.data, terminator: " <- ")
    }
    
    
    
    fileprivate func append(data: T, head: Node<T>?) -> Node<T>? {
        
        var currentHead: Node<T>? = head
        // Create new node
        let newNode = Node(data: data)
        if currentHead == nil {
            currentHead = newNode
            return currentHead
        } else {
            
            while currentHead!.next != nil {
                currentHead = currentHead!.next
            }
            
            currentHead!.next = newNode
            return head
        }
    }
    
    fileprivate func insert(data: T, atIndex index: Int, head: Node<T>?) -> Node<T>? {
        // handle head is nil
        guard
            head != nil
            else {
                return nil
        }
        let newNode = Node(data: data)
        // handle head node changes.
        if index == 0 {
            newNode.next = head
            return newNode
        }
        
        var currentHead = head
        // handle 1 to previous of new node index
        for _ in 0 ..< index - 1 {
            currentHead = currentHead!.next
            guard currentHead != nil else {
                return head
            }
        }
        // insert new node
        // link right path to new node
        newNode.next = currentHead!.next
        // link new node to current head
        currentHead!.next = newNode
        return head
    }
    
    // delete element; delete(atIndex, head)
    fileprivate func delete(atIndex index: Int, head: Node<T>?) -> Node<T>? {
        // if head is nil
        guard
            head != nil
            else {
                return head
        }
        
        var currentHead = head
        // handle if index is 0
        if index == 0 {
            let deletingNode = currentHead
            currentHead = deletingNode!.next
            deletingNode!.next = nil
            return currentHead
        }
        // handle for 1 .. previous of deleting node
        for _ in 0 ..< index - 1 {
            currentHead = currentHead!.next
            guard currentHead != nil else {
                return head
            }
        }
        // delete node
        if currentHead!.next != nil {
            let deletingNode = currentHead!.next
            currentHead!.next = deletingNode!.next
        }
        
        return head
    }
    
    // delete all occurences of data; delete(data, head); unsorted; sorted;
    fileprivate func deleteAll(occurencesOf data: T, sorted: Bool, head: Node<T>?) -> Node<T>? {
        // return if head is nil
        guard
            head != nil
            else {
                return head
        }
        
        var currentHead = head
        while (currentHead != nil) && (currentHead!.next != nil) {
            
            // delete node
            if currentHead!.next!.data == data {
                currentHead!.next = currentHead!.next!.next
            } else {
                // move current head
                currentHead = currentHead!.next
            }
            
            if sorted && currentHead!.data > data {
                break
            }
        }
        // delete first node
        if head!.data == data {
            return head!.next
        }
        
        return head
    }
    
    // remove duplicates; removeDuplicates(head); sorted list
    fileprivate func removeDuplicatesInSortedList(head: Node<T>?) -> Node<T>? {
        // return if head is nil
        guard
            head != nil
            else {
                return head
        }
        
        var currentHead = head
        // find first occurances of data
        while (currentHead != nil) && (currentHead!.next != nil) {
            
            if currentHead!.data == currentHead!.next!.data {
                // remove next duplicate node
                currentHead!.next = currentHead!.next!.next
            } else {
                // move current head
                currentHead = currentHead!.next
            }
        }
        
        // delete first node
        if head!.data == head!.next?.data {
            return head!.next
        }
        
        return head
    }
    
    
    
    //  reverse linked list (iterative)
    fileprivate func reverseLinedList(head: Node<T>?) -> Node<T>? {
        // return if head is nil
        guard
            head != nil
            else {
                return nil
        }
        
        var previousNode: Node<T>?
        var currentHead = head
        while currentHead != nil {
            // make current head as temp
            let nextNode = currentHead!.next
            // remove current head next link and reconnect with previous node
            currentHead!.next = previousNode
            // move previous node to current node
            previousNode = currentHead
            // move current node to next node
            currentHead = nextNode
        }
        return previousNode
    }
    
}



// OUTPUT


class Person {
    var name: String?
}

var p1: Person? = Person()
p1?.name = "asfas"
while (p1 != nil) && (p1!.name != nil)  {
    print("hello...")
    p1?.name = nil
}


var testSLL: SinglyLinkedList<Int> = SinglyLinkedList()
testSLL.append(4)
testSLL.append(3)
testSLL.append(2)
testSLL.append(5)
testSLL.append(1)

testSLL.printList()
//testSLL.delete(atIndex: 2)
testSLL.reverseList()
testSLL.printList()



var sll: SinglyLinkedList<Int> = SinglyLinkedList()
//sll.printList()

//sll.append(400)
sll.append(1)
sll.append(1)
sll.append(1)
sll.append(2)
sll.append(2)
sll.append(2)
sll.append(3)
//sll.append(400)
sll.append(4)
sll.append(4)
sll.append(4)
//sll.append(400)
sll.append(6)
sll.append(7)
sll.append(7)
sll.append(7)
sll.append(7)
sll.append(7)
sll.append(7)

//sll.append(400)
sll.append(8)
sll.append(8)
sll.append(8)
//sll.append(400)

//sll.printList()
//
//sll.insert(5, atIndex: 4)
//
//sll.printList()
//print(sll.sizeOfList())

//sll.delete(atIndex: 0)
sll.printList()

sll.removeDuplicatesInSortedList()
//sll.deleteAll(occurencesOf: 4, sorted: true)
sll.printList()

//let n1 = Node(data: 5)
//let n2 = Node(data: 6)
//let n3 = Node(data: 7)
//n1.next = n2
//n2.next = n3
//
//sizeOfLinkedListed(head: n1)
//
//
//
//
//printLinkedList(head: n1)
//
//
//
//printLinkedListInReverseOrder(head: n1)
//print("nil")















