import Foundation

func computeLongestPrefixSufix(_ pattern: [Int], _ M: Int) -> [Int] {
    
    var i = 0
    var j = 0
    
    var lps = [Int](repeating: 0, count: M)
    lps[i] = 0  // first is always zero
    i += 1
    
    while i < M {
        if pattern[i] == pattern[j] {
            j += 1
            lps[i] = j
            i += 1
        } else {
            if j != 0 {
                j = lps[j - 1]
            } else {
                lps[i] = 0
                i += 1
            }
        }
    }
    
    return lps
}


public func KMPSearch(text: [Int], pattern: [Int]) {
    
    let N = text.count
    let M = pattern.count
    
    let lps = computeLongestPrefixSufix(pattern, M)
    var i = 0   // index of text
    var j = 0   // index of pattern
    
    var count = 0
    
    while i < N {
        // current char matched
        if text[i] == pattern[j] {
            i += 1
            j += 1
        }
            // mismatch after j matches
        else if i < N && text[i] != pattern[j] {
            if j != 0 {
                j = lps[j - 1]
            } else {
                i += 1
            }
        }
        // pattern matched
        if j == M {
            count += 1
            j = lps[j-1]
        }
    }
    print(count)
}


// USAGE

/*
 
 Knuth–Morris–Pratt string searching algorithm (or KMP algorithm)
 
 https://en.wikipedia.org/wiki/Knuth–Morris–Pratt_algorithm
 
 ref:
 
 https://www.youtube.com/watch?v=GTJr8OvyEVQ
 https://www.geeksforgeeks.org/searching-for-patterns-set-2-kmp-algorithm/
 
 */

extension Character {
    var asASCII: Int {
        let s = String(self).unicodeScalars
        return Int(s[s.startIndex].value)
    }
}



//
//let ptrn = "abcdabca".map { $0.asASCII }
//print(ptrn)
//let lps = computeLongestPrefixSufix(pattern: ptrn, M: ptrn.count)
//print(lps)


//
let a = "interviews".map { $0.asASCII }
let b = "interviewseiwcombvinterviewskrenlzp".map { $0.asASCII }


//let a = "ABABCABAB".map { $0.asASCII }
//let b = "ABABDABACDABABCABABABABCABABXXABABCABAB".map { $0.asASCII }
KMPSearch(text: b, pattern: a)



