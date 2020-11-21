//: Playground - noun: a place where people can play

import UIKit


// http://www.keithschwarz.com/binary-subsets/
// https://www.youtube.com/watch?v=xTNFs5KRV_g
// https://www.youtube.com/watch?v=nYFd7VHKyWQ


func printSubSetInLexical(_ input: [String], _ current: Int = 0, _ result: [String] = [String]()) {
    var result = result
    // print result
//    for c in result {
//        print(c, terminator: " ")
//    }
//    if !result.isEmpty {
//        print()
//    }
    
    for i in current ..< input.count {
//        // skip duplicates
//        if i != current && input[i] == input[i - 1] {
//            continue
//        }
        
        result.append(input[i])
        for c in result {
            print(c, terminator: " ")
        }
        print()
        printSubSetInLexical(input, i + 1, result)
        result.removeLast()
    }
    
}



var inputC = ["1", "2", "3", "4", "5"]
var buffer = [String]()

printSubSetInLexical(inputC)

func subsetsNew(_ input: [String], _ pos: Int, _ res: [String], _ n: Int) {
    
    var res = res
    // base case
    if pos == n - 1 {
        return
    }
    
    
    
    res.append(input[pos])
    print(res)
    subsetsNew(input, pos + 1, res, n)
    res.removeLast()
}

//var inputNew = ["1", "2", "3", "4", "5"]
//subsetsNew(inputNew, 0, [String](), 5)




















