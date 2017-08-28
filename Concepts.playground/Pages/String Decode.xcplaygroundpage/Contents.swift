//: [Previous](@previous)

import Foundation

/*
 def find_strings(x):
 nums = []
 prev = ""
 total = 0
 for i in str(x):
 if int(i) != 0:
 total += 1
 nums.append(int(i))
 if prev:
 if int(prev + i) != int(i) and int(prev+i) < 27:
 total += 1
 nums.append(int(prev+i))
 prev = i
 return total, nums
*/

class Solution {
    func numberOfDecodings(_ s: String) -> Int {
        var total = 0
        let digits = s.characters.flatMap({ Int(String($0)) })

        var i = 0
        while i < digits.count {
            if digits[i] != 0 { total += 1 }

            if i < digits.count - 1 {
                if digits[i] + digits[i + 1] < 27 {
                    total += 1
                }
            }

            i += 1
        }

        return total
    }

    func numDecodings(_ s: String) -> Int {
        let n = s.characters.count

        if n == 0 || n == 1 {
            return n
        }


        let pair = s.substring(from: s.index(s.startIndex, offsetBy: 2))
        let val = Int(pair) ?? 0

        let next = s.substring(from: s.index(after: s.startIndex))
        return numDecodings(next) + (val < 27 ? numDecodings(s.substring(from: s.index(s.startIndex, offsetBy: 1))) : 0)
    }
}

let s = Solution()
s.numDecodings("1234")

//: [Next](@next)
