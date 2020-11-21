/*

1. generate sufixPrefix[] for the given pattern
2. compare with main string and increment heads
3. if match failed, move head of substing to its current location - prefix starting position
4. repeat


Time: O (m + n)
Space: O(n)

*/


/// generate prefix for pattern
func generateSufixPrefixArray(_ pattern: String) -> [Int] {


    let patternArr = Array(pattern)
    let patternCount = pattern.count
    var sufixPrefixArr = [Int](repeating: 0, count: patternCount)

    var start = 0
    var next = 1

    while next < patternCount {
        // if start and next are same
        if patternArr[start] == patternArr[next] {
            // prefix of next is (start + 1) index
            sufixPrefixArr[next] = start + 1
            // move start to next char
            start += 1
            // move next to next char
            next += 1
        } else {

            if start > 0 {
                // move start back to before prefix start
                start = sufixPrefixArr[start - 1]
            } else {
                // no match with start = 0; already 0 while init
                // move next
                next += 1
            }            
        } 
    }
    
    print(sufixPrefixArr)
    return sufixPrefixArr
}

func kmp_pattern_match(_ text: String, _ pattern: String) {

    let sufixPrefixArr = generateSufixPrefixArray(pattern)

    let text = Array(text)
    let pattern = Array(pattern)

    let textCount = text.count
    let patternCount = pattern.count

    var textIndex = 0
    var patternIndex = 0

    while textIndex < textCount && patternIndex < patternCount {
        // if both current text, pattern character match, move both to next char
        if text[textIndex] == pattern[patternIndex] {
            textIndex += 1
            patternIndex += 1
        } else {
            // both text, pattern characters not matched
            // if patternIndex is already at first, move head to start new comparision
            if patternIndex == 0 {
                textIndex += 1
            } else {
                // move patternIndex backward, to start new sub comparision
                patternIndex = sufixPrefixArr[patternIndex - 1]
            }
        }
    }

    print(textIndex, patternIndex)
    if patternIndex == patternCount {
        print("Pattern found at [\(textIndex - patternIndex) : \(textIndex)]")
    } else {
        print("No pattern found")
    }
    
}

// kmp_pattern_match("aaaabcdabcaaaa", "abcdabca")
kmp_pattern_match("aasdfasdsaabxaayaabas", "aabxaayaab")