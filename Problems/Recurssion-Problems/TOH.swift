import Foundation



// ref: https://www.youtube.com/watch?v=rVPuzFYlfYE

public func move(_ disks: Int, _ fromPole: Character, _ toPole: Character, _ sparePole: Character) {
    
    if disks == 1 {
        print("Move from \(fromPole) to \(toPole)")
        return
    }
    // move n - 1 disks from fromPole to sparePole
    move(disks - 1, fromPole, sparePole, toPole)
    // move last disk from fromPole to toPole
    move(1, fromPole, toPole, sparePole)
    // move all sparePole disks to toPole
    move(disks - 1, sparePole, toPole, fromPole)
}


// usage


move(3, "S", "D", "T")

