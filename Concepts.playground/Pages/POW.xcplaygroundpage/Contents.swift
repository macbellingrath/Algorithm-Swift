//: [Previous](@previous)

import Foundation

func myPow(_ x: Double, _ n: Int) -> Double {
    var x = x
    var answer:Double = 1
    var absN = abs(n)

    while absN > 0 {
        if (absN&1) == 1  {
            answer *= x
        }

        absN >>= 1
        print(absN)
        x *= x
    }

    return n < 0 ? 1/answer : answer
}

let x = myPow(5,2)

//: [Next](@next)
