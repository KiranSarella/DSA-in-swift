//: Equal Stacks
/*
Sample Input
 
5 3 4
3 2 1 1 1
4 3 2
1 1 4 1
 
Sample Output
 
5
 */

import Foundation

let inputsSize = readLine()!.components(separatedBy: " ").map { Int($0)! }

var x = 0, y = 0, z = 0
var n1 = [Int]()
var n2 = [Int]()
var n3 = [Int]()

for c in readLine()!.components(separatedBy: " ") {
    let value = Int(c)!
    n1.append(value)
    x += value
}
for c in readLine()!.components(separatedBy: " ") {
    let value = Int(c)!
    n2.append(value)
    y += value
}
for c in readLine()!.components(separatedBy: " ") {
    let value = Int(c)!
    n3.append(value)
    z += value
}

var i = 0, j = 0, k = 0


while (x != y) || (y != z) || (z != x) {    // loop until all stack tops are equal
    // possiblites ex: 5 3 2, 5 5 3, 5 3 5
    if (x > y) && (x > z) || (x == y) && (x > z) || (x == z) && (x > y) {
        x -= n1[i]
        i += 1
    }
    if (y > z) && (y > x) || (y == z) && (y > x) || (y == x) && (y > z) {
        y -= n2[j]
        j += 1
    }
    if (z > x) && (z > y) || (z == x) && (z > y) || (z == y) && (z > x) {
        z -= n3[k]
        k += 1
    }
}
print(x)
























