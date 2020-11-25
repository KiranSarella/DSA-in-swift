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

/// Separate chaining with list head cells
struct HashTable<Key:Hashable, Value> {

    private typealias Element = (key: Key, value: Value)    // named tuple
    private typealias Bucket = [Element]
    private var table: [Bucket] 
    private var primeCapacity: Int

    private (set) var count = 0

    var isEmpty: Bool { return count == 0 }


    init(capacity: Int) {
        assert(capacity > 0)
        // get prime capacity
        let primeCapacity = getPrime(capacity)
        print(primeCapacity)
        self.table = [Bucket](repeating: [], count: primeCapacity)
        self.primeCapacity = primeCapacity
    }

    // get value
    func getValue(forKey key: Key) -> Value? {
        let head = getHash(forKey: key)

        for (i, bucket) in self.table[head].enumerated() {
            if bucket.key == key {
                return self.table[head][i].value
            }
        }
        return nil
    }

    // set value
    mutating func setValue(_ value: Value, forKey key: Key) {
        let head = getHash(forKey: key)

        // check if key exists in the chain
        // loop buckets in the chain
        for (i, bucket) in self.table[head].enumerated() {
            if bucket.key == key {
                // update value
                self.table[head][i].value = value 
                return
            }
        }

        // create new bucket in the chain
        table[head].append((key: key, value: value))
        count += 1
        return
    }

    // remove value
    mutating func removeValue(forKey key: Key) {
        let head = getHash(forKey: key)

        // loop buckets in the chain
        for (i, bucket) in self.table[head].enumerated() {
            if bucket.key == key {
                // remove bucket
                self.table[head].remove(at: i)
                count -= 1
                return
            }
        }
    }


    // get hash for key
    func getHash(forKey key: Key) -> Int {
        return abs(key.hashValue % primeCapacity)
    }

}

extension HashTable {
    
    subscript(key: Key) -> Value? {
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
        let pairs = self.table.flatMap { b in b.map { e in "\(e.key) = \(e.value)" } }
        return pairs.joined(separator: ", ")
    }
    
    /// A string that represents the contents of
    /// the hash table, suitable for debugging.
    public var debugDescription: String {
        var str = ""
        for (i, bucket) in self.table.enumerated() {
            let pairs = bucket.map { e in "\(e.key) = \(e.value)" }
            str += "bucket \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}

var hashTable = HashTable<String, String>(capacity: 10)
hashTable["name"] = "kiran"
hashTable["branch"] = "C.S.E"
hashTable["name"] = "kiran s"
hashTable["branch"] = nil
print(hashTable["name"] as Any)
// print(hashTable)
print(hashTable.debugDescription)
print(hashTable.count)