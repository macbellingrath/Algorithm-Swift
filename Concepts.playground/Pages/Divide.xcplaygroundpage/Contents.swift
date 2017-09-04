//: [Previous](@previous)

import Foundation

/*
 Divide two integers without using multiplication, division and mod operator.

 If it is overflow, return MAX_INT.
 */

class Solution {

    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if ((divisor == 0) ||
            (dividend == .min && divisor == -1)) {
            return .max
        }

        let isNegative = (dividend < 0 && !(divisor < 0)) ||
            (!(dividend < 0) && divisor < 0)

        var answer = 0

        var dividend = abs(dividend)
        let divisor = abs(divisor)

        while dividend >= divisor {
            var temp = divisor
            var multiple = 1

            while dividend >= (temp << 1) {
                multiple <<= 1
                temp <<= 1
            }

            answer += multiple
            dividend -= temp
        }


        return  isNegative ? -answer : answer
    }
}

// test
let s = Solution()
//s.divide(10, 3)
//s.divide(0, 2)
//s.divide(0, 0)
//s.divide(1, -1)

s.divide(
    -2147483648,
    -1)
//: [Next](@next)
