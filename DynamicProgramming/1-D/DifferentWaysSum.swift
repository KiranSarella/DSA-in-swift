/**

    Given n, find the number of different ways to write n as the sum of 1, 3, 4;

    n = 5; output: 6


    D(n) = D(n-1) + D(n-3) + D(n-4)
*/



func differentWays(_ n: Int) -> Int64 {
    
    // base case
    if n <= 0 {
        return 0
    }

    if n == 1 || n == 2 {
        return 1
    }
    if n == 3 {
        return 2
    }

    // initial values
    var d = [Int64](repeating: 0, count: n + 1)
    d[0] = 1
    d[1] = 1
    d[2] = 1
    d[3] = 2

    for i in 4...n {
        d[i] = d[i-1] + d[i-3] + d[i - 4]     
    }

    print(d)
    return d[n]
}

print(differentWays(5))
print(differentWays(6))
print(differentWays(50))



















