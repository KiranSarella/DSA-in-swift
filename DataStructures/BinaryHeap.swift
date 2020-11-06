/*

    https://www.programiz.com/dsa/heap-data-structure
    https://github.com/apple/swift-nio/blob/main/Sources/NIO/Heap.swift
    https://github.com/raywenderlich/swift-algorithm-club/blob/master/Heap/Heap.swift


    Binary Heap Data Structure

    - Eighter must be min or max head
    - Complete Binary Tree

    add: append new element to existing tree in level wise
            & do heapify
    remove: remove node and fill with last level last node 
            & d heapify

    Heap Properties: (heap structure)
    (complete binary tree properties)
    - all levels of the heap should be full, except the last one
    - nodes must be filled from leftIndex to right strictly
    (heap property)
    -   max heap: key of each node must be greater then its child nodes
                & the key of the root node is the largest among all other nodes.
        min heap: key of each node is always smaller than the child nodes 
                & the key of the root node is the smallest among all other nodes.


    Heapify: is a process of creating heap (max/min) from a complete binary tree


    1. convert given array to complete binary tree 
        (virtually, swapping elements in the array itself, not creating new tree with Nodes)
    2. convert complete binary tree to heap data structure (heapify)
    3. insert new element at the last
        - do heapify up
    4. remove element (swap element with last element, and remove last)
        - do heapify down
    5. 


    Difference between shift up and shift down?
        - shift up -> one comparision (with parent)
        - shift down -> two comparision (with both child nodes)

    https://discuss.codecademy.com/t/what-are-some-differences-between-heapify-up-and-heapify-down/375384

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

var myHeap = Heap<Int>()
myHeap.insert(10)
myHeap.insert(15)
myHeap.insert(20)
myHeap.insert(17)
myHeap.insert(8)

print(myHeap.storage)

_ = myHeap.remove(20)
print(myHeap.storage)
_ = myHeap.remove()



