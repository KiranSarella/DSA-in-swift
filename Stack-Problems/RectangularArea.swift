import Foundation

// ref: https://www.geeksforgeeks.org/largest-rectangle-under-histogram/
// https://www.youtube.com/watch?v=MhQPpAoZbMc

func getMaxArea(heights: [Int], n: Int) -> Int {
    
    var stack = [Int]()
    
    var poppedIndex = 0
    var areaWithPoppedHeight = 0
    var maxArea = 0
    
    var currentHeightIndex = 0
    while currentHeightIndex < n {
        print(stack)
        if stack.isEmpty || heights[stack.last!] <= heights[currentHeightIndex] {
            stack.append(currentHeightIndex)
            currentHeightIndex += 1
        } else {
            poppedIndex = stack.last!
            stack.removeLast()
            
            areaWithPoppedHeight = heights[poppedIndex] * (stack.isEmpty ? currentHeightIndex : currentHeightIndex - stack.last! - 1)
            if areaWithPoppedHeight > maxArea {
                maxArea = areaWithPoppedHeight
            }
        }
    }
    print("---")
    print(stack)
    while stack.isEmpty == false {
        poppedIndex = stack.last!
        stack.removeLast()

        areaWithPoppedHeight = heights[poppedIndex] * (stack.isEmpty ? currentHeightIndex : currentHeightIndex - stack.last! - 1)
        if areaWithPoppedHeight > maxArea {
            maxArea = areaWithPoppedHeight
        }
    }
    
    return maxArea
}



//getMaxArea(heights: [3, 2, 4, 3, 4, 2, 1], n: 7)
getMaxArea(heights: [5, 10, 12, 4], n: 4)

// ref: https://stackoverflow.com/questions/4311694/maximize-the-rectangular-area-under-histogram

func largestRectangleArea(heights: [Int], n: Int) -> Int {
    
    var maxArea = 0
    let heights = [-1] + heights + [-1]
    let n = n + 2
    var stack = [Int]()
    stack.append(0) // first index
    print(heights, n)
    for i in 0 ..< n {
        while heights[i] < heights[stack.last!] {
            let h = heights[stack.last!]
            stack.removeLast()
            let area = h * (i - stack.last! - 1)
            maxArea = max(maxArea, area)
        }
        stack.append(i)
    }
    return maxArea
}

//largestRectangleArea(heights: [5, 10, 12, 4], n: 4)












