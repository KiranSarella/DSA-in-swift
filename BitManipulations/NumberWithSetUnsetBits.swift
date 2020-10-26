/*
Construct a number with x set bits, followed by y unset bits. 1 <= x,y <= 10.
 
 Example:
 x=3, y=5 -> 11100000
 x=2, y=1 -> 110
 
*/

func constructNumber(withSetBits x: Int, andUnsetBits y: Int) -> Int {
    /// left shift x times and remove 1 from it will give all set bits
    /// agian left shift y times will give unset bits.
    return ((1 << x) - 1) << y
}

constructNumber(withSetBits: 2, andUnsetBits: 1)


