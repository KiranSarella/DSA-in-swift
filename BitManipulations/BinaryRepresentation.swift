
import Foundation

func getLSB(n: Int) -> Int {
    
    return (n & 1 == 0) ? 0 : 1
}

func binaryRepresentation(n: Int) -> String {
    var n = n
    var result = [Int]()
    
    while n > 0 {
        // get lsb bit
        result.append(getLSB(n: n))
        // remove lsb bit;  n = n / 2
        n = n >> 1
    }
    // convert to string
    let res = result.reduce("") { (str, next) -> String in
        return String(next) + str
    }
    
    return res
}


binaryRepresentation(n: 6)
binaryRepresentation(n: 8)

// recursive
func binaryRepresentationRecursive(n: Int) -> String {
    // base condition
    if n == 0 {
        return ""
    }
    // get lsb
    let lsb = String(getLSB(n: n))
    // .. + lsb
    return binaryRepresentationRecursive(n: n >> 1) + lsb
}

binaryRepresentationRecursive(n: 6)
binaryRepresentationRecursive(n: 8)


