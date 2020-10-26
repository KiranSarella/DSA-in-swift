import Foundation


// ref: https://stackoverflow.com/questions/11289495/what-is-the-fastest-way-to-compute-large-power-of-2-modulo-a-number

let MODULO: Int = 1000000007 // (10^9 + 7) large prime

public func powerWithModulo(_ a: Int, _ n: Int) -> Int {
    
    var n = n
    var ret = 1
    var a = a
    while (n > 0) {
        if (n & 1) == 1 {
            ret = ret * a % MODULO
        }
        
        n = n >> 1
        a = (a * a) % MODULO
    }
    return ret
}


func power(_ a: Int, _ b: Int) -> Int {
    
    let largePrime = 101//1000000007
    
    var b = b
    var result = 1
    var base = a
    
    base = base % largePrime
    while (b > 0) {
        // If (power) is odd, multiply (base) with result.
        if (b & 1) == 1 {
            result = result * base
            result = result % largePrime
        }
        
        base = base * base  // a = a^2
        base = base % largePrime
        b = b >> 1 // b = b/2
        
    }
    return result
}



// usage

// ref: https://en.wikipedia.org/wiki/Triangular_number
// http://codepumpkin.com/find-nth-digit-series-3-5-6-9-10-12/


let MODULO: Int = 1000000007 // (10^9 + 7)

func sumOfNaturalNumbers(_ n: Int) -> Int {
    return n * (n + 1) / 2
}

func twoPowerWithModulo(_ n: Int) -> Int {
    var n = n
    var ret = 1
    var a = 2
    while (n > 0) {
        // if n is odd
        if (n & 1) == 1 {
            ret = ret * a % MODULO
        }
        
        n = n >> 1
        a = (a * a) % MODULO
    }
    return ret
}


func getTwoSetBitsNumber(_ n: Int) -> Int {
    
    var r = 0
    var i = 1 // first set bit
    
    r = sumOfNaturalNumbers(i)
    
    while r < n {
        i += 1
        r = sumOfNaturalNumbers(i)
        print(r)
    }
    let secondSetBit = i - (r - n) - 1
    let first = twoPowerWithModulo(i)
    let second = twoPowerWithModulo(secondSetBit)
    let result =  (first + second) % MODULO
    
    return result
}

//sumOfNaturalNumbers(5000)

//getTwoSetBitsNumber(15)

func next2BitsNum(n: Int) {
    var bit0 = 0
    var bit1 = 1
    for _ in 0 ..< n - 1 {
        bit0 += 1
        if bit0 == bit1 {
            bit0 = 0
            bit1 += 1
        }
    }
    
    print((1 << bit0 | (1 << bit1)))
}

//next2BitsNum(n: 15)

func printTwoOnceNo(x: Int) {
    var x = x
    var count = 0
    var num = x
    while x > 0 {
        print(x,count)
        x = x & (x - 1)
        count += 1
        if count == 2 {
            print(num)
        }
    }
    
}

printTwoOnceNo(x: 15)

/*
1 + 2 + 3 + 4 + 5 = 15

1 + 2 + 3 + 4 = 10
 
  n * n - 1 = (x * 2)
 
*/


//let a = 30303030
//let b = 5
//let sum = a + b
//
////  % 1000000007
//
//let p = 30303030 % 1000000007
//let q = 5 % 1000000007
//let ans = (p + q) % 1000000007

//: [Next](@next)

