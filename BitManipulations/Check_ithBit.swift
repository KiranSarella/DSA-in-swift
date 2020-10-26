
func get(ithBit i: Int, inNumber n: Int) -> Int {
    if n & (1 << i) == 0 {
        return 0
    } else {
        return 1
    }
}

func alternateGet(ithBit i: Int, inNumber n: Int) -> Int {
    if (n >> i) & 1 == 0 {
        return 0
    } else {
        return 1
    }
}


var n = 0b0101   // 5
get(ithBit: 0, inNumber: n)
get(ithBit: 1, inNumber: n)
alternateGet(ithBit: 2, inNumber: n)
alternateGet(ithBit: 3, inNumber: n)


