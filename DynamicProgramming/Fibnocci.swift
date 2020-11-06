

// solve using tabulation

func fib(of n: Int) -> Int {

    var mem = [Int](repeating: 0, count: n)
    // initial values
    mem[0] = 0
    mem[1] = 1
    // f(i) = f(i - 1) + f(i - 2)
    for i in 2..<n {
        mem[i] = mem[i - 1] + mem[i - 2]
    }

    return mem[n-1]
}



// optimize Space using two variables
func optimizedFib(of n: Int) -> Int {

    // initial values
    var previousFib = 0
    var currentFib = 1
    
    // f(new) = f(current) + f(prev)
    for _ in 2..<n {
        let newFib = currentFib + previousFib
        // do right shift
        previousFib = currentFib
        currentFib = newFib
    }

    return currentFib
}


print(fib(of: 10))
print(optimizedFib(of: 10))