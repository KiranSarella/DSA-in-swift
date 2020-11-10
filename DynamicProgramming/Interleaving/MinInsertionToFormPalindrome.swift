/**

    Minimum Insertion To Form Palindrome String

    https://www.youtube.com/watch?v=DOnK40BvazI

    https://www.geeksforgeeks.org/minimum-insertions-to-form-a-palindrome-dp-28/


    if left most is equal to right most, zero insertions (ex: aa) 
    if left most is not equal to right most, 1 insertion (ex: ab) 
    min (l, r-1), (l-1, r) + 1
    ex: 
    if  [0, 1] = 1;
        [1, 2] = 1;
    then 
        [0, 2] = min [0, 1], [1, 2]


*/


func findMinInsertionsDP(_ input: String) -> Int {

    let input = Array(input)
    let n = input.count

    // create a table of size n*n. 
    // dp[i][j] will store min number of insertions (i -> range start, j -> range end)
    // needed to convert input[i..j] to a palindrom

    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n) // n*n 

    for length in 1..<n {
        var l = 0   // left bound
        var r = length  // right bound
        while r < n {

            if input[l] == input[r] {
                // if left and right most bounds are equal, 
                // then consider previous sub range value
                dp[l][r] = dp[l+1][r-1]
            } else {
                // if current left and right most bounds are not equal,
                // then consider min of left bound sub range [l, r-1] or right bound sub range [l-1, r]
                dp[l][r] = min(dp[l][r-1], dp[l+1][r]) + 1
            }

            // next range box
            l+=1
            r+=1
        }
    }

    print(dp)
    return dp[0][n-1]
}



print(findMinInsertionsDP("abcde"))
print(findMinInsertionsDP("ab"))
print(findMinInsertionsDP("aba"))
print(findMinInsertionsDP("abb"))