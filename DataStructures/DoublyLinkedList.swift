/**

    https://gist.github.com/loromits/945039733a1da524c82860a48d65fcf6



    Doubly Linked List

    pointers:
        head, 
        tail

    operations:
        insert front
        remove front
        insert rear
        remove rear

        insert after
        insert before

        remove element

    traversal:
        forward
        backward



*/


struct DoublyLinkedList<Element> {

    class Node {
        var value: Element
        var next: Node?
        var previous: Node?

        init(_ value: Element, next: Node?, previous: Node?) {
            // link next, previous references to new node
            (self.value, self.next, self.previous) = (value, next, previous)
            // link new node to next, previous nodes
            next?.previous = self
            previous?.next = self
        }

        // var description: String {
        //     return "\(String(describing:previous))<-\(value):->\(String(describing: next))"
        // }

       
    }

    var count = 0 

    var isEmpty: Bool {
        return count == 0
    }

    init() { }

    // pointers
    var head: Node?     
    var tail: Node?


    // operations
    mutating func insertFront(_ element: Element) {

        head = Node(element, next: head, previous: nil)

        // if empyt, both head & tail should be same
        isEmpty ? tail = head : ()
        
        count += 1
    }

    mutating func insertRear(_ element: Element) {
        // insert new element at the end
        tail = Node(element, next: nil, previous: tail)

        // if empyt, both head & tail should be same
        isEmpty ? head = tail : ()
        
        count += 1
    }

    mutating func removeFront() -> Element? {

        // capture removable element
        let current = head
        if let current = current {
            // move head to next
            head = current.next
            // remove reference 
            head?.previous = nil

            count -= 1

            // if empyt, both head & tail should be same
            isEmpty ? tail = nil : ()
        }

        return current?.value
    }

    mutating func removeRear() -> Element? {
        
        let current = tail
        if let current = current {
            // move tail to previous
            tail = current.previous
            // remove reference
            tail?.next = nil

            count -= 1
            // if empyt, both head & tail should be same
            isEmpty ? head = nil : ()
        }

        return current?.value
    }

   
    // MARK: - traversal
    func forwardTraversal() {
        var current = head
        while current != nil {
            print(current!.value)
            current = current!.next
        }
    }

    func backwardTraversal() {
        var current = tail
        while current != nil {
            print(current!.value)
            current = current!.previous
        }
    }

}




var dll = DoublyLinkedList<Int>()
dll.insertFront(15)
dll.insertFront(10)
dll.insertFront(5)
dll.insertRear(20)
dll.insertRear(25)
print("count: \(dll.count)")
dll.forwardTraversal()
_ = dll.removeFront()
dll.forwardTraversal()
print("count: \(dll.count)")