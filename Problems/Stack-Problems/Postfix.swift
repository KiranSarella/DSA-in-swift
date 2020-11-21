
import Foundation
import Stack

public class EvaluateExpression {
    
    var stack: Stack<Int> = Stack()
    
    public init() {
        
    }
    
    public func evaluatePostfix(expression: String) -> Int {
        
        
        for c in expression {
            // stack.printStack()
            if let digit = Int(String(c)) {
                stack.push(digit)
            } else {
                
                // pop two operands
                let b = stack.pop()!
                let a = stack.pop()!
                
                switch c {
                case "+":
                    stack.push(a + b)
                case "-":
                    stack.push(a - b)
                case "*":
                    stack.push(a * b)
                case "/":
                    stack.push(a / b)
                    
                default:
                    print("undefined element fount")
                }
            }
        }
        
        let result: Int = stack.pop()!
        
        return result
    }
}

// USAGE

let evaluater = EvaluateExpression()
let res = evaluater.evaluatePostfix(expression: "231*+9-")
print(res)

