//: [Previous](@previous)

import Foundation
/*
 41. First Missing Positive
 Given an unsorted integer array, find the smallest missing positive integer.

 ex

 Input: [1,2,0]
 Output: 3

 Input: [3,4,-1,1]
 Output: 2

 Input: [7,8,9,11,12]
 Output: 1
 Note:

 Your algorithm should run in O(n) time and uses constant extra space.
 */
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var lowest = 1
        while numSet.contains(lowest) {
            lowest += 1
        }
        return lowest
    }
}

let solution = Solution()
solution.firstMissingPositive([1,2,0])
solution.firstMissingPositive([3,4,-1,1])
solution.firstMissingPositive([7,8,9,11,12])

//: [Next](@next)
