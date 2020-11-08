

/**

    https://www.youtube.com/watch?v=NnD96abizww

    Given two strings x and y, find the Longest Common Subsequence and print length

    ex: 
    x: ABCBDAB
    y: BDCABC

    BCAB (4)


    - define subproblem
    Dij = x1...i and y1...j

    - find the recurrence
    xi = yi => Di-1,j-1 + 1
    xi != yi => max(Di,j-1, Di-1,j)

    - base cases
    Di0 = D0j = 0


*/


func longestCommonSubsequence(_ x: String, _ y: String) -> String {

    let x = Array(x)
    let y = Array(y)

    let n = x.count
    let m = y.count

    // Initial values
    var dp = [[Int]](repeating: [Int](repeating: -1, count: m + 1), count: n + 1)
    var backtrace = [[(Int, Int, String)]](repeating: [(Int, Int, String)](repeating: (-1, -1, ""), count: m + 1), count: n + 1)
    
    for j in 0...m {
        dp[0][j] = 0
    }
    for i in 0...n {
        dp[i][0] = 0
    }
    
    for i in 1...n {
        for j in 1...m {
            if x[i-1] == y[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
                // backtrace
                backtrace[i][j] = (i-1, j-1, "increment")
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                // backtrace
                backtrace[i][j] = (dp[i-1][j] > dp[i][j-1]) ? (i-1, j, "max") : (i, j-1, "max")
            }
        }
    }

    var pattern = ""
    var i = n
    var j = m
    while i > 0 && j > 0 {
        let (p, q, state) = backtrace[i][j]
        if state == "increment" {
            pattern = "\(x[i-1])\(pattern)"
        }
        i = p
        j = q
    }

    return pattern
}


print(longestCommonSubsequence("ABCBDAB", "BDCABC"))
print(longestCommonSubsequence("abcdaf", "acbcf"))