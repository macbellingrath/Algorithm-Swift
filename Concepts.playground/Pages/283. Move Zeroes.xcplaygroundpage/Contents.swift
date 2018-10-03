//: [Previous](@previous)

import Foundation
/* 283. Move Zeroes
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
*/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var j = 0

        while j < nums.count {
            if nums[j] != 0 {
                nums.swapAt(i, j)
                i += 1
            }
            j += 1
        }
    }
}
var xs = [0,1,2,3,0]

Solution().moveZeroes(&xs)

print(xs)
//: [Next](@next)
