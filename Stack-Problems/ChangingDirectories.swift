/*
 
 2
 8
 pwd
 cd /home/user/bansalam/desktop/
 pwd
 cd ../../rai/desktop/
 pwd
 cd /home/
 cd os/labs/
 pwd
 5
 cd /sem/networks/labs/
 cd ../../os/labs/../slides/
 pwd
 cd /
 pwd
 
 /
 /home/user/bansalam/desktop/
 /home/user/rai/desktop/
 /home/os/labs/
 
 /sem/os/slides/
 /
 
 
 */



import Foundation

var directories = [String]()

public func execute(_ line: String) {
    if line == "pwd" {
        if directories.isEmpty {
            print("/")
        } else {
            print("/", directories.joined(separator: "/"), "/", separator: "")
        }
    } else {
        // cd
        var command = line.split{ $0 == " " }
        let newCmd = String(command[1])
        // if first line is /, then clear directories. ie cd /
        if newCmd.first! == "/" {
            directories.removeAll()
        }
        let path = newCmd.split { $0 == "/" }
        for i in 0 ..< path.count {
            let cmd = path[i]
            if cmd == ".." {    // cd ..
                directories.removeLast()
            } else {    // cd /dirname/
                directories.append(String(cmd))
            }
        }
    }
}

//let newLine = "/home/kiran/"
//newLine[newLine.startIndex]
//newLine.first!


/*
// read number of testcases
let t = Int(readLine()!)!
for _ in 0 ..< t {
    let n = Int(readLine()!)!
    for _ in 0 ..< n {
        execute(readLine()!)
    }
    print() // new line
    directories.removeAll() // clear stack
}
 */
