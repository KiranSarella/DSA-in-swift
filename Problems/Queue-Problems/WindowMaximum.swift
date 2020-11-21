// ref: https://www.youtube.com/watch?v=39grPZtywyQ
// https://www.geeksforgeeks.org/sliding-window-maximum-maximum-of-all-subarrays-of-size-k/

public func getMaxWindowSum(arr: [Int], n: Int, k: Int) -> Int {
    
    var window = [Int]()    // deque
    var sum = 0
    
    // first window
    for i in 0 ..< k {
        while (window.isEmpty == false) && arr[i] >= arr[window.last!] {
            window.removeLast()
        }
        window.append(i)
    }
    //print(window)
    // remaining windows
    for i in k ..< n {
        //  print(arr[window[0]])
        sum += arr[window[0]]
        // Remove the elements which are out of this window
        while (window.isEmpty == false) && window[0] <= i - k {
            window.removeFirst()
        }
        // Remove all elements smaller than the currently being added element
        while window.isEmpty == false && arr[i] >= arr[window.last!] {
            window.removeLast()
        }
        //  Add current element at the rear of deque
        window.append(i)
        //print(window)
    }
    // print(arr[window[0]])
    //print(window)
    sum += arr[window[0]]
    
    return sum
}

// read test cases
//let t = Int(readLine()!)!
//for _ in 0 ..< t {
//
//    let arr = readLine()!.split(separator: " ").map { Int($0)! }
//    let integersArr = readLine()!.split(separator: " ").map { Int($0)! }
//
//    let result = getMaxWindowSum(arr: integersArr, n: arr[0], k: arr[1])
//    print(result)
//}



