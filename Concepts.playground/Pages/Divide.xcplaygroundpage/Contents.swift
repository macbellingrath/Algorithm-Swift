//: [Previous](@previous)

import Foundation

/*
 Divide two integers without using multiplication, division and mod operator.

 If it is overflow, return MAX_INT.
 */

class Solution {

    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isNegative = (dividend < 0 && !(divisor < 0)) || (!(dividend < 0) && divisor < 0)
        var answer = 0

        var dividend = abs(dividend)
        let divisor = abs(divisor)

        while dividend >= divisor {
            var temp = divisor
            var i = 1

            while dividend >= temp {
                dividend -= temp
                answer += 1
                i <<= 1
                temp <<= 1
            }
        }

        if isNegative {
            answer = -answer
        }

        return answer
    }
}

// test
let s = Solution()
s.divide(10, 3)
s.divide(0, 2)
s.divide(0, 0)
s.divide(1, -1)
s.divide(1, 2)
//: [Next](@next)
