import Foundation

func binaryRepresentation(_ n: Int) {
    
    if n == 0 {
        return
    }
    
    binaryRepresentation(n / 2)
    print(n % 2, terminator: "")
}

binaryRepresentation(11)
print()


