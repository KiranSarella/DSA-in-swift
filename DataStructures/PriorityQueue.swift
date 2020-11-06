

/**

    https://github.com/raywenderlich/swift-algorithm-club/tree/master/Priority%20Queue
    https://github.com/apple/swift-nio/blob/main/Sources/NIO/PriorityQueue.swift


    

*/


struct Heap<Element: Comparable> {

    internal private(set) var storage: ContiguousArray<Element> = []

    internal func comparator(_ lhs: Element, _ rhs: Element) -> Bool {
        // return lhs > rhs // max-heap
        return lhs < rhs // min-heap
    }

    private func parentIndex(_ i: Int) -> Int {
        return (i-1) / 2
    }

    internal func leftIndex(_ i: Int) -> Int {
        return 2*i + 1
    }

    internal func rightIndex(_ i: Int) -> Int {
        return 2*i + 2
    }

    var lastIndex: Int { self.storage.count - 1 }

    var count: Int { self.storage.count }
    
    internal mutating func insert(_ value: Element) {
        storage.append(value)
        // place new element at the correct position
        heapifyUp(storage.count - 1)
    }

    /**
    * Takes a child node and looks at its parents; if a parent is not larger
    * (max-heap) or not smaller (min-heap) than the child, we exchange them.
    */
    internal mutating func heapifyUp(_ index: Int) {

        var childIndex = index
        var parentIndex = self.parentIndex(childIndex)

        var child = storage[childIndex]
        var parent = storage[parentIndex]

        while childIndex > 0 && comparator(child, parent) {
            self.storage.swapAt(childIndex, parentIndex)

            // new indexes
            childIndex = self.parentIndex(childIndex)
            parentIndex = self.parentIndex(childIndex)

            child = storage[childIndex]
            parent = storage[parentIndex]
        }
    }


    // remove root
    mutating func remove() -> Element? {
        // remove root element
        return remove(index: 0)
    }


    // remove element
    mutating func remove(_ value: Element) -> Bool {
        // get index of the element
        if let index = self.storage.firstIndex(of: value) {
            _ = remove(index: index)
            return true
        } else {
            // given element not exists
            return false
        }
    }

    mutating private func remove(index: Int) -> Element? {
        // empty state
        guard count > 0 else {
            return nil
        }

        let removedElement = self.storage[index]
        // replace current element with last element ()
        self.storage[index] = self.storage[lastIndex]
        // remove last element
        self.storage.removeLast()
        // heapifyDown
        heapifyDown(index)

        return removedElement
    }

    mutating private func heapifyDown(_ currentIndex: Int) {

        let leftIndex = self.leftIndex(currentIndex)
        let rightIndex = self.rightIndex(currentIndex)

        // find valid root among current, leftIndex, right nodes
        var newRootIndex = currentIndex
        // check if leftIndex can be the new root
        if leftIndex <= lastIndex && self.comparator(storage[leftIndex], storage[currentIndex]) {
            newRootIndex = leftIndex
        }
        // check if rightIndex can be the new root
        if rightIndex <= lastIndex && self.comparator(storage[rightIndex], storage[currentIndex]) {
            newRootIndex = rightIndex
        }

        if newRootIndex != currentIndex {
            // move current element to one level down
            self.storage.swapAt(newRootIndex, currentIndex)
            heapifyDown(newRootIndex)
        }
    }


}


struct PriorityQueue<Element: Comparable> {

    fileprivate var heap: Heap<Element>

    init() {
        heap = Heap()
    }

    // insert
    mutating func push(_ element: Element) {
        heap.insert(element)
    }

    // remove max/ min element
    mutating func pop() -> Element? {
        return heap.remove()
    }

    // get max / min element
    func peek() -> Element? {
        return heap.storage.first
    }



    var isEmpty: Bool {
        return heap.storage.isEmpty
    }

    var count: Int {
        return heap.count
    }

    mutating func clear() {
        heap = Heap()
    }

}


var priorityQueue = PriorityQueue<Int>()

priorityQueue.push(10)
priorityQueue.push(8)
priorityQueue.push(12)
priorityQueue.push(14)
priorityQueue.push(15)
priorityQueue.push(1)

print(priorityQueue.peek() ?? "")

_ = priorityQueue.pop()

print(priorityQueue.peek() ?? "")