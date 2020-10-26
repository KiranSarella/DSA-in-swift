
// Check if 2 given two signed integers are of the same sign.

func sameSign(a: Int, b: Int) -> Bool {
    return (a ^ b) >= 0
}

// 5: 0 000 0101
// 6: 0 000 0110
// ^: 0 000 0011 = 3 > 0
sameSign(a: 5, b: 6)

//-4: 1 111 1100        124 - 128 = -4
// 6: 0 000 0110
// ^: 1 111 1010        122 - 128 = -6 < 0
-4 ^ 6
sameSign(a: -4, b: 6)

//-1: 1 111 1111        127 - 128 = -1
//-7: 1 111 1001        121 - 128 = -7
// ^: 0 000 0110        6 > 0
-1 ^ -7
sameSign(a: -1, b: -7)


//..
let a: Int8 = 0b0000010
let b: Int8 = 0b1111100

(b - Int8.max) - 1
