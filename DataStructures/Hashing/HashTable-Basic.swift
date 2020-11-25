/**

    Hash Table

    https://en.wikipedia.org/wiki/Hash_table
    https://github.com/raywenderlich/swift-algorithm-club/tree/master/Hash%20Table
    https://www.programiz.com/dsa/hash-table

    - A hash table is nothing more than an array (fixed size).
    - key -> hash value -> array size modulo -> index
    - insert, get, remove - O(1)
    - avoide collisions
        - large array
        - use prime number for the array size (why ?)

    - use chaining (array is treated as buckets, 
        each bucket as (chain of linked lists or other array))
    - open addressing (put the element in the next unused bucket)

    Operations
    - insert
    - get element
    - update
    - remove

    How to calculate hash value ?
    
    - key % prime_capacity
    collision resolution:
    - seperate chaining
        - linked list
        - list head cells
        - other structures
    - open addressing
        - coalesced hashing
        - cuckoo hashing
        - hopscotch hashing
        - robin hood hashing
    - 2-choice hashing

    resizing:
        - ..





*/

// generate prime

func getPrime(_ n: Int) -> Int {
    var n = n
    if n % 2 == 0 {
        n += 1
    }

    while !checkPrime(n) {
        n += 2
    }

    return n
}

func checkPrime(_ n: Int) -> Bool {
    if n == 0 || n == 1 { return false }

    for _ in 2..<(n / 2) {
        if n % 2 == 0 {
            return false
        }
    }

    return true
}

/// Basic - will cause collision
struct HashTable<Value> {

    private typealias Element = (key: String, value: Value)
    
    private var table: [Element?] 
    private var primeCapacity: Int

    private (set) var count = 0

    var isEmpty: Bool { return count == 0 }

    init(capacity: Int) {
        assert(capacity > 0)
        // get prime capacity
        let primeCapacity = getPrime(capacity)
        print(primeCapacity)
        self.table = [Element?](repeating: nil, count: primeCapacity)
        self.primeCapacity = primeCapacity
    }

    // get value
    func getValue(forKey key: String) -> Value? {

        let head = getHash(forKey: key)

        if let (_key, value) = self.table[head], _key == key {
            return value
        }

        return nil
    }

    // set value
    mutating func setValue(_ value: Value, forKey key: String) {
        let head = getHash(forKey: key)

        if let (_key, value) = self.table[head] {

            if _key == key {
                self.table[head] = (key: key, value: value)
                // self.table[head].value = value
                print("inserted - \(key)")
            } else {
                print("COLLISION OCCURRED - \(key)")
            }

            return
        }

        // create new bucket in the chain
        table[head] = (key: key, value: value)
        count += 1
        return
    }

    // remove value
    mutating func removeValue(forKey key: String) {
        let head = getHash(forKey: key)

        // loop buckets in the chain
        if self.table[head] != nil {
            self.table[head] = nil
            count -= 1
        }
    }


    // get hash for key
    func getHash(forKey key: String) -> Int {

        var charSum = 0
        for ascii in key.utf8 {
            charSum += Int(ascii)
        }

        return abs(charSum % primeCapacity)
    }

}

extension HashTable {
    
    subscript(key: String) -> Value? {
        get {
            return getValue(forKey: key)
        }
        set {
            if let value = newValue {
                setValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }

}

extension HashTable: CustomStringConvertible {
    /// A string that represents the contents of the hash table.
    public var description: String {

        let items = self.table.compactMap {$0}  
        let pairs = items.map { e in "\(e.key) = \(e.value)" }
        return pairs.joined(separator: ", ")
    }
    
    /// A string that represents the contents of
    /// the hash table, suitable for debugging.
    public var debugDescription: String {
        var str = ""
        for (i, pair) in self.table.enumerated() {
            if let pair = pair {
                let pairStr = "\(pair.key) = \(pair.value)"
                str += "bucket \(i): " + pairStr + "\n"
            } else {
                str += "bucket \(i): " + "" + "\n"
            }
        }
        return str
    }
}

var hashTable = HashTable<String>(capacity: 4)
hashTable["abc"] = "kiran"
hashTable["xyz"] = "ios"
hashTable["cba"] = "reversed kiran"
print(hashTable["abc"] as Any)
hashTable["abc"] = nil
hashTable["cba"] = "reversed kiran"

print(hashTable.debugDescription)
print(hashTable.count)