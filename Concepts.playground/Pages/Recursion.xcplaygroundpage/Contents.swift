//: [Previous](@previous)

import Foundation

/*:
 # Recursion

 */


func fibonacci(n: UInt) -> UInt {
    return (n == 0) || (n == 1) ? n : fibonacci(n: n - 2) + fibonacci(n: n - 1)
}

//: [Next](@next)
