/**

    Circular Linked List

    https://youtu.be/gztwNv4o_9E
    https://www.faceprep.in/c/circular-linked-list/
    https://www.studytonight.com/data-structures/circular-linked-list#
    

    Pointers:
    - tail  (head = tail.next)

    Operations:
    - insert beginning, 
    - insert end,
    - remove beginning,
    - remove end,
    - find
    - update element
    - insert at position
    - remove at position
    - remove element
    - reverse list

*/


struct CircluarLinkedList<Element: Comparable> {

    class Node {
        var value: Element
        var next: Node?

        init(_ value: Element, tail: Node?) {
            self.value = value
            self.next = tail?.next
            tail?.next = self
        }
    }

    var count = 0

    init() { }

    var tail: Node?

    // operations

    mutating func insert(_ value: Element) {

        let new = Node(value, tail: tail)
        tail = new

        count += 1

        if count == 1 {
            tail?.next = tail
        }
    }


    // traversal
    func forwardTraversal() {
        var current: Node? = tail?.next

        repeat {
            if current != nil {
                print(current!.value)
                current = current!.next   
            }
        } while current != nil && current!.value != tail?.next?.value

    }

}


var cll = CircluarLinkedList<Int>()
cll.insert(5)
cll.insert(10)
cll.insert(15)

print("count: \(cll.count)")
cll.forwardTraversal()