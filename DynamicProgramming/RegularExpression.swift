
// ref: https://www.rexegg.com/regex-quickstart.html


// quantifiers
* -> a * b  ex:=> ab, b, aaab
+ -> a + b  ex:=> ab, aaaab

// more characters
. -> a . b  ex:=> ayb, azb

// *
func regAstrick(input: String, pattern: String) -> Bool {

    var input = Array(input)
    var pattern = Array(pattern)

    var t = [[Bool]]()

    // initial values
    for i in 0..<input.count {
        t[0][i] = true
    }

    


} 