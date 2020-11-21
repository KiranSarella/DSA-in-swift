// Diagonal Traversal of Matrix
/*
Given a 2D matrix of size NxN, print the sum of the elements of all its diagonals.

Sample Input:
3
-5 0 4 
2 8 -6 
3 7 1

Sample Output
4 -6 4 9 3
*/

import Foundation

func diagnolTravesalOf(matrix mat: [[Int]], size: Int) {
    // Traversal column diagnol
    for columnLine in (0 ..< size).reversed() {
        var row = 0, column = columnLine
        var diagnolSum = 0
        while column < size {
            //print(mat[row][column], terminator: " ")
            diagnolSum += mat[row][column]
            row += 1
            column += 1
        }
        print(diagnolSum, terminator: " ")
    }
    // Traversal row diagnol
    for rowLine in (1 ..< size) {
        var row = rowLine, column = 0
        var diagnolSum = 0
        while row < size {
            //print(mat[row][column], terminator: " ")
            diagnolSum += mat[row][column]
            row += 1
            column += 1
        }
        print(diagnolSum, terminator: " ")
    }
    print()
    
    
}

/*
// Read number of test cases
let tcs = Int(readLine()!)!
// Read each test case
for _ in 0 ..< tcs {
    // Read matrix size
    let size = Int(readLine()!)!
    var matA = [[Int]]()
    // Read each row
    for _ in 0 ..< size {
        let lineString = readLine()!.trimmingCharacters(in: .whitespaces)
        let rowValues = lineString.components(separatedBy: " ").map{ Int($0)! }
        matA.append(rowValues)
    }
    
    // Calculate diagnol sums
    diagnolTravesalOf(matrix: matA, size: size)
}
*/



