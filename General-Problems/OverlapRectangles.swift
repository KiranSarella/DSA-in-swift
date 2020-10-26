import Foundation

/*
 
 Given 2 rectangles parallel to coordinate axes, find the area covered by them.
 
 First line of input contains T - number of test cases. Its followed by 2T lines. First line of each test case contains 4 integers - xbl, ybl, xtr, ytr - the bottom-left and top-right coordinates of rectangle-1. The second line of each test case contains 4 integers - xbl, ybl, xtr, ytr - the bottom-left and top-right coordinates of rectangle-2.
 
Input
 
 4
 2 5 4 6
 1 2 5 4
 -4 -3 -2 5
 -3 -5 1 3
 1 0 3 5
 2 3 5 8
 -2 2 4 4
 -3 1 5 5
 
Output
 
 10
 42
 23
 32
 
 */

import Foundation

func computeArea(_ rect: [Int]) -> Int {
    let w = rect[2] - rect[0]
    let h = rect[3] - rect[1]
    let a = w * h
    return a
}

func overlapArea(x1: Int, y1: Int, x2: Int, y2: Int, a1: Int, b1: Int, a2: Int, b2: Int) -> Int {
    
    // Check if there is no overlap.
    if a1 >= x2 || // rect2 is right of rect1
        a2 <= x1 || // rect2 is left of rect1
        b1 >= y2 || // rect2 is top of rect1
        b2 <= y1 { // rect2 is bottom of rect1
        return 0
    }
    
    // bottom left point of the overlapping area.
    let blx = max(x1, a1)
    let bly = max(y1, b1)
    
    // top right point of the overlapping area.
    let trx = min(x2, a2)
    let try1 = min(y2, b2)
    
    return (trx - blx) * (try1 - bly)
    
}


func findAreaCovered(rect1: [Int], rect2: [Int]) -> Int {
    // area of rect1
    let a1 = computeArea(rect1)
    // print("a1: ", a1)
    // area of rect2
    let a2 = computeArea(rect2)
    // print("a2: ", a2)
    // overlapping rect
    let oa = overlapArea(x1: rect1[0], y1: rect1[1], x2: rect1[2], y2: rect1[3], a1: rect2[0], b1: rect2[1], a2: rect2[2], b2: rect2[3])
    
    // print("oa: ", oa)
    return a1 + a2 - oa
}

// test cases
/*
let t = Int(readLine()!)!
for _ in 0 ..< t {
    let arr1 = readLine()!.split(separator: " ").map { Int($0)! }
    let arr2 = readLine()!.split(separator: " ").map { Int($0)! }
    let totalArea = findAreaCovered(rect1: arr1, rect2: arr2)
    print(totalArea)
}
*/









