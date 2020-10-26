import Foundation

// ref: https://www.youtube.com/watch?v=87ZOHb9NuWM

/*
 Can you use negative numbers in radix sort?
 
 soln 1:
 - You can add on a set value to make all the numbers positive,
 - then sort with radix sort,
 - then subtract the value off all of them at the end.
 disadv:
 - overflow
 
 soln 2:
 - make a division - a section of negative numbers, and a section of of positive numbers.
 - Sort both of them using radix sort,
 - then reverse the negative numbers section and put the lists together
 
 soln 3:
 - using bit operations
 ref:
 http://codercorner.com/RadixSortRevisited.htm
 http://stereopsis.com/radix.html
 https://stackoverflow.com/questions/43701076/radix-sort-optimization
 */

// todo ref: https://www.youtube.com/watch?v=v7glg5GHKRA

/*:
 Time Complexity: O (d(r * n)) -> O(d * n)
 d - max digit length, r - base/radix, n - input length
*/

func getMax(_ arr: [Int]) -> Int {
    
    return arr.reduce(0, {$1 > $0 ? $1 : $0 })
    // or
    //    return arr.reduce(0) { (result, value) -> Int in
    //        return value > result ? value : result
    //    }
}

func findBucketPosition(_ value: Int, _ exp: Int, _ base: Int) -> Int {
    
    return (value / exp) % base
}

func countSort(_ arr: inout [Int], _ n: Int, _ exp: Int) {
    let base = 10 // for decimal numbers
    var output = [Int](repeating: 0, count: n)
    //var i = 0
    var count = [Int](repeating: 0, count: base)
    
    for i in 0 ..< n {
        let position = findBucketPosition(arr[i], exp, base)
        count[position] += 1
    }
    print("count:", count)
    // Change count[i] so that it now contains actual position of this digit in output[]
    for i in 1 ..< base {
        count[i] += count[i - 1]
    }
    print("count:", count)
    // Build the output array
    for i in stride(from: n - 1, through: 0, by: -1) {
        let position = findBucketPosition(arr[i], exp, base)
        //print(position)
        let index = count[position]
        output[index - 1] = arr[i]
        count[position] -= 1
    }
    print("output:", output)
    // Copy the output array to arr[] - contains numbers sorted by current digit
    for i in 0 ..< n {
        arr[i] = output[i]
    }
}

public func radixSort(_ arr: inout [Int], _ n: Int) {
    // Find the maximum number to know number of digits
    let max = getMax(arr)
    // Do counting sort for every digit. Note that instead of passing digit number,
    // exp is passed. exp is 10^i where i is current digit number
    var exponent = 1
    while (max / exponent) > 0 {
        countSort(&arr, n, exponent)
        exponent *= 10
    }
}

// usage


var arr = [25, 15, 5, 55, 90, 40, 2, 0, 10, 1000, 100, 10, 25]

radixSort(&arr, arr.count)



