import Foundation

/*
 
 Rabin Karp Subsring Searcing alg.
 - find pattern in text.
 - using hashing (we use rolling hash function)
 -
 
 https://en.wikipedia.org/wiki/Rabin–Karp_algorithm
 
 ref: https://www.topcoder.com/community/data-science/data-science-tutorials/introduction-to-string-searching-algorithms/
 
 ex: finger print matching
 
 use two hash functions h1, h2 to reduce collisions
 
 */



class RabinKarp {
    
    let M: Int
    let N: Int
    let P: Int // prime
    let C = 1000000007 //1000000007 // 10^9 + 7
    var pr = [1]
    
    init(prime P: Int, patternSize M: Int, textSize N: Int) {
        self.P = P
        self.M = M
        self.N = N
    }
    
    func computePowerPrimes() {
        
        for i in 1 ... M {
            pr.append((pr[i - 1] * P) % C)
        }
    }
    
    func hash(array: Array<Int>) -> Int {
        var HV = 0
        for i in 0 ..< M {
            HV = (HV % C + (array[i] * pr[M - i]) % C) % C
            //    HVa = (HVa + a[i] * pr[M - i]) % C
        }
        return HV
    }
    
    func rollingHash(b: Array<Int>, i: Int, HVb: Int) -> Int {
        //    let oldValue = b[i - M] * pr[M]
        //    let removeOldValue = (HVb - oldValue + b[i - M] * C) * P
        //    let newValue = removeOldValue + b[i] * P
        //    HVb = newValue % C
        //        print((937232645 - 490451396 + 105000000735) % C)
        
        
        let oldValue = (b[i - M] * pr[M]) % C
        //        print("oldValue", HVb, oldValue, (b[i - M] * C))
        let removeOldValue = (((HVb - oldValue) + (b[i - M] * C)) * P) % C
        //        print("removeOldValue", removeOldValue)
        let newValue = (removeOldValue + (b[i] * P) % C)
        //        print("newValue", newValue)
        return newValue % C
    }
    
    
}



public func search(text b: Array<Int>, pattern a: Array<Int>) {
    let M = a.count
    let N = b.count
    var count = 0
    
    let h1 = RabinKarp(prime: 23, patternSize: M, textSize: N)
    let h2 = RabinKarp(prime: 31, patternSize: M, textSize: N)
    // 1. Compure powers of prime
    h1.computePowerPrimes()
    h2.computePowerPrimes()
    
    // 2. Find HVa
    let HVa = h1.hash(array: a)
    let HVa2 = h2.hash(array: a)
    // 3. Find HVb
    var HVb = h1.hash(array: Array(b[0 ... M - 1]))
    var HVb2 = h2.hash(array: Array(b[0 ... M - 1]))
    // 4. Compare
    if HVa == HVb && HVa2 == HVb2 {
        count += 1
    }
    // 5. Rolling Hash
    for i in M ..< N {
        HVb = h1.rollingHash(b: b, i: i, HVb: HVb)
        HVb2 = h2.rollingHash(b: b, i: i, HVb: HVb2)
        //        print(HVb)
        if HVa == HVb && HVa2 == HVb2 {
            count += 1
        }
    }
    print(count)
}

