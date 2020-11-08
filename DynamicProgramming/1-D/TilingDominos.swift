/**

    https://www.geeksforgeeks.org/tiling-with-dominoes/

    Given a 3 x n board, find the number of ways to fill it with 2 x 1 dominos.

    observations:

    - cannot complete for odd length board (so 'n' must be even length)
    - for even lenght, the block will be completely filled (An)
    - for odd length, the block is partially filled (Bn) - 2 ways

    next even block (An) can we filled using --> 
        previously completed even block (x ways) OR 
        partially filled odd block (2  (Bn ways))
    (we need total possible ways --> x ways + 2 (Bn ways)

    An (completely filled) = A(n-2) (previous completly filled) + 2 * (B(n-1) (partially filled)) 


    next odd block (Bn) can we filled using -->
        previously completed even block (x ways)
        previous partially filled odd block  (y ways)
    (we need total possible ways --> x + y ways)

    Bn (partially filled) = A(n-1) (previous completly filled) + B(n-1) (previously partially filled)

*/

/*
func countWays(_ n: Int) -> Int {


    var evenFilledBlocks = [Int](repeating: 0, count: n + 1)
    var oddFilledBlocks = [Int](repeating: 0, count: n + 1)

    evenFilledBlocks[0] = 1
    evenFilledBlocks[1] = 0 //(0 way)
    oddFilledBlocks[0] = 0
    oddFilledBlocks[1] = 1

    for i in 2...n {
        evenFilledBlocks[i] = evenFilledBlocks[i - 2] + (2 * oddFilledBlocks[i - 1])
        oddFilledBlocks[i] = evenFilledBlocks[i - 1] + oddFilledBlocks[i - 2]
    }

    print(evenFilledBlocks)
    print(oddFilledBlocks)

    return evenFilledBlocks[n]
}
*/


func countWays(_ n: Int) -> Int {

    var mem = [Int](repeating: 0, count: n + 1)

    evenFilledBlocks[0] = 1
    evenFilledBlocks[1] = 0     // no odd filled blocks at odd n position
    oddFilledBlocks[0] = 0      // no odd filled blocks at even n position
    oddFilledBlocks[1] = 1

    for i in 2...n {
        evenFilledBlocks[i] = evenFilledBlocks[i - 2] + (2 * oddFilledBlocks[i - 1])
        oddFilledBlocks[i] = evenFilledBlocks[i - 1] + oddFilledBlocks[i - 2]
    }

    print(evenFilledBlocks)
    print(oddFilledBlocks)

    return evenFilledBlocks[n]
}

print(countWays(8))


print(countWays(8))












