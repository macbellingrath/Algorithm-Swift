//: [Previous](@previous)

import Foundation

infix operator ^
func ^ (l: Bool, r: Bool) -> Bool {
    return l != r
}

// e.g.
(true ^ true) == false
(true ^ false) == true
(false ^ true) == true
(false ^ false) == false

/*
 Divide two integers without using multiplication, division and mod operator.

 If it is overflow, return MAX_INT.
 Both dividend and divisor will be 32-bit signed integers.
 The divisor will never be 0.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.
 */

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == Int32.min, divisor == -1 {
            return Int(Int32.max)
        }

        var dividend = dividend
        var divisor = divisor

        let sign = (dividend < 0) ^ (divisor < 0) ? -1 : 1
        dividend = abs(dividend)
        divisor = abs(divisor)

        var quotient = 0
        var temp = 0

        for i in stride(from: Int32.bitWidth - 1, through: 0, by: -1) {
            if (temp + (divisor << i)) <= dividend {
                temp += (divisor << i)
                quotient |= 1 << i
            }
        }

        return sign * quotient
    }
}

let solution = Solution()

solution.divide(10, 3) == 3
//: [Next](@next)
Int32.min
