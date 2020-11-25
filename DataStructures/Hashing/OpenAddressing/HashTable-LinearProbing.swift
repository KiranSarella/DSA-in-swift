/**

    https://www.geeksforgeeks.org/implementing-hash-table-open-addressing-linear-probing-cpp/?ref=rp

    Linear Probing (examining next slots linearly)
    - interval between probes is fixed (usually 1).

    insert - if current slot is filled, place at next empty slot
    search - probe until empty slot, if reached to end, again from top till where started
    deletion - maintain deleted flag (or) replace with last filled slot - (extra traversal)

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

    private typealias Element = (key: String, value: Value, deleted: Bool)
    
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
        var head = getHash(forKey: key)
        
        while self.table[head] != nil &&
            self.table[head]?.deleted == false &&
            self.table[head]?.key != key {
                head = (head + 1) % primeCapacity
        }
        // now check head
        if let (_key, value, deleted) = self.table[head], _key == key, !deleted {
            return value
        }
        
        return nil
    }

    // set value
    mutating func setValue(_ value: Value, forKey key: String) {
        var head = getHash(forKey: key)
        
        if let (_key, _, _) = self.table[head] {

            if _key == key {
                // replace with new value
                self.table[head] = (key: key, value: value, deleted: false)
                count += 1
                print("inserted - \(key)")
            } else {
                print("COLLISION OCCURRED for \(key) - at \(_key): \(head)")
                // probe next free slot, if not full
                if self.count < self.primeCapacity {
                    let startKey = _key
                    head = (head + 1) % primeCapacity
                    print("head:: \(head)")
                    // loop until
                    // - find empty slot
                    // - find deleted slot
                    // - reached to started slot
                    while self.table[head] != nil &&    // till empty slot
                        self.table[head]?.deleted == false &&   // till deleted slot found
                        self.table[head]?.key != startKey &&    // till reached to start key - to avoid cycle
                        self.table[head]?.key != key {  // till existing key found - to replace value
                            head = (head + 1) % primeCapacity
                            print("-> \(head)")
                    }
                    // now check head
                    if self.table[head] == nil || self.table[head]!.deleted {
                        // insert new element
                        self.table[head] = (key: key, value: value, deleted: false)
                        print("inserted - \(key) at: \(head)")
                        count += 1
                    }

                    // replace element
                    if self.table[head]?.key == key {
                        self.table[head] = (key: key, value: value, deleted: false)
                        print("replaced - \(key) at: \(head)")
                    }

                } else {
                    print("TABLE FULL", key) // have to apply resizing
                }
            }
        } else {
            // create new bucket in the chain
            table[head] = (key: key, value: value, deleted: false)
            count += 1
        }
    }

    // remove value
    mutating func removeValue(forKey key: String) {
        var head = getHash(forKey: key)
        
        while self.table[head] != nil &&
            self.table[head]?.deleted == false &&
            self.table[head]?.key != key {
                head = (head + 1) % primeCapacity
        }
        // now check head
        if let (_key, value, deleted) = self.table[head], _key == key, !deleted {
            table[head] = (key: key, value: value, deleted: true)
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
                let pairStr = "\(pair.key) = \(pair.value) - \(pair.deleted)"
                str += "bucket \(i): " + pairStr + "\n"
            } else {
                str += "bucket \(i): " + "" + "\n"
            }
        }
        return str
    }
}

var hashTable = HashTable<String>(capacity: 4)
hashTable["abc"] = "abc-value"
hashTable["xyz"] = "xyz-value"
hashTable["cba"] = "cba-value"
hashTable["aaa"] = "aaa-one"
hashTable["bbb"] = "bbb-two"
hashTable["ccc"] = "ccc-three"
print(hashTable["abc"] as Any)
print(hashTable["bbb"] as Any)
hashTable["abc"] = nil
hashTable["cba"] = "cba-value 2"
// hashTable["cba"] = "reversed kiran"

print(hashTable.debugDescription)
print(hashTable.count)