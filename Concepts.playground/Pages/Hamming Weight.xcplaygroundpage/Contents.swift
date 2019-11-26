//: [Previous](@previous)

import Foundation
class Solution {
    func hammingWeight(_ n: UInt32) -> Int {
        var res = 0
        var num: UInt32 = 1
        while num < UInt32(1 << 31) {
            print(num)
            if (n & num) > 0 {
                res += 1
            }
            num <<= 1
        }
        return res
    }

    func hammingWeight2(_ n: UInt32) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            n &= n - 1
            count += 1
        }
        return count
    }
}

let s = Solution()
s.hammingWeight(0x00000000000000000000000000001011)
//: [Next](@next)
