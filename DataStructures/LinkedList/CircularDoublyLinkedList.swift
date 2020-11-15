/**
    
    Circular Doubly linked list

    https://www.geeksforgeeks.org/circular-linked-list/
    - Circular Doubly Linked Lists are used for implementation of advanced data structures 
        like Fibonacci Heap.
    
    operations:
    https://www.sanfoundry.com/c-program-circular-doubly-linked-list/

    1.insert at beginning
    2.insert at end
    3.insert at position
    4.sort linked list
    5.delete node at position
    6.updatenodevalue
    7.search element
    8.displaylist from beginning
    9.display list from end


*/


struct CircluarDoublyLinkedList<Element: Comparable> {

    class Node {
        var value: Element
        var next: Node?
        var previous: Node?

        init(_ value: Element, tail: Node?) {

            self.value = value
            self.next = tail?.next
            self.previous = tail
            // add new node to link
            tail?.next = self
           
             print(" \(String(describing: self.previous?.value)) <-- \(self.value)  --> \(String(describing: self.next?.value))")
        }
    }


    init() { }

    var count = 0

    var tail: Node?

    // operations

    mutating func insert(_ value: Element) {

        let new = Node(value, tail: tail)
        tail = new

        count += 1

        if count == 1 {
            tail?.next = tail
            tail?.previous = tail
        }
    }


    // traversal
    func forwardTraversal() {

        if count == 0 {
            print("nil")
        } else if count == 1 {
            print(tail!.value)
        } else {
            var current: Node? = tail?.next

            var count = 0
            while count < self.count {
                print(current!.value, terminator: " -> ")
                current = current!.next   
                count += 1
            }
            print()
        }        
    }

}


var cdll = CircluarDoublyLinkedList<Int>()
cdll.insert(5)
cdll.insert(10)
cdll.insert(15)

print("count: \(cdll.count)")
cdll.forwardTraversal()







