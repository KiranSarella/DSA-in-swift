

/**

    ref: https://youtu.be/3ZDZ-N0EPV0

    * -> zero more chars (in regex: * means zero or more * before char ie.. in a*b, a is before char)
    ? -> one char

*/

func isMatch(_ str: String, _ pattern: String) -> Bool {

    let str = Array(str)
    let pattern = Array(pattern)

    // {empty} + {pattern chars}
    // {empty} + {str chars}
    let patternArr = Array(repeating: false, count: pattern.count + 1)
    // [str][ptn]
    var mem = Array(repeating: patternArr, count: str.count + 1)

    // true if pattern and str are empty
    mem[0][0] = true

    // assign {emtpy state value ie. mem[0][0] value} for all beginning of ***'s pattern (zero chars)
    for p in 1...pattern.count {
        let emptyString = 0
        let currentPtn = pattern[p - 1]
        if currentPtn == "*" {
            // asisgn previous state to current state
            mem[emptyString][p] = mem[emptyString][p - 1]
        } else {
            // break if starting ***'s pattern completes
            break
        }
    }

    // loop for each char of the input
    for s in (1...str.count) {
        let currentChar = str[s - 1]
        // loop for each pattern char
        for p in (1...pattern.count) {
            let currentPtn = pattern[p - 1]
            print(" \(str[0..<s]) ==> \(pattern[0..<p])")
            
            if currentPtn == currentChar {
                // previous match value is carry forwarded;
                mem[s][p] = mem[s-1][p-1]
            } else if currentPtn == "?" {
                // previous match value is carry forwarded; 
                mem[s][p] = mem[s-1][p-1]
            } else if currentPtn == "*" {
                // case 1: exclude * -> get its match value (zero chars) [s][p-1]
                // or
                // cae 2: include * -> get its match value (any number of chars) [s-1][p]
                mem[s][p] = mem[s][p-1] || mem[s-1][p]
            }
        }
    }

    print(mem)

    return mem[str.count][pattern.count]
}

print(isMatch("axxaxxb", "a*b"))


