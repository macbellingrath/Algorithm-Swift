//: [Previous](@previous)

import Foundation

class Solution {
    func addBinary(_ lhs: String,
                   _ rhs: String) -> String {

        // can't subscript swift strings in O(1)
        let lhsChars = Array(lhs.characters)
        let rhsChars = Array(rhs.characters)
        var i = lhsChars.count - 1
        var j = rhs.characters.count - 1

        var sum = 0, carry = 0, res = ""

        while (i >= 0) || (j >= 0) || carry > 0 {
            sum = carry

            if i >= 0 {
                sum += Int(String(lhsChars[i]))!
                i -= 1
            }

            if j >= 0 {
                sum += Int(String(rhsChars[j]))!
                j -= 1
            }

            carry = sum / 2
            sum = sum % 2
            res = String(sum) + res
        }

        return res
    }
}

let x = String(10, radix: 2)
let y = String(12, radix: 2)

let s = Solution()
let answer = s.addBinary(x, y)
print(answer)

print(
    Int(answer, radix: 2)!
)

//: [Next](@next)
