import Foundation

// ref: https://www.youtube.com/watch?v=siKFOI8PNKM

func printSpiral(_ mat: [[Int]], _ n: Int) {
    var output = ""
    var top = 0, bottom = n - 1, left = 0, right = n - 1
    
    enum Direction {
        case right
        case bottom
        case left
        case up
        
        mutating func next() {
            switch self {
            case .right:
                self = .bottom
            case .bottom:
                self = .left
            case .left:
                self = .up
            case .up:
                self = .right
            }
        }
    }
    
    var dir = Direction.right
    while (top <= bottom && left <= right) {
        
        switch dir {
        case .right:
            for i in left ... right {
                output.append("\(mat[top][i]) ")
            }
            top += 1
        case .bottom:
            for i in top ... bottom {
                output.append("\(mat[i][right]) ")
            }
            right -= 1
        case .left:
            for i in (left ... right).reversed() {
                output.append("\(mat[bottom][i]) ")
            }
            bottom -= 1
        case .up:
            for i in (top ... bottom).reversed() {
                output.append("\(mat[i][left]) ")
            }
            left += 1
        }
        
        dir.next()
    }
    
    print(output)
}


// Read test case
/*
let t = Int(readLine()!)!
for _ in 0 ..< t {
    let n = Int(readLine()!)!
    var mat = [[Int]]()
    for i in 0 ..< n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        mat.insert(row, at: i)
    }
    printSpiral(mat, n)
}
 */
