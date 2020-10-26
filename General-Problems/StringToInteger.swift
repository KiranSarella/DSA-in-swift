/*
    ref: https://www.youtube.com/watch?v=FyTpsuWAoc8

    Convert String to Integer

    constaints:
    1. leading spaces allowed
    2. negative numbers allowed
    3. number capacity 32 bit signed integer
    4. limits: INT_MAX (2^31 - 1), INT_MIN (-2^31)
    5. If start from char - return 0. parse until white space occurs on the number string

    ex: 
    "25" -> -25
    "-25" -> -25
    "   25    chars ." -> 25
    "chars 25  " -> 0

*/


/*

    solution:
    1. take each character number, convert to integer, add to total
    2. shift total to left (_ * 10)
    3. add new number
    4. repeat

*/

func atoi(_ string: String) -> Int32 {

    var i = 0
    let n = string.count
    let chars = Array(string)
    // skip leading white spaces
    while i < n, chars[i] == " " {
        i += 1 // skip
    }
    if (i >= n) {
        return 0
    }
    // sign
    var sign:Int32 = 1
    if chars[i] == "+" || chars[i] == "-" {
        sign = (chars[i] == "+") ? +1 : -1
        i += 1
    }


    // allow only valid chars
    let isValidCharNumber = { (_ char: Character) -> Bool in
        return chars[i] > "0" && chars[i] < "9"
    }

    // check overflow of a number
    func willExceed(_ char: Character) -> Bool {
        // check if number after left shift will exceeds
        func exceedAfterShift(_ number: Int32) -> Bool {
            return number > Int32.max / 10
        }

        // check if nuber after left shift not exceeds, 
        //      but check if exceeds after adding next charNumber
        func exceedAfterAddingNewNumber(_ new: Int32, _ number: Int32) -> Bool {
            return exceedAfterShift(number) && (new > (Int32.max % 10))
        } 

        if exceedAfterShift(number) || exceedAfterAddingNewNumber(Int32(String(chars[i]))!, number) {
            return true
        }

        return false
    }
    
    
    // convert string to number
    var number: Int32 = 0
    
    while i < n, isValidCharNumber(chars[i]) {
        // if overflow/underflow return int max or int min
        if willExceed(chars[i]) {
            return sign == 1 ? Int32.max : Int32.min
        }

        number *= 10 // left shift number place
        number += Int32(String(chars[i]))!  // convert char to int and add to number
        i += 1
    }

    return number * sign
}


print(atoi("-3147483647"))
print(atoi("25"))
print(atoi("   -25   "))
print(atoi("prefix -25"))
print(atoi("-25 sufix"))
