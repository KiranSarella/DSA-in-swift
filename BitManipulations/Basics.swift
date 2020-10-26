

import Foundation

// left shift
var a = 29
a = a << 3  // a * 2^3
var b = 29
b = b * (2 * 2 * 2)

// right shift
a >> 3
b / (2 * 2 * 2)

/// Bit Tricks

// x & (x-1)    # will clear the lowest set bit of x
var x = 13          // 1101
x = x & (x - 1)     // 1101 & 1100 = 1100   (cleared 0th bit)
x = x & (x - 1)     // 1100 & 1011 = 1000   (cleared 2nd bit)

// x & ~(x-1)   # extracts the lowest set bit of x (all others are clear).
var y = 12          // 1100
y = y & ~(y - 1)    // 1100 & 0100 = 0100   (extracted 2nd bit)

// x | (x + 1)  # x  with the lowest cleared bit set.
var z = 9           // 1001
z | (z + 1)         // 1001 | 1010 = 1011

// x | ~(x + 1) # extracts the lowest cleared bit of x (all others are set).
var k = 9           // 1001
k | ~(k + 1)        // 1001 | 0101 = 1101   (except 1st bit, all are set)



// https://www.topcoder.com/community/data-science/data-science-tutorials/a-bit-of-fun-fun-with-bits/


var p = 6       // 0110
var q = 11      // 1011
// Set union
p | q           // 1111
// Set intersection
p & q           // 0010
// Set subtraction
p & ~q          // 0100
// Set negation
15 ^ p          // 1111 ^ 0110 = 1001
// Set bit
// a | (1 << bit):  11 -> 1011, set 0 to 1, so
var position = 2
0b1011 | (1 << position) //  1111
// Clear bit
// A & ~(1 << bit): 10 -> 1010, clear 3rd bit.
position = 3
0b1010 & ~(1 << position)   // 0010

// Test bit
// (A & 1 << bit) != 0
10 & (1 << 2) == 0      // 1010: 2nd bit is 0
0b0010 & (1 << 1) == 1       // 0010: 1st bit is 1





