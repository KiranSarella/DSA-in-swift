
// ref: https://youtu.be/a9-NtLIs1Kk

// recursion; without memorization
func countBinaryStrings(_ n: Int, _ str: String = "") -> Int {

    // base case
    if n == 0 { 
        print(str)
        return 1
    }

    // if last digit is 1 -> one possiblity (0);
    if let lastDigit = str.last, lastDigit == "1" {
        return countBinaryStrings(n - 1, str + "0")
    }
    // if last digit is 0 -> two possibilities (0 or 1); 
    else {
        return countBinaryStrings(n - 1, str + "0") + countBinaryStrings(n - 1, str + "1")
    }
}


// print(countBinaryStrings(5))
// print(countBinaryStrings(4))


// using dynamic programming; memorization; bottom up
func countBinaryStringsDP(of n: Int) -> Int {

    if n <= 0 { return 0 }

    // initial values
    var mem = ["0", "1"]
    
    for _ in 1..<n {

        var nextLevel = [String]()
        // for '0', loop all
        for item in mem {
            nextLevel.append( "0" + item )
        }
        // for '1', break if msb is '1'
        for item in mem {
            if item.first! == "1" { break }
            nextLevel.append( "1" + item )
        }
        mem = nextLevel
    }

    print(mem)
    return mem.count
}

print(countBinaryStringsDP(of: 4))

