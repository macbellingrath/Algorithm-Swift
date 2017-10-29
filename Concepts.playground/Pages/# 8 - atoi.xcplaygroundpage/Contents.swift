//: [Previous](@previous)

import Foundation


class Solution {
    func myAtoi(_ str: String) -> Int {
        let str = Array(str.trimmingCharacters(in: .whitespaces).characters)

        if str.isEmpty {
            return 0
        }


        let firstCharacter = str[0]
        var sign = 1, start = 0, length = str.count

        if firstCharacter == "+" {
            start += 1
        } else if firstCharacter == "-" {
            sign = -1
            start += 1
        }

        let isPositive = sign == 1
        var sum = 0

        for i in start..<length {
            guard let num = Int(String(str[i])) else {
                return sum * sign
            }

            sum = sum * 10 + num

            if sum > Int(Int32.max) && isPositive {
                return Int(Int32.max)
            } else if -sum < Int32.min  {
                return Int(Int32.min)
            }
        }

        return sum * sign
    }
}


// test input 
// "0"
let s = Solution()
s.myAtoi("91209301923019301923")


//: [Next](@next)
