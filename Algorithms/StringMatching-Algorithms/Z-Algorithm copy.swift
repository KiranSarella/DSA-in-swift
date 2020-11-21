/*

    Z[] = Longest substring starting at 'k' which is also prefix of the string

    steps:
    1. {pattern} + $ + {input}
    2. generate z[]
    3. get all the indexes from the z[] where value is equal to pattern.lenght

    z[] steps:
    1. z[0] = 0; prefixHead = 0; lowerBound = 1
    2. iterate (lowerBound..<n) 
        1. find upperBound
        2. insert lowerBound value with matches count
            increment lowerBound
            if mathces are more then zero
                - calculate perfixInndex
                - check prefix value can be place at current lowerBound 
                by checking the boundary condition
                    - if can place, place value in the z[lowerBound]
                        move lowerBound 
                        reduce matches

                prefixIndex = prefixHead - matches
                if z[prefixIndex] + lowerBound < uppperBound {

                }

 
*/

func generateZ(_ input: String) -> [Int] {

    let input = Array(input)
    let n = input.count 
    var z = [Int](repeating: -1, count: n)

    // init
    var prefixHead = 0
    var lowerBound = 0

    z[lowerBound] = 0
    lowerBound += 1

    var upperBound = lowerBound
 
    for current in 1..<n {

        print("------> \(current), [\(lowerBound): \(upperBound)]")
        print((0..<n).map {"\($0)"})
        print(input)
        print(z.map{ "\($0)"})

        if current > upperBound {
            print("OUTSIDE BOX")
            // find pattern from current
            lowerBound = current
            upperBound = current
            prefixHead = upperBound - lowerBound
            while (upperBound < n) && (input[upperBound] == input[prefixHead]) {
                upperBound += 1
                prefixHead = upperBound - lowerBound
                print("MATCH")
            }
            z[current] = prefixHead
            print("z[\(current)] = \(prefixHead)")
            // as last comparision failed, valid boundry is
            upperBound -= 1
            print("NEW BOUNDARY: [\(lowerBound):\(upperBound)]")
        } else {
            print("INSIDE THE BOX")
            print(input[lowerBound...upperBound])

            // in middle of some pattern
            prefixHead = upperBound - lowerBound
            print("[\(lowerBound):\(upperBound)], prefixHead: \(prefixHead)")

            // check if previously computed value can be fit within the current boundary
            if z[prefixHead] < upperBound - current + 1 {
                print("USE COMPUTED")
                z[current] = z[prefixHead]
                print("z[\(current)] = z[\(prefixHead)]")
            } else {
                print("DO NEW COMPARISION")
                // start comparing
                lowerBound = current
                prefixHead = upperBound - lowerBound
                while (upperBound < n) && (input[upperBound] == input[prefixHead]) {
                    upperBound += 1
                    prefixHead = upperBound - lowerBound
                }
                z[current] = prefixHead
                print("z[\(current)] = \(prefixHead)")
                // as last comparision failed, valid boundry is
                upperBound -= 1
            }


        }
    }
    

    // for lowerBound in 1..<n {

    //     if lowerBound > upperBound {
    //         print("inside of upper bound calc")
    //         // find upper bound
    //         while (input[prefixHead] == input[upperBound]) && upperBound < n {
    //             prefixHead += 1
    //             upperBound += 1
    //         }
    //         print(prefixHead, upperBound)
    //     }

    //     // insert matches count to current (lowerBound)
    //     var matchedCount = upperBound - lowerBound
    //     if matchedCount > 0 {
    //         print("matched count", matchedCount)
    //         // try if we can insert already computed prefix values
    //         var valueIndex = prefixHead - matchedCount
            
    //         if z[valueIndex] + lowerBound < upperBound {
    //             // previously computed value is within the boundary. so insert
    //             z[lowerBound] = z[valueIndex]
    //         } else {
    //             // if exeeds boundary. 
    //             // start a new comparision
    //             prefixHead = 0
                
    //         }

    //     } else {
    //         print("else ")
    //         z[lowerBound] = prefixHead
    //     }
    // }


    return z
}



func zAlgorithm(_ pattern: String, _ input: String) -> [Int] {

    // {pattern} + $ + {input}
    let input = pattern + "x" + input

    let z = generateZ(input)
    print(z)

    let startingIndices =  z.filter { $0 == pattern.count }


    return startingIndices   // matched starting indices
}


let input = "abcabzabc"
let pattern = "abc"

// let input = "aayaab"
// let pattern = "aab"
let result = zAlgorithm(pattern, input)
print(result)