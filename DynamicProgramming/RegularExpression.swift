
/**

    https://youtu.be/l3hda49XcDE
    https://www.rexegg.com/regex-quickstart.html

    * -> zero or more - * before char ie.. in a*b, a is before char 
        (in wildcard: * means -> only zero or more chars, no depency with previous char)


    // quantifiers
    * -> a * b (zero or more) ex:=> ab, b, aaab 

    // more characters
    . -> a . b (any single char)  ex:=> ayb, azb



*/


func isMatch(_ str: String, _ pattern: String) -> Bool {

    let str = Array(str)
    let pattern = Array(pattern)

    // dp table
    let ptnArr = Array(repeating: false, count: pattern.count + 1)
    var mem = Array(repeating: ptnArr, count: str.count + 1)
    
    // initial values
    mem[0][0] = true

    // for empty input, the patterns a*, a*b*, a*b*c* .. are all true 
    // (ie. char followed by * is zero char case)
    // so keep previous match value by ignoring above patterns
    for p in 1...pattern.count {
        let ptn = pattern[p - 1]
        if ptn == "*" {
            mem[0][p] = mem[0][p - 2]
        }
    }

    // 
    for s in 1...str.count {
        let char = str[s - 1]
        print("char:", char)
        for p in 1...pattern.count {
            let ptn = pattern[p - 1]
            print("ptn:", ptn)
            // * 
            if ptn == "*" {
                // case 1: zero chars   [s][p - 2] (tatally ignoring both a,*)
                mem[s][p] = mem[s][p-2]

                // case 2: one or more chars [s - 1][p] (consider both a,*) ex: a*b -> aaaaaab
                // case 3: also if previous char may be dynamic value (.*) a.*b -> ab, axxxb
                if pattern[p - 2] == str[s - 1] || pattern[p - 2] == "."  {
                    mem[s][p] = mem[s][p-2] || mem[s-1][p]
                }
            } else if ptn == char {
                // previous match value is carry forwarded; 
                mem[s][p] = mem[s-1][p-1]
            } else if ptn == "." {
                // previous match value is carry forwarded; 
                mem[s][p] = mem[s-1][p-1]
            }
        }
    }

    // print(mem)
    return mem[str.count][pattern.count]
} 

print(isMatch("axxxxb", "a.*b"))

